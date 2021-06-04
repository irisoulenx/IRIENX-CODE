use kern::kern_fun::kern_works;
use lsp::lsp;
use utils::version;

fn main() {
    kern_works();
    lsp::lsp_works();
    version::version();
    println!("Hello, world!");
}