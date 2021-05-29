use plugins::test;
use utils::utils;
use kern::kern;
use lsp::lsp;
fn main() {
    test::PluginsCheck::success();
    utils::utils_works();
    kern::kern_works();
    lsp::lsp_works();
    println!("Hello, world!");
}