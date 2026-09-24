//
// This file was auto-generated using the following command:
//
// jai generate.jai
//



YAML_NULL_TAG :: "tag:yaml.org,2002:null";

YAML_BOOL_TAG :: "tag:yaml.org,2002:bool";

YAML_STR_TAG :: "tag:yaml.org,2002:str";

YAML_INT_TAG :: "tag:yaml.org,2002:int";

YAML_FLOAT_TAG :: "tag:yaml.org,2002:float";

YAML_TIMESTAMP_TAG :: "tag:yaml.org,2002:timestamp";

YAML_SEQ_TAG :: "tag:yaml.org,2002:seq";

YAML_MAP_TAG :: "tag:yaml.org,2002:map";

YAML_DEFAULT_SCALAR_TAG :: YAML_STR_TAG;

YAML_DEFAULT_SEQUENCE_TAG :: YAML_SEQ_TAG;

YAML_DEFAULT_MAPPING_TAG :: YAML_MAP_TAG;

/**
* Get the library version as a string.
*
* @returns The function returns the pointer to a static string of the form
* @c "X.Y.Z", where @c X is the major version number, @c Y is a minor version
* number, and @c Z is the patch version number.
*/
yaml_get_version_string :: () -> *u8 #foreign yaml;

/**
* Get the library version numbers.
*
* @param[out]      major   Major version number.
* @param[out]      minor   Minor version number.
* @param[out]      patch   Patch version number.
*/
yaml_get_version :: (major: *s32, minor: *s32, patch: *s32) -> void #foreign yaml;

/** The character type (UTF-8 octet). */
yaml_char_t :: u8;

/** The version directive data. */
yaml_version_directive_s :: struct {
    /** The major version number. */
    major: s32;

    /** The minor version number. */
    minor: s32;
}

/** The version directive data. */
yaml_version_directive_t :: yaml_version_directive_s;

/** The tag directive data. */
yaml_tag_directive_s :: struct {
    /** The tag handle. */
    handle: *yaml_char_t;

    /** The tag prefix. */
    prefix: *yaml_char_t;
}

/** The tag directive data. */
yaml_tag_directive_t :: yaml_tag_directive_s;

/** The stream encoding. */
yaml_encoding_e :: enum s32 {
    ANY_ENCODING     :: 0;

    UTF8_ENCODING    :: 1;

    UTF16LE_ENCODING :: 2;

    UTF16BE_ENCODING :: 3;

    YAML_ANY_ENCODING     :: ANY_ENCODING;

    YAML_UTF8_ENCODING    :: UTF8_ENCODING;

    YAML_UTF16LE_ENCODING :: UTF16LE_ENCODING;

    YAML_UTF16BE_ENCODING :: UTF16BE_ENCODING;
}

/** The stream encoding. */
yaml_encoding_t :: yaml_encoding_e;

/** Line break types. */
yaml_break_e :: enum s32 {
    ANY_BREAK  :: 0;

    CR_BREAK   :: 1;

    LN_BREAK   :: 2;

    CRLN_BREAK :: 3;

    YAML_ANY_BREAK  :: ANY_BREAK;

    YAML_CR_BREAK   :: CR_BREAK;

    YAML_LN_BREAK   :: LN_BREAK;

    YAML_CRLN_BREAK :: CRLN_BREAK;
}

/** Line break types. */
yaml_break_t :: yaml_break_e;

/** Many bad things could happen with the parser and emitter. */
yaml_error_type_e :: enum s32 {
    NO_ERROR       :: 0;

    MEMORY_ERROR   :: 1;

    READER_ERROR   :: 2;

    SCANNER_ERROR  :: 3;

    PARSER_ERROR   :: 4;

    COMPOSER_ERROR :: 5;

    WRITER_ERROR   :: 6;

    EMITTER_ERROR  :: 7;

    YAML_NO_ERROR       :: NO_ERROR;

    YAML_MEMORY_ERROR   :: MEMORY_ERROR;

    YAML_READER_ERROR   :: READER_ERROR;

    YAML_SCANNER_ERROR  :: SCANNER_ERROR;

    YAML_PARSER_ERROR   :: PARSER_ERROR;

    YAML_COMPOSER_ERROR :: COMPOSER_ERROR;

    YAML_WRITER_ERROR   :: WRITER_ERROR;

    YAML_EMITTER_ERROR  :: EMITTER_ERROR;
}

/** Many bad things could happen with the parser and emitter. */
yaml_error_type_t :: yaml_error_type_e;

/** The pointer position. */
yaml_mark_s :: struct {
    /** The position index. */
    index:  u64;

    /** The position line. */
    line:   u64;

    /** The position column. */
    column: u64;
}

/** The pointer position. */
yaml_mark_t :: yaml_mark_s;

/** Scalar styles. */
yaml_scalar_style_e :: enum s32 {
    ANY_SCALAR_STYLE           :: 0;

    PLAIN_SCALAR_STYLE         :: 1;

    SINGLE_QUOTED_SCALAR_STYLE :: 2;

    DOUBLE_QUOTED_SCALAR_STYLE :: 3;

    LITERAL_SCALAR_STYLE       :: 4;

    FOLDED_SCALAR_STYLE        :: 5;

    YAML_ANY_SCALAR_STYLE           :: ANY_SCALAR_STYLE;

    YAML_PLAIN_SCALAR_STYLE         :: PLAIN_SCALAR_STYLE;

    YAML_SINGLE_QUOTED_SCALAR_STYLE :: SINGLE_QUOTED_SCALAR_STYLE;

    YAML_DOUBLE_QUOTED_SCALAR_STYLE :: DOUBLE_QUOTED_SCALAR_STYLE;

    YAML_LITERAL_SCALAR_STYLE       :: LITERAL_SCALAR_STYLE;

    YAML_FOLDED_SCALAR_STYLE        :: FOLDED_SCALAR_STYLE;
}

/** Scalar styles. */
yaml_scalar_style_t :: yaml_scalar_style_e;

/** Sequence styles. */
yaml_sequence_style_e :: enum s32 {
    ANY_SEQUENCE_STYLE   :: 0;

    BLOCK_SEQUENCE_STYLE :: 1;

    FLOW_SEQUENCE_STYLE  :: 2;

    YAML_ANY_SEQUENCE_STYLE   :: ANY_SEQUENCE_STYLE;

    YAML_BLOCK_SEQUENCE_STYLE :: BLOCK_SEQUENCE_STYLE;

    YAML_FLOW_SEQUENCE_STYLE  :: FLOW_SEQUENCE_STYLE;
}

/** Sequence styles. */
yaml_sequence_style_t :: yaml_sequence_style_e;

/** Mapping styles. */
yaml_mapping_style_e :: enum s32 {
    ANY_MAPPING_STYLE   :: 0;

    BLOCK_MAPPING_STYLE :: 1;

    FLOW_MAPPING_STYLE  :: 2;

    YAML_ANY_MAPPING_STYLE   :: ANY_MAPPING_STYLE;

    YAML_BLOCK_MAPPING_STYLE :: BLOCK_MAPPING_STYLE;

    YAML_FLOW_MAPPING_STYLE  :: FLOW_MAPPING_STYLE;
}

/** Mapping styles. */
yaml_mapping_style_t :: yaml_mapping_style_e;

