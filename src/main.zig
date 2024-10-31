const std = @import("std");

pub fn split_str(str: []const u8) []const []const u8 {
    var parts = std.mem.split(u8, str, " ");
    var result = std.ArrayList([]const u8).init(std.heap.page_allocator);
    while (parts.next()) |part| result.append(part) catch return result.items;
    return result.items;
}

pub fn run_command(argv: []const u8) !void {
    const x = split_str(argv);
    var child = std.process.Child.init(x, std.heap.page_allocator);
    try child.spawn();
    _ = try child.wait();
}

pub fn main() !void {
    std.debug.print("Hello, world!\n", .{});
    try run_command("echo Hello, world!");
}
