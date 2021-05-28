#!/usr/bin/bash
# Name: lain-code build script
# Version: v0.1.0
# Author: Siegfried Wu
# Notice: THIS SCRIPT IS ONLY FOR LINUX.

project_name="lain-code"
system_target="Linux"
system_type=`uname -o`
system_bit=`uname -i`
check_cargo=`cargo --version`
check_rustc=`rustc --version`
check_clang=`clang --version`
check_clang_ver=`clang --version | grep -Eo "[0-9]+\.[0-9]+\.[0-9]"`
check_make=`make --version`
check_make_ver=`make --version | grep -Eo "[0-9]+\.[0-9]"`
check_cmake=`cmake --version`
check_cmake_ver=`cmake --version | grep -Eo "[0-9]+\.[0-9]+\.[0-9]"`

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
    read -r -p "Do you want to install rustup? [Y\N] default [N]: " yesorno
    case $yesorno in
        [yY][eE][sS]|[yY])
	    	echo "  Install rustup from sh.rustup.rs..."
            curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
		    ;;

        [nN][oO]|[nN]|*)
		    echo "  Or you have a better way,see you later."
            exit 1
       	    ;;
    esac
fi

# check c toolchain.
code=0
if [ ${check_clang%% *} == "clang" ];then
    echo -e "   [\033[32m SUCCESS \033[0m] clang check:\033[36m clang ${check_clang_ver}\033[0m"
else
    echo -e "   [\033[31m FAILED  \033[0m] clang is not detected in the system."
    code=1
fi

if [ ${check_cmake%% *} == "cmake" ];then
    echo -e "   [\033[32m SUCCESS \033[0m] cmake check:\033[36m cmake ${check_cmake_ver}\033[0m"
else
    echo -e "   [\033[31m FAILED  \033[0m] cmake is not detected in the system."
    code=2
fi

if [ ${check_make%% *} == "GNU" ];then
    echo -e "   [\033[32m SUCCESS \033[0m] make  check:\033[36m make ${check_make_ver}\033[0m"
else
    echo -e "   [\033[31m FAILED  \033[0m] make is not detected in the system."
    code=3
fi

# if c toolchain is not installed,here will work.
if [ ${code} == "1" ];then
    read -r -p "Do you want to install clang? [Y\N] default [N]: " yesorno
    case $yesorno in
        [yY][eE][sS]|[yY])
	    	echo "  Install clang from official repo..."
            case 
            esac
		    ;;

        [nN][oO]|[nN]|*)
		    echo "  Or you have a better way,see you later."
            exit 1
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
fi

if [ ${system_bit} == "x86_64" ];then
    echo -e "   [\033[32m SUCCESS \033[0m] cpu architecture check:\033[36m ${system_bit}\033[0m"
else
    echo -e "   [\033[33m WARNING \033[0m] "
    exit 1
fi
echo ""
echo "Start compiling lain-core."

# to be continued
exit 0