/** Token types. */
yaml_token_type_e :: enum s32 {
    NO_TOKEN                   :: 0;

    STREAM_START_TOKEN         :: 1;

    STREAM_END_TOKEN           :: 2;

    VERSION_DIRECTIVE_TOKEN    :: 3;

    TAG_DIRECTIVE_TOKEN        :: 4;

    DOCUMENT_START_TOKEN       :: 5;

    DOCUMENT_END_TOKEN         :: 6;

    BLOCK_SEQUENCE_START_TOKEN :: 7;

    BLOCK_MAPPING_START_TOKEN  :: 8;

    BLOCK_END_TOKEN            :: 9;

    FLOW_SEQUENCE_START_TOKEN  :: 10;

    FLOW_SEQUENCE_END_TOKEN    :: 11;

    FLOW_MAPPING_START_TOKEN   :: 12;

    FLOW_MAPPING_END_TOKEN     :: 13;

    BLOCK_ENTRY_TOKEN          :: 14;

    FLOW_ENTRY_TOKEN           :: 15;

    KEY_TOKEN                  :: 16;

    VALUE_TOKEN                :: 17;

    ALIAS_TOKEN                :: 18;

    ANCHOR_TOKEN               :: 19;

    TAG_TOKEN                  :: 20;

    SCALAR_TOKEN               :: 21;

    YAML_NO_TOKEN                   :: NO_TOKEN;

    YAML_STREAM_START_TOKEN         :: STREAM_START_TOKEN;

    YAML_STREAM_END_TOKEN           :: STREAM_END_TOKEN;

    YAML_VERSION_DIRECTIVE_TOKEN    :: VERSION_DIRECTIVE_TOKEN;

    YAML_TAG_DIRECTIVE_TOKEN        :: TAG_DIRECTIVE_TOKEN;

    YAML_DOCUMENT_START_TOKEN       :: DOCUMENT_START_TOKEN;

    YAML_DOCUMENT_END_TOKEN         :: DOCUMENT_END_TOKEN;

    YAML_BLOCK_SEQUENCE_START_TOKEN :: BLOCK_SEQUENCE_START_TOKEN;

    YAML_BLOCK_MAPPING_START_TOKEN  :: BLOCK_MAPPING_START_TOKEN;

    YAML_BLOCK_END_TOKEN            :: BLOCK_END_TOKEN;

    YAML_FLOW_SEQUENCE_START_TOKEN  :: FLOW_SEQUENCE_START_TOKEN;

    YAML_FLOW_SEQUENCE_END_TOKEN    :: FLOW_SEQUENCE_END_TOKEN;

    YAML_FLOW_MAPPING_START_TOKEN   :: FLOW_MAPPING_START_TOKEN;

    YAML_FLOW_MAPPING_END_TOKEN     :: FLOW_MAPPING_END_TOKEN;

    YAML_BLOCK_ENTRY_TOKEN          :: BLOCK_ENTRY_TOKEN;

    YAML_FLOW_ENTRY_TOKEN           :: FLOW_ENTRY_TOKEN;

    YAML_KEY_TOKEN                  :: KEY_TOKEN;

    YAML_VALUE_TOKEN                :: VALUE_TOKEN;

    YAML_ALIAS_TOKEN                :: ALIAS_TOKEN;

    YAML_ANCHOR_TOKEN               :: ANCHOR_TOKEN;

    YAML_TAG_TOKEN                  :: TAG_TOKEN;

    YAML_SCALAR_TOKEN               :: SCALAR_TOKEN;
}

/** Token types. */
yaml_token_type_t :: yaml_token_type_e;

/** The token structure. */
yaml_token_s :: struct {
    /** The token type. */
    type:       yaml_token_type_t;

    data:       union {
        stream_start:      struct {
            /** The stream encoding. */
            encoding: yaml_encoding_t;
        };

        alias:             struct {
            /** The alias value. */
            value: *yaml_char_t;
        };

        anchor:            struct {
            /** The anchor value. */
            value: *yaml_char_t;
        };

        tag:               struct {
            /** The tag handle. */
            handle: *yaml_char_t;

            /** The tag suffix. */
            suffix: *yaml_char_t;
        };

        scalar:            struct {
            /** The scalar value. */
            value:  *yaml_char_t;

            /** The length of the scalar value. */
            length: u64;

            /** The scalar style. */
            style:  yaml_scalar_style_t;
        };

        version_directive: struct {
            /** The major version number. */
            major: s32;

            /** The minor version number. */
            minor: s32;
        };

        tag_directive:     struct {
            /** The tag handle. */
            handle: *yaml_char_t;

            /** The tag prefix. */
            prefix: *yaml_char_t;
        };
    };

    /** The beginning of the token. */
    start_mark: yaml_mark_t;

    /** The end of the token. */
    end_mark:   yaml_mark_t;
}

/** The token structure. */
yaml_token_t :: yaml_token_s;

/**
* Free any memory allocated for a token object.
*
* @param[in,out]   token   A token object.
*/
yaml_token_delete :: (token: *yaml_token_t) -> void #foreign yaml;

/** Event types. */
yaml_event_type_e :: enum s32 {
    NO_EVENT             :: 0;

    STREAM_START_EVENT   :: 1;

    STREAM_END_EVENT     :: 2;

    DOCUMENT_START_EVENT :: 3;

    DOCUMENT_END_EVENT   :: 4;

    ALIAS_EVENT          :: 5;

    SCALAR_EVENT         :: 6;

    SEQUENCE_START_EVENT :: 7;

    SEQUENCE_END_EVENT   :: 8;

    MAPPING_START_EVENT  :: 9;

    MAPPING_END_EVENT    :: 10;

    YAML_NO_EVENT             :: NO_EVENT;

    YAML_STREAM_START_EVENT   :: STREAM_START_EVENT;

    YAML_STREAM_END_EVENT     :: STREAM_END_EVENT;

    YAML_DOCUMENT_START_EVENT :: DOCUMENT_START_EVENT;

    YAML_DOCUMENT_END_EVENT   :: DOCUMENT_END_EVENT;

    YAML_ALIAS_EVENT          :: ALIAS_EVENT;

    YAML_SCALAR_EVENT         :: SCALAR_EVENT;

    YAML_SEQUENCE_START_EVENT :: SEQUENCE_START_EVENT;

    YAML_SEQUENCE_END_EVENT   :: SEQUENCE_END_EVENT;

    YAML_MAPPING_START_EVENT  :: MAPPING_START_EVENT;

    YAML_MAPPING_END_EVENT    :: MAPPING_END_EVENT;
}

/** Event types. */
yaml_event_type_t :: yaml_event_type_e;

/** The event structure. */
yaml_event_s :: struct {
    /** The event type. */
    type:       yaml_event_type_t;

    data:       union {
        stream_start:   struct {
            /** The document encoding. */
            encoding: yaml_encoding_t;
        };

        document_start: struct {
            /** The version directive. */
            version_directive: *yaml_version_directive_t;

            tag_directives:    struct {
                /** The beginning of the tag directives list. */
                start: *yaml_tag_directive_t;

                /** The end of the tag directives list. */
                end:   *yaml_tag_directive_t;
            };

            /** Is the document indicator implicit? */
            implicit:          s32;
        };

        document_end:   struct {
            /** Is the document end indicator implicit? */
            implicit: s32;
        };

        alias:          struct {
            /** The anchor. */
            anchor: *yaml_char_t;
        };

        scalar:         struct {
            /** The anchor. */
            anchor:          *yaml_char_t;

            /** The tag. */
            tag:             *yaml_char_t;

            /** The scalar value. */
            value:           *yaml_char_t;

            /** The length of the scalar value. */
            length:          u64;

            /** Is the tag optional for the plain style? */
            plain_implicit:  s32;

            /** Is the tag optional for any non-plain style? */
            quoted_implicit: s32;

            /** The scalar style. */
            style:           yaml_scalar_style_t;
        };

        sequence_start: struct {
            /** The anchor. */
            anchor:   *yaml_char_t;

            /** The tag. */
            tag:      *yaml_char_t;

            /** Is the tag optional? */
            implicit: s32;

            /** The sequence style. */
            style:    yaml_sequence_style_t;
        };

        mapping_start:  struct {
            /** The anchor. */
            anchor:   *yaml_char_t;

            /** The tag. */
            tag:      *yaml_char_t;

            /** Is the tag optional? */
            implicit: s32;

            /** The mapping style. */
            style:    yaml_mapping_style_t;
        };
    };

    /** The beginning of the event. */
    start_mark: yaml_mark_t;

    /** The end of the event. */
    end_mark:   yaml_mark_t;
}

