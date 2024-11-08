const std = @import("std");

const allocator = std.heap.page_allocator;

pub fn split_str(str: []const u8) []const []const u8 {
    var parts = std.mem.split(u8, str, " ");
    var result = std.ArrayList([]const u8).init(allocator);
    while (parts.next()) |part| result.append(part) catch return result.items;
    return result.items;
}

pub fn run_command(cmd: []const u8) !void {
    const argv = split_str(cmd);
    var child = std.process.Child.init(argv, allocator);
    try child.spawn();
    _ = try child.wait();
}

pub fn main() !void {
    try run_command("echo Hello, world!");
}
