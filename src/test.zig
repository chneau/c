const std = @import("std");

test "simple test" {
    var list = std.ArrayList(i32).init(std.testing.allocator);
    defer list.deinit(); // try commenting this out and see if zig detects the memory leak!
    try list.append(42);
    try std.testing.expectEqual(@as(i32, 42), list.pop());
}

test "simple addition test" {
    const a = 1;
    const b = 2;
    const expected = 3;
    const actual = a + b;
    try std.testing.expectEqual(expected, actual);
}