/** The event structure. */
yaml_event_t :: yaml_event_s;

/**
* Create the STREAM-START event.
*
* @param[out]      event       An empty event object.
* @param[in]       encoding    The stream encoding.
*
* @returns @c 1 if the function succeeded, @c 0 on error.
*/
yaml_stream_start_event_initialize :: (event: *yaml_event_t, encoding: yaml_encoding_t) -> s32 #foreign yaml;

/**
* Create the STREAM-END event.
*
* @param[out]      event       An empty event object.
*
* @returns @c 1 if the function succeeded, @c 0 on error.
*/
yaml_stream_end_event_initialize :: (event: *yaml_event_t) -> s32 #foreign yaml;

/**
* Create the DOCUMENT-START event.
*
* The @a implicit argument is considered as a stylistic parameter and may be
* ignored by the emitter.
*
* @param[out]      event                   An empty event object.
* @param[in]       version_directive       The %YAML directive value or
*                                          @c NULL.
* @param[in]       tag_directives_start    The beginning of the %TAG
*                                          directives list.
* @param[in]       tag_directives_end      The end of the %TAG directives
*                                          list.
* @param[in]       implicit                If the document start indicator is
*                                          implicit.
*
* @returns @c 1 if the function succeeded, @c 0 on error.
*/
yaml_document_start_event_initialize :: (event: *yaml_event_t, version_directive: *yaml_version_directive_t, tag_directives_start: *yaml_tag_directive_t, tag_directives_end: *yaml_tag_directive_t, implicit: s32) -> s32 #foreign yaml;

/**
* Create the DOCUMENT-END event.
*
* The @a implicit argument is considered as a stylistic parameter and may be
* ignored by the emitter.
*
* @param[out]      event       An empty event object.
* @param[in]       implicit    If the document end indicator is implicit.
*
* @returns @c 1 if the function succeeded, @c 0 on error.
*/
yaml_document_end_event_initialize :: (event: *yaml_event_t, implicit: s32) -> s32 #foreign yaml;

/**
* Create an ALIAS event.
*
* @param[out]      event       An empty event object.
* @param[in]       anchor      The anchor value.
*
* @returns @c 1 if the function succeeded, @c 0 on error.
*/
yaml_alias_event_initialize :: (event: *yaml_event_t, anchor: *yaml_char_t) -> s32 #foreign yaml;

/**
* Create a SCALAR event.
*
* The @a style argument may be ignored by the emitter.
*
* Either the @a tag attribute or one of the @a plain_implicit and
* @a quoted_implicit flags must be set.
*
* @param[out]      event           An empty event object.
* @param[in]       anchor          The scalar anchor or @c NULL.
* @param[in]       tag             The scalar tag or @c NULL.
* @param[in]       value           The scalar value.
* @param[in]       length          The length of the scalar value.
* @param[in]       plain_implicit  If the tag may be omitted for the plain
*                                  style.
* @param[in]       quoted_implicit If the tag may be omitted for any
*                                  non-plain style.
* @param[in]       style           The scalar style.
*
* @returns @c 1 if the function succeeded, @c 0 on error.
*/
yaml_scalar_event_initialize :: (event: *yaml_event_t, anchor: *yaml_char_t, tag: *yaml_char_t, value: *yaml_char_t, length: s32, plain_implicit: s32, quoted_implicit: s32, style: yaml_scalar_style_t) -> s32 #foreign yaml;

/**
* Create a SEQUENCE-START event.
*
* The @a style argument may be ignored by the emitter.
*
* Either the @a tag attribute or the @a implicit flag must be set.
*
* @param[out]      event       An empty event object.
* @param[in]       anchor      The sequence anchor or @c NULL.
* @param[in]       tag         The sequence tag or @c NULL.
* @param[in]       implicit    If the tag may be omitted.
* @param[in]       style       The sequence style.
*
* @returns @c 1 if the function succeeded, @c 0 on error.
*/
yaml_sequence_start_event_initialize :: (event: *yaml_event_t, anchor: *yaml_char_t, tag: *yaml_char_t, implicit: s32, style: yaml_sequence_style_t) -> s32 #foreign yaml;

/**
* Create a SEQUENCE-END event.
*
* @param[out]      event       An empty event object.
*
* @returns @c 1 if the function succeeded, @c 0 on error.
*/
yaml_sequence_end_event_initialize :: (event: *yaml_event_t) -> s32 #foreign yaml;

/**
* Create a MAPPING-START event.
*
* The @a style argument may be ignored by the emitter.
*
* Either the @a tag attribute or the @a implicit flag must be set.
*
* @param[out]      event       An empty event object.
* @param[in]       anchor      The mapping anchor or @c NULL.
* @param[in]       tag         The mapping tag or @c NULL.
* @param[in]       implicit    If the tag may be omitted.
* @param[in]       style       The mapping style.
*
* @returns @c 1 if the function succeeded, @c 0 on error.
*/
yaml_mapping_start_event_initialize :: (event: *yaml_event_t, anchor: *yaml_char_t, tag: *yaml_char_t, implicit: s32, style: yaml_mapping_style_t) -> s32 #foreign yaml;

/**
* Create a MAPPING-END event.
*
* @param[out]      event       An empty event object.
*
* @returns @c 1 if the function succeeded, @c 0 on error.
*/
yaml_mapping_end_event_initialize :: (event: *yaml_event_t) -> s32 #foreign yaml;

/**
* Free any memory allocated for an event object.
*
* @param[in,out]   event   An event object.
*/
yaml_event_delete :: (event: *yaml_event_t) -> void #foreign yaml;

/** Node types. */
yaml_node_type_e :: enum s32 {
    NO_NODE       :: 0;

    SCALAR_NODE   :: 1;

    SEQUENCE_NODE :: 2;

    MAPPING_NODE  :: 3;

    YAML_NO_NODE       :: NO_NODE;

    YAML_SCALAR_NODE   :: SCALAR_NODE;

    YAML_SEQUENCE_NODE :: SEQUENCE_NODE;

    YAML_MAPPING_NODE  :: MAPPING_NODE;
}

/** Node types. */
yaml_node_type_t :: yaml_node_type_e;

/** The forward definition of a document node structure. */
yaml_node_t :: yaml_node_s;

/** An element of a sequence node. */
yaml_node_item_t :: s32;

/** An element of a mapping node. */
yaml_node_pair_s :: struct {
    /** The key of the element. */
    key:   s32;

    /** The value of the element. */
    value: s32;
}

/** An element of a mapping node. */
yaml_node_pair_t :: yaml_node_pair_s;

