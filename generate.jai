#import "Basic";
#import "Compiler";
#import "Check";
#import "Bindings_Generator";
#import "File";

#run build();

build :: () {
    set_build_options_dc(.{do_output=false});

    if !generate_bindings() {
        compiler_set_workspace_status(.FAILED);
        return;
    }
}

generate_bindings :: () -> bool {
    output_filename: string;
    opts:            Generate_Bindings_Options;
    {
        using opts;

        #if OS == .WINDOWS {
            output_filename = "windows.jai";
            strip_flags     = 0;
        } else #if OS == .LINUX {
            output_filename = "linux.jai";
            strip_flags     = .INLINED_FUNCTIONS;
        } else #if OS == .MACOS {
            output_filename = "macos.jai";
            strip_flags     = .INLINED_FUNCTIONS;
        } else {
            assert(false);
        }

        array_add(*libpaths, "lib");
        array_add(*libnames, "yaml");
        array_add(*include_paths, "include");
        array_add(*source_files, "include/yaml.h");

        strip_flags = .INLINED_FUNCTIONS;
        log_stripped_declarations = false;
        generate_compile_time_struct_checks = false;

    }

    return generate_bindings(opts, output_filename);
}
