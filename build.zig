const Builder = @import("std").build.Builder;
const ReleaseFast = @import("std").builtin.Mode.ReleaseFast;

pub fn build(b: *Builder) void {
    b.verbose = true;
    //const mode = b.standardReleaseOptions();
    const mode = ReleaseFast;
    const lib = b.addStaticLibrary("WOTS", "src/main.zig");
    lib.setBuildMode(mode);
    lib.install();

    var main_tests = b.addTest("src/main.zig");
    main_tests.setBuildMode(mode);

    const test_step = b.step("test", "Run library tests");
    test_step.dependOn(&main_tests.step);
}