/** The node structure. */
yaml_node_s :: struct {
    /** The node type. */
    type:       yaml_node_type_t;

    /** The node tag. */
    tag:        *yaml_char_t;

    data:       union {
        scalar:   struct {
            /** The scalar value. */
            value:  *yaml_char_t;

            /** The length of the scalar value. */
            length: u64;

            /** The scalar style. */
            style:  yaml_scalar_style_t;
        };

        sequence: struct {
            items: struct {
                /** The beginning of the stack. */
                start: *yaml_node_item_t;

                /** The end of the stack. */
                end:   *yaml_node_item_t;

                /** The top of the stack. */
                top:   *yaml_node_item_t;
            };

            /** The sequence style. */
            style: yaml_sequence_style_t;
        };

        mapping:  struct {
            pairs: struct {
                /** The beginning of the stack. */
                start: *yaml_node_pair_t;

                /** The end of the stack. */
                end:   *yaml_node_pair_t;

                /** The top of the stack. */
                top:   *yaml_node_pair_t;
            };

            /** The mapping style. */
            style: yaml_mapping_style_t;
        };
    };

    /** The beginning of the node. */
    start_mark: yaml_mark_t;

    /** The end of the node. */
    end_mark:   yaml_mark_t;
}

/** The document structure. */
yaml_document_s :: struct {
    nodes:             struct {
        /** The beginning of the stack. */
        start: *yaml_node_t;

        /** The end of the stack. */
        end:   *yaml_node_t;

        /** The top of the stack. */
        top:   *yaml_node_t;
    };

    /** The version directive. */
    version_directive: *yaml_version_directive_t;

    tag_directives:    struct {
        /** The beginning of the tag directives list. */
        start: *yaml_tag_directive_t;

        /** The end of the tag directives list. */
        end:   *yaml_tag_directive_t;
    };

    /** Is the document start indicator implicit? */
    start_implicit:    s32;

    /** Is the document end indicator implicit? */
    end_implicit:      s32;

    /** The beginning of the document. */
    start_mark:        yaml_mark_t;

    /** The end of the document. */
    end_mark:          yaml_mark_t;
}

/** The document structure. */
yaml_document_t :: yaml_document_s;

/**
* Create a YAML document.
*
* @param[out]      document                An empty document object.
* @param[in]       version_directive       The %YAML directive value or
*                                          @c NULL.
* @param[in]       tag_directives_start    The beginning of the %TAG
*                                          directives list.
* @param[in]       tag_directives_end      The end of the %TAG directives
*                                          list.
* @param[in]       start_implicit          If the document start indicator is
*                                          implicit.
* @param[in]       end_implicit            If the document end indicator is
*                                          implicit.
*
* @returns @c 1 if the function succeeded, @c 0 on error.
*/
yaml_document_initialize :: (document: *yaml_document_t, version_directive: *yaml_version_directive_t, tag_directives_start: *yaml_tag_directive_t, tag_directives_end: *yaml_tag_directive_t, start_implicit: s32, end_implicit: s32) -> s32 #foreign yaml;

/**
* Delete a YAML document and all its nodes.
*
* @param[in,out]   document        A document object.
*/
yaml_document_delete :: (document: *yaml_document_t) -> void #foreign yaml;

/**
* Get a node of a YAML document.
*
* The pointer returned by this function is valid until any of the functions
* modifying the documents are called.
*
* @param[in]       document        A document object.
* @param[in]       index           The node id.
*
* @returns the node objct or @c NULL if @c node_id is out of range.
*/
yaml_document_get_node :: (document: *yaml_document_t, index: s32) -> *yaml_node_t #foreign yaml;

/**
* Get the root of a YAML document node.
*
* The root object is the first object added to the document.
*
* The pointer returned by this function is valid until any of the functions
* modifying the documents are called.
*
* An empty document produced by the parser signifies the end of a YAML
* stream.
*
* @param[in]       document        A document object.
*
* @returns the node object or @c NULL if the document is empty.
*/
yaml_document_get_root_node :: (document: *yaml_document_t) -> *yaml_node_t #foreign yaml;

/**
* Create a SCALAR node and attach it to the document.
*
* The @a style argument may be ignored by the emitter.
*
* @param[in,out]   document        A document object.
* @param[in]       tag             The scalar tag.
* @param[in]       value           The scalar value.
* @param[in]       length          The length of the scalar value.
* @param[in]       style           The scalar style.
*
* @returns the node id or @c 0 on error.
*/
yaml_document_add_scalar :: (document: *yaml_document_t, tag: *yaml_char_t, value: *yaml_char_t, length: s32, style: yaml_scalar_style_t) -> s32 #foreign yaml;

/**
* Create a SEQUENCE node and attach it to the document.
*
* The @a style argument may be ignored by the emitter.
*
* @param[in,out]   document    A document object.
* @param[in]       tag         The sequence tag.
* @param[in]       style       The sequence style.
*
* @returns the node id or @c 0 on error.
*/
yaml_document_add_sequence :: (document: *yaml_document_t, tag: *yaml_char_t, style: yaml_sequence_style_t) -> s32 #foreign yaml;

/**
* Create a MAPPING node and attach it to the document.
*
* The @a style argument may be ignored by the emitter.
*
* @param[in,out]   document    A document object.
* @param[in]       tag         The sequence tag.
* @param[in]       style       The sequence style.
*
* @returns the node id or @c 0 on error.
*/
yaml_document_add_mapping :: (document: *yaml_document_t, tag: *yaml_char_t, style: yaml_mapping_style_t) -> s32 #foreign yaml;

/**
* Add an item to a SEQUENCE node.
*
* @param[in,out]   document    A document object.
* @param[in]       sequence    The sequence node id.
* @param[in]       item        The item node id.
*
* @returns @c 1 if the function succeeded, @c 0 on error.
*/
yaml_document_append_sequence_item :: (document: *yaml_document_t, sequence: s32, item: s32) -> s32 #foreign yaml;

/**
* Add a pair of a key and a value to a MAPPING node.
*
* @param[in,out]   document    A document object.
* @param[in]       mapping     The mapping node id.
* @param[in]       key         The key node id.
* @param[in]       value       The value node id.
*
* @returns @c 1 if the function succeeded, @c 0 on error.
*/
yaml_document_append_mapping_pair :: (document: *yaml_document_t, mapping: s32, key: s32, value: s32) -> s32 #foreign yaml;

/**
* The prototype of a read handler.
*
* The read handler is called when the parser needs to read more bytes from the
* source.  The handler should write not more than @a size bytes to the @a
* buffer.  The number of written bytes should be set to the @a length variable.
*
* @param[in,out]   data        A pointer to an application data specified by
*                              yaml_parser_set_input().
* @param[out]      buffer      The buffer to write the data from the source.
* @param[in]       size        The size of the buffer.
* @param[out]      size_read   The actual number of bytes read from the source.
*
* @returns On success, the handler should return @c 1.  If the handler failed,
* the returned value should be @c 0.  On EOF, the handler should set the
* @a size_read to @c 0 and return @c 1.
*/
yaml_read_handler_t :: #type (data: *void, buffer: *u8, size: u64, size_read: *u64) -> s32 #c_call;

/**
* This structure holds information about a potential simple key.
*/
yaml_simple_key_s :: struct {
    /** Is a simple key possible? */
    possible:     s32;

    /** Is a simple key required? */
    required:     s32;

    /** The number of the token. */
    token_number: u64;

    /** The position mark. */
    mark:         yaml_mark_t;
}

/**
* This structure holds information about a potential simple key.
*/
yaml_simple_key_t :: yaml_simple_key_s;

