/*--------------------------------------------------
* THIS FILE IS PART OF FAYE-TEXT.
* LICENSED UNDER THE MIT LICENSE.
*
* Copyright (c) 2020-2021 Siegfried Wu.
*--------------------------------------------------*/

use kern::kern_fun::kern_works;
use lsp::lsp;
use utils::version;

fn main() {
    kern_works();
    lsp::lsp_works();
    version::version();
    println!("Hello, world!");
}