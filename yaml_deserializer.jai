get_scalar_text :: (node: *yaml_node_t) -> string {
    v: string;
    v.data  = node.data.scalar.value;
    v.count = cast(s64) node.data.scalar.length;
    return v;
}

find_in_mapping :: (doc: *yaml_document_t, mapping_node: *yaml_node_t, key: string) -> *yaml_node_t {
    pair := mapping_node.data.mapping.pairs.start;
    end  := mapping_node.data.mapping.pairs.top;
    while pair != end {
        key_node := yaml_document_get_node(doc, pair.key);
        if get_scalar_text(key_node) == key {
            return yaml_document_get_node(doc, pair.value);
        }
        pair += 1;
    }
    return null;
}

get_sequence_count :: (seq_node: *yaml_node_t) -> s64 {
    return cast(s64) (seq_node.data.sequence.items.top - seq_node.data.sequence.items.start);
}

get_sequence_item :: (doc: *yaml_document_t, seq_node: *yaml_node_t, index: s64) -> *yaml_node_t {
    item_id := seq_node.data.sequence.items.start[index];
    return yaml_document_get_node(doc, item_id);
}

read_value :: (doc: *yaml_document_t, node: *yaml_node_t, data: *void, info: *Type_Info) -> bool {
    if !node {
        return true;
    }

    if info.type == {
        case .INTEGER;
            if node.type != .YAML_SCALAR_NODE return false;
            text := get_scalar_text(node);
            int_info := cast(*Type_Info_Integer) info;
            value := string_to_int(text);
            if int_info.runtime_size == {
                case 4; << cast(*s32) data = cast(s32) value;
                case 8; << cast(*s64) data = value;
                case;   << cast(*s32) data = cast(s32) value;
            }
            return true;

        case .FLOAT;
            if node.type != .YAML_SCALAR_NODE return false;
            text := get_scalar_text(node);
            float_info := cast(*Type_Info_Float) info;
            value := string_to_float(text);
            if float_info.runtime_size == {
                case 4; << cast(*float32) data = cast(float32) value;
                case 8; << cast(*float64) data = value;
            }
            return true;

        case .STRING;
            if node.type != .YAML_SCALAR_NODE return false;
            << cast(*string) data = copy_string(get_scalar_text(node));
            return true;

        case .BOOL;
            if node.type != .YAML_SCALAR_NODE return false;
            text := get_scalar_text(node);
            << cast(*bool) data = (text == "true");
            return true;
        case .ENUM;
                if node.type != .YAML_SCALAR_NODE return false;
                enum_info := cast(*Type_Info_Enum) info;
                text := get_scalar_text(node);

                found := false;
                value: s64;
                for enum_info.names {
                    if it == text {
                        value = enum_info.values[it_index];
                        found = true;
                        break;
                    }
                }
                if !found return false;

                if enum_info.internal_type.runtime_size == {
                    case 1; << cast(*s8)  data = cast(s8)  value;
                    case 2; << cast(*s16) data = cast(s16) value;
                    case 4; << cast(*s32) data = cast(s32) value;
                    case 8; << cast(*s64) data = value;
                }
                return true;

        case .STRUCT;
            if node.type != .YAML_MAPPING_NODE return false;
            struct_info := cast(*Type_Info_Struct) info;
            for member : struct_info.members {
                member_ptr := data + member.offset_in_bytes;
                key := get_yaml_name(*member);
                child_node := find_in_mapping(doc, node, key);
                if !read_value(doc, child_node, member_ptr, member.type) return false;
            }
            return true;

        case .ARRAY;
            if node.type != .YAML_SEQUENCE_NODE return false;
            array_info := cast(*Type_Info_Array) info;
            count := get_sequence_count(node);
            element_size := array_info.element_type.runtime_size;

            if array_info.array_type == {
                case .RESIZABLE;
                    view := cast(*Resizable_Array) data;
                    array_reserve(view, count, element_size);
                    view.count = count;
                    for i: 0..count-1 {
                        elem_node := get_sequence_item(doc, node, i);
                        elem_ptr  := view.data + i * element_size;
                        if !read_value(doc, elem_node, elem_ptr, array_info.element_type) return false;
                    }

                case .FIXED;
                    fixed_count := min(count, array_info.array_count);
                    for i: 0..fixed_count-1 {
                        elem_node := get_sequence_item(doc, node, i);
                        elem_ptr  := data + i * element_size;
                        if !read_value(doc, elem_node, elem_ptr, array_info.element_type) return false;
                    }
            }
            return true;

        case;
            print("Type not supported in `read_value`: %\n", info.type);
            return false;
    }
}

deserializer :: (path: string, $T: Type) -> T, bool {
    result: T;

    contents, ok := read_entire_file(path);
    if !ok { print("I couldn't read  %\n", path); return result, false; }
    defer free(contents);

    parser: yaml_parser_t;
    if !yaml_parser_initialize(*parser) return result, false;
    defer yaml_parser_delete(*parser);

    yaml_parser_set_input_string(*parser, contents.data, cast(u64) contents.count);

    doc: yaml_document_t;
    if !yaml_parser_load(*parser, *doc) {
        print("Parser error: %\n", to_string(parser.problem));
        return result, false;
    }
    defer yaml_document_delete(*doc);

    root := yaml_document_get_root_node(*doc);
    if !root {
        print("Empty YAML file\n");
        return result, false;
    }

    if !read_value(*doc, root, *result, type_info(T)) {
        return result, false;
    }

    return result, true;
}