/**
* The states of the parser.
*/
yaml_parser_state_e :: enum s32 {
    STREAM_START_STATE                      :: 0;

    IMPLICIT_DOCUMENT_START_STATE           :: 1;

    DOCUMENT_START_STATE                    :: 2;

    DOCUMENT_CONTENT_STATE                  :: 3;

    DOCUMENT_END_STATE                      :: 4;

    BLOCK_NODE_STATE                        :: 5;

    BLOCK_NODE_OR_INDENTLESS_SEQUENCE_STATE :: 6;

    FLOW_NODE_STATE                         :: 7;

    BLOCK_SEQUENCE_FIRST_ENTRY_STATE        :: 8;

    BLOCK_SEQUENCE_ENTRY_STATE              :: 9;

    INDENTLESS_SEQUENCE_ENTRY_STATE         :: 10;

    BLOCK_MAPPING_FIRST_KEY_STATE           :: 11;

    BLOCK_MAPPING_KEY_STATE                 :: 12;

    BLOCK_MAPPING_VALUE_STATE               :: 13;

    FLOW_SEQUENCE_FIRST_ENTRY_STATE         :: 14;

    FLOW_SEQUENCE_ENTRY_STATE               :: 15;

    FLOW_SEQUENCE_ENTRY_MAPPING_KEY_STATE   :: 16;

    FLOW_SEQUENCE_ENTRY_MAPPING_VALUE_STATE :: 17;

    FLOW_SEQUENCE_ENTRY_MAPPING_END_STATE   :: 18;

    FLOW_MAPPING_FIRST_KEY_STATE            :: 19;

    FLOW_MAPPING_KEY_STATE                  :: 20;

    FLOW_MAPPING_VALUE_STATE                :: 21;

    FLOW_MAPPING_EMPTY_VALUE_STATE          :: 22;

    END_STATE                               :: 23;

    YAML_PARSE_STREAM_START_STATE                      :: STREAM_START_STATE;

    YAML_PARSE_IMPLICIT_DOCUMENT_START_STATE           :: IMPLICIT_DOCUMENT_START_STATE;

    YAML_PARSE_DOCUMENT_START_STATE                    :: DOCUMENT_START_STATE;

    YAML_PARSE_DOCUMENT_CONTENT_STATE                  :: DOCUMENT_CONTENT_STATE;

    YAML_PARSE_DOCUMENT_END_STATE                      :: DOCUMENT_END_STATE;

    YAML_PARSE_BLOCK_NODE_STATE                        :: BLOCK_NODE_STATE;

    YAML_PARSE_BLOCK_NODE_OR_INDENTLESS_SEQUENCE_STATE :: BLOCK_NODE_OR_INDENTLESS_SEQUENCE_STATE;

    YAML_PARSE_FLOW_NODE_STATE                         :: FLOW_NODE_STATE;

    YAML_PARSE_BLOCK_SEQUENCE_FIRST_ENTRY_STATE        :: BLOCK_SEQUENCE_FIRST_ENTRY_STATE;

    YAML_PARSE_BLOCK_SEQUENCE_ENTRY_STATE              :: BLOCK_SEQUENCE_ENTRY_STATE;

    YAML_PARSE_INDENTLESS_SEQUENCE_ENTRY_STATE         :: INDENTLESS_SEQUENCE_ENTRY_STATE;

    YAML_PARSE_BLOCK_MAPPING_FIRST_KEY_STATE           :: BLOCK_MAPPING_FIRST_KEY_STATE;

    YAML_PARSE_BLOCK_MAPPING_KEY_STATE                 :: BLOCK_MAPPING_KEY_STATE;

    YAML_PARSE_BLOCK_MAPPING_VALUE_STATE               :: BLOCK_MAPPING_VALUE_STATE;

    YAML_PARSE_FLOW_SEQUENCE_FIRST_ENTRY_STATE         :: FLOW_SEQUENCE_FIRST_ENTRY_STATE;

    YAML_PARSE_FLOW_SEQUENCE_ENTRY_STATE               :: FLOW_SEQUENCE_ENTRY_STATE;

    YAML_PARSE_FLOW_SEQUENCE_ENTRY_MAPPING_KEY_STATE   :: FLOW_SEQUENCE_ENTRY_MAPPING_KEY_STATE;

    YAML_PARSE_FLOW_SEQUENCE_ENTRY_MAPPING_VALUE_STATE :: FLOW_SEQUENCE_ENTRY_MAPPING_VALUE_STATE;

    YAML_PARSE_FLOW_SEQUENCE_ENTRY_MAPPING_END_STATE   :: FLOW_SEQUENCE_ENTRY_MAPPING_END_STATE;

    YAML_PARSE_FLOW_MAPPING_FIRST_KEY_STATE            :: FLOW_MAPPING_FIRST_KEY_STATE;

    YAML_PARSE_FLOW_MAPPING_KEY_STATE                  :: FLOW_MAPPING_KEY_STATE;

    YAML_PARSE_FLOW_MAPPING_VALUE_STATE                :: FLOW_MAPPING_VALUE_STATE;

    YAML_PARSE_FLOW_MAPPING_EMPTY_VALUE_STATE          :: FLOW_MAPPING_EMPTY_VALUE_STATE;

    YAML_PARSE_END_STATE                               :: END_STATE;
}

/**
* The states of the parser.
*/
yaml_parser_state_t :: yaml_parser_state_e;

/**
* This structure holds aliases data.
*/
yaml_alias_data_s :: struct {
    /** The anchor. */
    anchor: *yaml_char_t;

    /** The node id. */
    index:  s32;

    /** The anchor mark. */
    mark:   yaml_mark_t;
}

/**
* This structure holds aliases data.
*/
yaml_alias_data_t :: yaml_alias_data_s;

/**
* The parser structure.
*
* All members are internal.  Manage the structure using the @c yaml_parser_
* family of functions.
*/
yaml_parser_s :: struct {
    /** Error type. */
    error:                 yaml_error_type_t;

    /** Error description. */
    problem:               *u8;

    /** The byte about which the problem occurred. */
    problem_offset:        u64;

    /** The problematic value (@c -1 is none). */
    problem_value:         s32;

    /** The problem position. */
    problem_mark:          yaml_mark_t;

    /** The error context. */
    _context:              *u8;

    /** The context position. */
    context_mark:          yaml_mark_t;

    /** Read handler. */
    read_handler:          yaml_read_handler_t;

    /** A pointer for passing to the read handler. */
    read_handler_data:     *void;

    input:                 union {
        _string: struct {
            /** The string start pointer. */
            start:   *u8;

            /** The string end pointer. */
            end:     *u8;

            /** The string current position. */
            current: *u8;
        };

        /** File input data. */
        file:    *FILE;
    };

    /** EOF flag */
    eof:                   s32;

    buffer:                struct {
        /** The beginning of the buffer. */
        start:   *yaml_char_t;

        /** The end of the buffer. */
        end:     *yaml_char_t;

        /** The current position of the buffer. */
        pointer: *yaml_char_t;

        /** The last filled position of the buffer. */
        last:    *yaml_char_t;
    };

    /* The number of unread characters in the buffer. */
    unread:                u64;

    raw_buffer:            struct {
        /** The beginning of the buffer. */
        start:   *u8;

        /** The end of the buffer. */
        end:     *u8;

        /** The current position of the buffer. */
        pointer: *u8;

        /** The last filled position of the buffer. */
        last:    *u8;
    };

    /** The input encoding. */
    encoding:              yaml_encoding_t;

    /** The offset of the current position (in bytes). */
    offset:                u64;

    /** The mark of the current position. */
    mark:                  yaml_mark_t;

    /** Have we started to scan the input stream? */
    stream_start_produced: s32;

    /** Have we reached the end of the input stream? */
    stream_end_produced:   s32;

    /** The number of unclosed '[' and '{' indicators. */
    flow_level:            s32;

    tokens:                struct {
        /** The beginning of the tokens queue. */
        start: *yaml_token_t;

        /** The end of the tokens queue. */
        end:   *yaml_token_t;

        /** The head of the tokens queue. */
        head:  *yaml_token_t;

        /** The tail of the tokens queue. */
        tail:  *yaml_token_t;
    };

    /** The number of tokens fetched from the queue. */
    tokens_parsed:         u64;

    /** Does the tokens queue contain a token ready for dequeueing. */
    token_available:       s32;

    indents:               struct {
        /** The beginning of the stack. */
        start: *s32;

        /** The end of the stack. */
        end:   *s32;

        /** The top of the stack. */
        top:   *s32;
    };

    /** The current indentation level. */
    indent:                s32;

    /** May a simple key occur at the current position? */
    simple_key_allowed:    s32;

    simple_keys:           struct {
        /** The beginning of the stack. */
        start: *yaml_simple_key_t;

        /** The end of the stack. */
        end:   *yaml_simple_key_t;

        /** The top of the stack. */
        top:   *yaml_simple_key_t;
    };

    states:                struct {
        /** The beginning of the stack. */
        start: *yaml_parser_state_t;

        /** The end of the stack. */
        end:   *yaml_parser_state_t;

        /** The top of the stack. */
        top:   *yaml_parser_state_t;
    };

    /** The current parser state. */
    state:                 yaml_parser_state_t;

    marks:                 struct {
        /** The beginning of the stack. */
        start: *yaml_mark_t;

        /** The end of the stack. */
        end:   *yaml_mark_t;

        /** The top of the stack. */
        top:   *yaml_mark_t;
    };

    tag_directives:        struct {
        /** The beginning of the list. */
        start: *yaml_tag_directive_t;

        /** The end of the list. */
        end:   *yaml_tag_directive_t;

        /** The top of the list. */
        top:   *yaml_tag_directive_t;
    };

    aliases:               struct {
        /** The beginning of the list. */
        start: *yaml_alias_data_t;

        /** The end of the list. */
        end:   *yaml_alias_data_t;

        /** The top of the list. */
        top:   *yaml_alias_data_t;
    };

    /** The currently parsed document. */
    document:              *yaml_document_t;
}

