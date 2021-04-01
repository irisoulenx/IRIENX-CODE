# ![](res/icons/logo.jpg) Lain Code

An open source and free lightweight code editor.

---

### How does it look

![](res/icons/logo-800x800.png)

---

### How to build

Lain code's interface uses **DearPyGui**, its core uses rust, and it supports plug-ins written in Python.

Make sure all required tools are installed.

|tools|status|
|-|-|
|python|latest|
|pip|latest|
|rust|latest stable|
|cargo|latest stable|
|

You can compile each module step by step:
```
$ cd lain-core
$ cargo build
$ python ../startup.py or pyinstaller -F ../startup.py
```
or use shell script to install(recommended for Linux)

```
$ ./setup.sh
```

---

### How to contribute
1. Fork this repo
2. Make sure the repo status is up to date
3. Modify or add something
4. Open a pull request in Github

---

### License

![License](https://img.shields.io/github/license/alchepic/Lain-code?color=green&style=flat-square)
