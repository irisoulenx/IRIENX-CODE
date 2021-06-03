use kern::kern;
use lsp::lsp;
fn main() {
    kern::kern_works();
    lsp::lsp_works();
    println!("Hello, world!");
}