/**
* The parser structure.
*
* All members are internal.  Manage the structure using the @c yaml_parser_
* family of functions.
*/
yaml_parser_t :: yaml_parser_s;

/**
* Initialize a parser.
*
* This function creates a new parser object.  An application is responsible
* for destroying the object using the yaml_parser_delete() function.
*
* @param[out]      parser  An empty parser object.
*
* @returns @c 1 if the function succeeded, @c 0 on error.
*/
yaml_parser_initialize :: (parser: *yaml_parser_t) -> s32 #foreign yaml;

/**
* Destroy a parser.
*
* @param[in,out]   parser  A parser object.
*/
yaml_parser_delete :: (parser: *yaml_parser_t) -> void #foreign yaml;

/**
* Set a string input.
*
* Note that the @a input pointer must be valid while the @a parser object
* exists.  The application is responsible for destroying @a input after
* destroying the @a parser.
*
* @param[in,out]   parser  A parser object.
* @param[in]       input   A source data.
* @param[in]       size    The length of the source data in bytes.
*/
yaml_parser_set_input_string :: (parser: *yaml_parser_t, input: *u8, size: u64) -> void #foreign yaml;

/**
* Set a file input.
*
* @a file should be a file object open for reading.  The application is
* responsible for closing the @a file.
*
* @param[in,out]   parser  A parser object.
* @param[in]       file    An open file.
*/
yaml_parser_set_input_file :: (parser: *yaml_parser_t, file: *FILE) -> void #foreign yaml;

/**
* Set a generic input handler.
*
* @param[in,out]   parser  A parser object.
* @param[in]       handler A read handler.
* @param[in]       data    Any application data for passing to the read
*                          handler.
*/
yaml_parser_set_input :: (parser: *yaml_parser_t, handler: yaml_read_handler_t, data: *void) -> void #foreign yaml;

/**
* Set the source encoding.
*
* @param[in,out]   parser      A parser object.
* @param[in]       encoding    The source encoding.
*/
yaml_parser_set_encoding :: (parser: *yaml_parser_t, encoding: yaml_encoding_t) -> void #foreign yaml;

/**
* Scan the input stream and produce the next token.
*
* Call the function subsequently to produce a sequence of tokens corresponding
* to the input stream.  The initial token has the type
* @c YAML_STREAM_START_TOKEN while the ending token has the type
* @c YAML_STREAM_END_TOKEN.
*
* An application is responsible for freeing any buffers associated with the
* produced token object using the @c yaml_token_delete function.
*
* An application must not alternate the calls of yaml_parser_scan() with the
* calls of yaml_parser_parse() or yaml_parser_load(). Doing this will break
* the parser.
*
* @param[in,out]   parser      A parser object.
* @param[out]      token       An empty token object.
*
* @returns @c 1 if the function succeeded, @c 0 on error.
*/
yaml_parser_scan :: (parser: *yaml_parser_t, token: *yaml_token_t) -> s32 #foreign yaml;

/**
* Parse the input stream and produce the next parsing event.
*
* Call the function subsequently to produce a sequence of events corresponding
* to the input stream.  The initial event has the type
* @c YAML_STREAM_START_EVENT while the ending event has the type
* @c YAML_STREAM_END_EVENT.
*
* An application is responsible for freeing any buffers associated with the
* produced event object using the yaml_event_delete() function.
*
* An application must not alternate the calls of yaml_parser_parse() with the
* calls of yaml_parser_scan() or yaml_parser_load(). Doing this will break the
* parser.
*
* @param[in,out]   parser      A parser object.
* @param[out]      event       An empty event object.
*
* @returns @c 1 if the function succeeded, @c 0 on error.
*/
yaml_parser_parse :: (parser: *yaml_parser_t, event: *yaml_event_t) -> s32 #foreign yaml;

/**
* Parse the input stream and produce the next YAML document.
*
* Call this function subsequently to produce a sequence of documents
* constituting the input stream.
*
* If the produced document has no root node, it means that the document
* end has been reached.
*
* An application is responsible for freeing any data associated with the
* produced document object using the yaml_document_delete() function.
*
* An application must not alternate the calls of yaml_parser_load() with the
* calls of yaml_parser_scan() or yaml_parser_parse(). Doing this will break
* the parser.
*
* @param[in,out]   parser      A parser object.
* @param[out]      document    An empty document object.
*
* @returns @c 1 if the function succeeded, @c 0 on error.
*/
yaml_parser_load :: (parser: *yaml_parser_t, document: *yaml_document_t) -> s32 #foreign yaml;

/**
* Get the maximum depth of nesting.
*
* Default: 1000
*
* Each nesting level increases the stack and the number of previous
* starting events that the parser has to check.
*
* @returns The maximum number of allowed nested events.
*/
yaml_get_max_nest_level :: (__args: ..Any) -> s32 #foreign yaml;

/**
* Set the maximum depth of nesting.
*
* Each nesting level increases the stack and the number of previous
* starting events that the parser has to check.
*
* @param[in]       max         The maximum number of allowed nested events
*/
yaml_set_max_nest_level :: (max: s32) -> void #foreign yaml;

/**
* The prototype of a write handler.
*
* The write handler is called when the emitter needs to flush the accumulated
* characters to the output.  The handler should write @a size bytes of the
* @a buffer to the output.
*
* @param[in,out]   data        A pointer to an application data specified by
*                              yaml_emitter_set_output().
* @param[in]       buffer      The buffer with bytes to be written.
* @param[in]       size        The size of the buffer.
*
* @returns On success, the handler should return @c 1.  If the handler failed,
* the returned value should be @c 0.
*/
yaml_write_handler_t :: #type (data: *void, buffer: *u8, size: u64) -> s32 #c_call;

