mod init;

use faye_core::*;
use faye_lsp::*;
use faye_plugins::*;
use faye_utils::version;

fn main() {
    init::init();
    core::works();
    lsp::works();
    plugins::works();
    version::version();
}
