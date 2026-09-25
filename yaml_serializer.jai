emit :: (emitter: *yaml_emitter_t, event: *yaml_event_t) -> bool {
    if !yaml_emitter_emit(emitter, event) {
        print("Emitter error: %\n", to_string(emitter.problem));
        return false;
    }
    return true;
}

emit_scalar :: (emitter: *yaml_emitter_t, text: string) -> bool {
    event: yaml_event_t;
    yaml_scalar_event_initialize(
        *event, null, null,
        text.data, cast(s32) text.count,
        1, 1, .YAML_PLAIN_SCALAR_STYLE);
    return emit(emitter, *event);
}

emit_mapping_start :: (emitter: *yaml_emitter_t) -> bool {
    event: yaml_event_t;
    yaml_mapping_start_event_initialize(*event, null, null, 1, .YAML_BLOCK_MAPPING_STYLE);
    return emit(emitter, *event);
}

emit_mapping_end :: (emitter: *yaml_emitter_t) -> bool {
    event: yaml_event_t;
    yaml_mapping_end_event_initialize(*event);
    return emit(emitter, *event);
}

emit_sequence_start :: (emitter: *yaml_emitter_t) -> bool {
    event: yaml_event_t;
    yaml_sequence_start_event_initialize(*event, null, null, 1, .YAML_BLOCK_SEQUENCE_STYLE);
    return emit(emitter, *event);
}

emit_sequence_end :: (emitter: *yaml_emitter_t) -> bool {
    event: yaml_event_t;
    yaml_sequence_end_event_initialize(*event);
    return emit(emitter, *event);
}

get_yaml_name :: (member: *Type_Info_Struct_Member) -> string {
    for member.notes {
        if begins_with(it, "YamlName(") {
            inner := slice(it, 9, it.count - 9 - 1);
            return inner;
        }
    }
    return member.name;
}

write_value :: (emitter: *yaml_emitter_t, data: *void, info: *Type_Info) -> bool {
    if info.type == {
        case .INTEGER;
            int_info := cast(*Type_Info_Integer) info;
            value: s64;
            if int_info.runtime_size == {
                case 4; value = cast(s64) << cast(*s32) data;
                case 8; value = << cast(*s64) data;
                case;   value = << cast(*s32) data;
            }
            return emit_scalar(emitter, tprint("%", value));

        case .FLOAT;
            float_info := cast(*Type_Info_Float) info;
            value: float64;
            if float_info.runtime_size == {
                case 4; value = cast(float64) << cast(*float32) data;
                case 8; value = << cast(*float64) data;
            }
            return emit_scalar(emitter, tprint("%", value));

        case .STRING;
            value := << cast(*string) data;
            return emit_scalar(emitter, value);

        case .BOOL;
            value := << cast(*bool) data;
            return emit_scalar(emitter, ifx value then "true" else "false");
        case .ENUM;
                enum_info := cast(*Type_Info_Enum) info;
                value: s64;
                if enum_info.internal_type.runtime_size == {
                    case 1; value = cast(s64) << cast(*s8)  data;
                    case 2; value = cast(s64) << cast(*s16) data;
                    case 4; value = cast(s64) << cast(*s32) data;
                    case 8; value = << cast(*s64) data;
                }

                name := "";
                for enum_info.values {
                    if it == value {
                        name = enum_info.names[it_index];
                        break;
                    }
                }
                if name.count == 0 return false;

                return emit_scalar(emitter, name);
        case .STRUCT;
            struct_info := cast(*Type_Info_Struct) info;
            if !emit_mapping_start(emitter) return false;
            for member : struct_info.members {
                member_ptr := data + member.offset_in_bytes;
                key := get_yaml_name(*member);
                if !emit_scalar(emitter, key) return false;
                if !write_value(emitter, member_ptr, member.type) return false;
            }
            if !emit_mapping_end(emitter) return false;
            return true;

        case .ARRAY;
            array_info := cast(*Type_Info_Array) info;
            if !emit_sequence_start(emitter) return false;

            count: s64;
            elements: *void;

            if array_info.array_type == {
                case .FIXED;
                    count    = array_info.array_count;
                    elements = data;
                case .RESIZABLE; #through;
                case .VIEW;
                    view := cast(*Array_View_64) data;
                    count    = view.count;
                    elements = view.data;
            }

            element_size := array_info.element_type.runtime_size;
            for i: 0..count-1 {
                elem_ptr := elements + i * element_size;
                if !write_value(emitter, elem_ptr, array_info.element_type) return false;
            }

            if !emit_sequence_end(emitter) return false;
            return true;

        case;
            print("Type not supported in `write_value`: %\n", info.type);
            return false;
    }
}

serializer :: (path: string, value: $T,encoding:=yaml_encoding_t.YAML_UTF8_ENCODING) -> bool {
    buffer: [16384] u8;
    written: u64;

    emitter: yaml_emitter_t;
    if !yaml_emitter_initialize(*emitter) return false;
    defer yaml_emitter_delete(*emitter);

    yaml_emitter_set_output_string(*emitter, buffer.data, buffer.count, *written);

    event: yaml_event_t;

    yaml_stream_start_event_initialize(*event, encoding);
    if !emit(*emitter, *event) return false;

    yaml_document_start_event_initialize(*event, null, null, null, 1);
    if !emit(*emitter, *event) return false;

    info := type_info(T);
    if !write_value(*emitter, *value, info) return false;

    yaml_document_end_event_initialize(*event, 1);
    if !emit(*emitter, *event) return false;

    yaml_stream_end_event_initialize(*event);
    if !emit(*emitter, *event) return false;

    text: string;
    text.data  = buffer.data;
    text.count = cast(s64) written;
    return write_entire_file(path, text);
}