/** The emitter states. */
yaml_emitter_state_e :: enum s32 {
    STREAM_START_STATE               :: 0;

    FIRST_DOCUMENT_START_STATE       :: 1;

    DOCUMENT_START_STATE             :: 2;

    DOCUMENT_CONTENT_STATE           :: 3;

    DOCUMENT_END_STATE               :: 4;

    FLOW_SEQUENCE_FIRST_ITEM_STATE   :: 5;

    FLOW_SEQUENCE_ITEM_STATE         :: 6;

    FLOW_MAPPING_FIRST_KEY_STATE     :: 7;

    FLOW_MAPPING_KEY_STATE           :: 8;

    FLOW_MAPPING_SIMPLE_VALUE_STATE  :: 9;

    FLOW_MAPPING_VALUE_STATE         :: 10;

    BLOCK_SEQUENCE_FIRST_ITEM_STATE  :: 11;

    BLOCK_SEQUENCE_ITEM_STATE        :: 12;

    BLOCK_MAPPING_FIRST_KEY_STATE    :: 13;

    BLOCK_MAPPING_KEY_STATE          :: 14;

    BLOCK_MAPPING_SIMPLE_VALUE_STATE :: 15;

    BLOCK_MAPPING_VALUE_STATE        :: 16;

    END_STATE                        :: 17;

    YAML_EMIT_STREAM_START_STATE               :: STREAM_START_STATE;

    YAML_EMIT_FIRST_DOCUMENT_START_STATE       :: FIRST_DOCUMENT_START_STATE;

    YAML_EMIT_DOCUMENT_START_STATE             :: DOCUMENT_START_STATE;

    YAML_EMIT_DOCUMENT_CONTENT_STATE           :: DOCUMENT_CONTENT_STATE;

    YAML_EMIT_DOCUMENT_END_STATE               :: DOCUMENT_END_STATE;

    YAML_EMIT_FLOW_SEQUENCE_FIRST_ITEM_STATE   :: FLOW_SEQUENCE_FIRST_ITEM_STATE;

    YAML_EMIT_FLOW_SEQUENCE_ITEM_STATE         :: FLOW_SEQUENCE_ITEM_STATE;

    YAML_EMIT_FLOW_MAPPING_FIRST_KEY_STATE     :: FLOW_MAPPING_FIRST_KEY_STATE;

    YAML_EMIT_FLOW_MAPPING_KEY_STATE           :: FLOW_MAPPING_KEY_STATE;

    YAML_EMIT_FLOW_MAPPING_SIMPLE_VALUE_STATE  :: FLOW_MAPPING_SIMPLE_VALUE_STATE;

    YAML_EMIT_FLOW_MAPPING_VALUE_STATE         :: FLOW_MAPPING_VALUE_STATE;

    YAML_EMIT_BLOCK_SEQUENCE_FIRST_ITEM_STATE  :: BLOCK_SEQUENCE_FIRST_ITEM_STATE;

    YAML_EMIT_BLOCK_SEQUENCE_ITEM_STATE        :: BLOCK_SEQUENCE_ITEM_STATE;

    YAML_EMIT_BLOCK_MAPPING_FIRST_KEY_STATE    :: BLOCK_MAPPING_FIRST_KEY_STATE;

    YAML_EMIT_BLOCK_MAPPING_KEY_STATE          :: BLOCK_MAPPING_KEY_STATE;

    YAML_EMIT_BLOCK_MAPPING_SIMPLE_VALUE_STATE :: BLOCK_MAPPING_SIMPLE_VALUE_STATE;

    YAML_EMIT_BLOCK_MAPPING_VALUE_STATE        :: BLOCK_MAPPING_VALUE_STATE;

    YAML_EMIT_END_STATE                        :: END_STATE;
}

/** The emitter states. */
yaml_emitter_state_t :: yaml_emitter_state_e;

/* This is needed for C++ */
yaml_anchors_s :: struct {
    /** The number of references. */
    references: s32;

    /** The anchor id. */
    anchor:     s32;

    /** If the node has been emitted? */
    serialized: s32;
}

/* This is needed for C++ */
yaml_anchors_t :: yaml_anchors_s;

/**
* The emitter structure.
*
* All members are internal.  Manage the structure using the @c yaml_emitter_
* family of functions.
*/
yaml_emitter_s :: struct {
    /** Error type. */
    error:              yaml_error_type_t;

    /** Error description. */
    problem:            *u8;

    /** Write handler. */
    write_handler:      yaml_write_handler_t;

    /** A pointer for passing to the write handler. */
    write_handler_data: *void;

    output:             union {
        _string: struct {
            /** The buffer pointer. */
            buffer:       *u8;

            /** The buffer size. */
            size:         u64;

            /** The number of written bytes. */
            size_written: *u64;
        };

        /** File output data. */
        file:    *FILE;
    };

    buffer:             struct {
        /** The beginning of the buffer. */
        start:   *yaml_char_t;

        /** The end of the buffer. */
        end:     *yaml_char_t;

        /** The current position of the buffer. */
        pointer: *yaml_char_t;

        /** The last filled position of the buffer. */
        last:    *yaml_char_t;
    };

    raw_buffer:         struct {
        /** The beginning of the buffer. */
        start:   *u8;

        /** The end of the buffer. */
        end:     *u8;

        /** The current position of the buffer. */
        pointer: *u8;

        /** The last filled position of the buffer. */
        last:    *u8;
    };

    /** The stream encoding. */
    encoding:           yaml_encoding_t;

    /** If the output is in the canonical style? */
    canonical:          s32;

    /** The number of indentation spaces. */
    best_indent:        s32;

    /** The preferred width of the output lines. */
    best_width:         s32;

    /** Allow unescaped non-ASCII characters? */
    unicode:            s32;

    /** The preferred line break. */
    line_break:         yaml_break_t;

    states:             struct {
        /** The beginning of the stack. */
        start: *yaml_emitter_state_t;

        /** The end of the stack. */
        end:   *yaml_emitter_state_t;

        /** The top of the stack. */
        top:   *yaml_emitter_state_t;
    };

    /** The current emitter state. */
    state:              yaml_emitter_state_t;

    events:             struct {
        /** The beginning of the event queue. */
        start: *yaml_event_t;

        /** The end of the event queue. */
        end:   *yaml_event_t;

        /** The head of the event queue. */
        head:  *yaml_event_t;

        /** The tail of the event queue. */
        tail:  *yaml_event_t;
    };

    indents:            struct {
        /** The beginning of the stack. */
        start: *s32;

        /** The end of the stack. */
        end:   *s32;

        /** The top of the stack. */
        top:   *s32;
    };

    tag_directives:     struct {
        /** The beginning of the list. */
        start: *yaml_tag_directive_t;

        /** The end of the list. */
        end:   *yaml_tag_directive_t;

        /** The top of the list. */
        top:   *yaml_tag_directive_t;
    };

    /** The current indentation level. */
    indent:             s32;

    /** The current flow level. */
    flow_level:         s32;

    /** Is it the document root context? */
    root_context:       s32;

    /** Is it a sequence context? */
    sequence_context:   s32;

    /** Is it a mapping context? */
    mapping_context:    s32;

    /** Is it a simple mapping key context? */
    simple_key_context: s32;

    /** The current line. */
    line:               s32;

    /** The current column. */
    column:             s32;

    /** If the last character was a whitespace? */
    whitespace:         s32;

    /** If the last character was an indentation character (' ', '-', '?', ':')? */
    indention:          s32;

    /** If an explicit document end is required? */
    open_ended:         s32;

    anchor_data:        struct {
        /** The anchor value. */
        anchor:        *yaml_char_t;

        /** The anchor length. */
        anchor_length: u64;

        /** Is it an alias? */
        alias:         s32;
    };

    tag_data:           struct {
        /** The tag handle. */
        handle:        *yaml_char_t;

        /** The tag handle length. */
        handle_length: u64;

        /** The tag suffix. */
        suffix:        *yaml_char_t;

        /** The tag suffix length. */
        suffix_length: u64;
    };

    scalar_data:        struct {
        /** The scalar value. */
        value:                 *yaml_char_t;

        /** The scalar length. */
        length:                u64;

        /** Does the scalar contain line breaks? */
        multiline:             s32;

        /** Can the scalar be expressed in the flow plain style? */
        flow_plain_allowed:    s32;

        /** Can the scalar be expressed in the block plain style? */
        block_plain_allowed:   s32;

        /** Can the scalar be expressed in the single quoted style? */
        single_quoted_allowed: s32;

        /** Can the scalar be expressed in the literal or folded styles? */
        block_allowed:         s32;

        /** The output style. */
        style:                 yaml_scalar_style_t;
    };

    /** If the stream was already opened? */
    opened:             s32;

    /** If the stream was already closed? */
    closed:             s32;

    /** The information associated with the document nodes. */
    anchors:            *yaml_anchors_t;

    /** The last assigned anchor id. */
    last_anchor_id:     s32;

    /** The currently emitted document. */
    document:           *yaml_document_t;
}

