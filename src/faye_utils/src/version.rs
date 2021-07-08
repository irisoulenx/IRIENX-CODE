use std::env;

const VERSION: &str = "0.1.0";

pub fn version() {
    let env_args: Vec<String> = env::args().collect();
    println!("{:?}", Some(env_args.get(1)));
    println!("{}", VERSION);
}
