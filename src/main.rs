use lib_core::TestCore;
use lib_utils::lib_utils;

fn main() {
    TestCore::success();
    lib_utils::extend_works();
    println!("Hello, world!");
}