/**
* The emitter structure.
*
* All members are internal.  Manage the structure using the @c yaml_emitter_
* family of functions.
*/
yaml_emitter_t :: yaml_emitter_s;

/**
* Initialize an emitter.
*
* This function creates a new emitter object.  An application is responsible
* for destroying the object using the yaml_emitter_delete() function.
*
* @param[out]      emitter     An empty parser object.
*
* @returns @c 1 if the function succeeded, @c 0 on error.
*/
yaml_emitter_initialize :: (emitter: *yaml_emitter_t) -> s32 #foreign yaml;

/**
* Destroy an emitter.
*
* @param[in,out]   emitter     An emitter object.
*/
yaml_emitter_delete :: (emitter: *yaml_emitter_t) -> void #foreign yaml;

/**
* Set a string output.
*
* The emitter will write the output characters to the @a output buffer of the
* size @a size.  The emitter will set @a size_written to the number of written
* bytes.  If the buffer is smaller than required, the emitter produces the
* YAML_WRITE_ERROR error.
*
* @param[in,out]   emitter         An emitter object.
* @param[in]       output          An output buffer.
* @param[in]       size            The buffer size.
* @param[in]       size_written    The pointer to save the number of written
*                                  bytes.
*/
yaml_emitter_set_output_string :: (emitter: *yaml_emitter_t, output: *u8, size: u64, size_written: *u64) -> void #foreign yaml;

/**
* Set a file output.
*
* @a file should be a file object open for writing.  The application is
* responsible for closing the @a file.
*
* @param[in,out]   emitter     An emitter object.
* @param[in]       file        An open file.
*/
yaml_emitter_set_output_file :: (emitter: *yaml_emitter_t, file: *FILE) -> void #foreign yaml;

/**
* Set a generic output handler.
*
* @param[in,out]   emitter     An emitter object.
* @param[in]       handler     A write handler.
* @param[in]       data        Any application data for passing to the write
*                              handler.
*/
yaml_emitter_set_output :: (emitter: *yaml_emitter_t, handler: yaml_write_handler_t, data: *void) -> void #foreign yaml;

/**
* Set the output encoding.
*
* @param[in,out]   emitter     An emitter object.
* @param[in]       encoding    The output encoding.
*/
yaml_emitter_set_encoding :: (emitter: *yaml_emitter_t, encoding: yaml_encoding_t) -> void #foreign yaml;

/**
* Set if the output should be in the "canonical" format as in the YAML
* specification.
*
* @param[in,out]   emitter     An emitter object.
* @param[in]       canonical   If the output is canonical.
*/
yaml_emitter_set_canonical :: (emitter: *yaml_emitter_t, canonical: s32) -> void #foreign yaml;

/**
* Set the indentation increment.
*
* @param[in,out]   emitter     An emitter object.
* @param[in]       indent      The indentation increment (1 < . < 10).
*/
yaml_emitter_set_indent :: (emitter: *yaml_emitter_t, indent: s32) -> void #foreign yaml;

/**
* Set the preferred line width. @c -1 means unlimited.
*
* @param[in,out]   emitter     An emitter object.
* @param[in]       width       The preferred line width.
*/
yaml_emitter_set_width :: (emitter: *yaml_emitter_t, width: s32) -> void #foreign yaml;

/**
* Set if unescaped non-ASCII characters are allowed.
*
* @param[in,out]   emitter     An emitter object.
* @param[in]       unicode     If unescaped Unicode characters are allowed.
*/
yaml_emitter_set_unicode :: (emitter: *yaml_emitter_t, unicode: s32) -> void #foreign yaml;

/**
* Set the preferred line break.
*
* @param[in,out]   emitter     An emitter object.
* @param[in]       line_break  The preferred line break.
*/
yaml_emitter_set_break :: (emitter: *yaml_emitter_t, line_break: yaml_break_t) -> void #foreign yaml;

/**
* Emit an event.
*
* The event object may be generated using the yaml_parser_parse() function.
* The emitter takes the responsibility for the event object and destroys its
* content after it is emitted. The event object is destroyed even if the
* function fails.
*
* @param[in,out]   emitter     An emitter object.
* @param[in,out]   event       An event object.
*
* @returns @c 1 if the function succeeded, @c 0 on error.
*/
yaml_emitter_emit :: (emitter: *yaml_emitter_t, event: *yaml_event_t) -> s32 #foreign yaml;

/**
* Start a YAML stream.
*
* This function should be used before yaml_emitter_dump() is called.
*
* @param[in,out]   emitter     An emitter object.
*
* @returns @c 1 if the function succeeded, @c 0 on error.
*/
yaml_emitter_open :: (emitter: *yaml_emitter_t) -> s32 #foreign yaml;

/**
* Finish a YAML stream.
*
* This function should be used after yaml_emitter_dump() is called.
*
* @param[in,out]   emitter     An emitter object.
*
* @returns @c 1 if the function succeeded, @c 0 on error.
*/
yaml_emitter_close :: (emitter: *yaml_emitter_t) -> s32 #foreign yaml;

/**
* Emit a YAML document.
*
* The document object may be generated using the yaml_parser_load() function
* or the yaml_document_initialize() function.  The emitter takes the
* responsibility for the document object and destroys its content after
* it is emitted. The document object is destroyed even if the function fails.
*
* @param[in,out]   emitter     An emitter object.
* @param[in,out]   document    A document object.
*
* @returns @c 1 if the function succeeded, @c 0 on error.
*/
yaml_emitter_dump :: (emitter: *yaml_emitter_t, document: *yaml_document_t) -> s32 #foreign yaml;

/**
* Flush the accumulated characters to the output.
*
* @param[in,out]   emitter     An emitter object.
*
* @returns @c 1 if the function succeeded, @c 0 on error.
*/
yaml_emitter_flush :: (emitter: *yaml_emitter_t) -> s32 #foreign yaml;

#scope_file

yaml :: #library,no_dll "lib/yaml";
