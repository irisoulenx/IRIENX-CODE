#!/usr/bin/env bash
# lain-core compilation script
# version: v0.1.0

name="lain-core"
system_target="Linux"
system_type=`uname`

echo "Check the compilation environment."

check_python=`python --version`
check_pip=`pip --version`
check_cargo=`cargo --version`
check_rustc=`rustc --version`

echo "------------------"

if [ ${check_pip%% *} = "pip" ];then
    echo -e "[\033[32m SUCCESS \033[0m] pip check (version ${check_pip%% f*})."
else
    echo -e "[\033[31m FAILED \033[0m] Please install pip."
fi

if [ ${check_python%% *} = "Python" ];then
    echo -e "[\033[32m SUCCESS \033[0m] python check (version ${check_python})."
else
    echo -e "[\033[31m FAILED \033[0m] Please install python."
fi

if [ ${check_cargo%% *} = "cargo" ];then
    echo -e "[\033[32m SUCCESS \033[0m] cargo check (version ${check_cargo%% (*})."
else
    echo -e "[\033[31m FAILED \033[0m] Please install cargo."
fi

if [ ${check_rustc%% *} = "rustc" ];then
    echo -e "[\033[32m SUCCESS \033[0m] rustc check (version ${check_rustc%% (*})."
else
    echo -e "[\033[31m FAILED \033[0m] Please install rustc."
fi

echo "------------------"

# check operation system

if [ ${system_type}=~${system_target} ];then
    echo -e "[\033[32m SUCCESS \033[0m] Operating system check: ${system_type}."
else
    echo -e "[\033[33m WARNING \033[0m] The script is only for Linux, it is not clear whether it can be run on other systems."
fi

echo ""

echo "Start compiling lain-core."

# to be continued

exit 0