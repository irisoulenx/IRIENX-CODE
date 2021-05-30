#!/usr/bin/bash
# Name: faye-text build script
# Version: v0.1.0
# Author: Siegfried Wu
# Notice: THIS SCRIPT IS ONLY FOR LINUX.

project_name="faye-text"
system_target="Linux"
system_type=`uname -o`
system_bit=`uname -i`
check_cargo=`cargo --version`
check_rustc=`rustc --version`

echo -e "\033[32m\033[42m-------------------------------------------------------------------------------\033[0m

     _/                  _/                  _/_/_/                  _/
    _/          _/_/_/      _/_/_/        _/          _/_/      _/_/_/    _/_/
   _/        _/    _/  _/  _/    _/      _/        _/    _/  _/    _/  _/_/_/_/
  _/        _/    _/  _/  _/    _/      _/        _/    _/  _/    _/  _/
 _/_/_/_/    _/_/_/  _/  _/    _/        _/_/_/    _/_/      _/_/_/    _/_/_/

\033[32m\033[42m-------------------------------------------------------------------------------\033[0m

\033[36mThank you very much for using my software. \033[0m
"

# check toolchain.
echo -e "Checking the build toolchain..."

# check rust toolchain.
code=0
if [ ${check_cargo%% *} == "cargo" ];then
    echo -e "   [\033[32m SUCCESS \033[0m] cargo check:\033[36m ${check_cargo%% (*}\033[0m"
else
    echo -e "   [\033[31m FAILED  \033[0m] cargo is not detected in the system."
    code=1
fi

if [ ${check_rustc%% *} == "rustc" ];then
    echo -e "   [\033[32m SUCCESS \033[0m] rustc check:\033[36m ${check_rustc%% (*}\033[0m"
else
    echo -e "   [\033[31m FAILED  \033[0m] rustc is not detected in the system."
    code=1
fi

# if rust toolchain is not installed,here will work.
if [ ${code} == "1" ];then
    read -r -p "Do you want to install rustup? [Y/N] default [N]: " yesorno
    case $yesorno in
        [yY][eE][sS]|[yY])
	    	echo "  Install rustup from sh.rustup.rs..."
            curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
		    ;;

        [nN][oO]|[nN]|*)
		    echo "  Or you have a better way,see you later."
            exit 0
       	    ;;
    esac
fi

echo ""

# check operation system
echo "Checking the operation system..."
if [ ${system_type}=~${system_target} ];then
    echo -e "   [\033[32m SUCCESS \033[0m] operating system check:\033[36m ${system_type}\033[0m"
else
    echo -e "   [\033[33m WARNING \033[0m] the script is only for Linux, it is not clear whether it can be run on other systems."
    exit 1
fi

if [ ${system_bit} == "x86_64" ];then
    echo -e "   [\033[32m SUCCESS \033[0m] cpu architecture check:\033[36m ${system_bit}\033[0m"
else
    echo -e "   [\033[33m WARNING \033[0m] I am not sure if it can run on a 32bit machine."
    exit 1
fi

echo ""

# compiling faye-text
echo "Start compiling faye-text..."

echo ""

    read -r -p "In what way do you want to build this project? [(D)ebug)/(R)elease/(C)ancel]: " status
    case $status in
        [dD])
	    	echo "  Compile the debug version..."
            cargo build
            read -r -p "Do you want to run this project now? [Y/N] default [N]: " runDebug
            case $runDebug in
                [yY][eE][sS]|[yY])
                    echo "  Start faye-text (debug)..."
                    cargo run
                    ;;
                [nN][oO]|[nN]|*)
                    echo "  Maybe later..."
                    exit 0
                    ;;
            esac
		    ;;
        [rR])
	    	echo "  Compile the release version..."
            cargo build --release
            read -r -p "Do you want to run this project now? [Y/N] default [N]: " runRelease
            case $runRelease in
                [yY][eE][sS]|[yY])
                    echo "  Start faye-text (release)..."
                    cargo run --release
                    ;;
                [nN][oO]|[nN]|*)
                    echo "  Maybe later..."
                    exit 0
                    ;;
            esac
		    ;;
        *)
		    echo "  Or you have a better way,see you later."
            exit 0
       	    ;;
    esac

echo ""

echo -e "\033[36mIt looks like everything is over smoothly, goodbye! \033[0m"

exit 0