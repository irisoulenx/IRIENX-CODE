from ctypes import cdll

lib = cdll.LoadLibrary('lc_core/target/release/liblc_core.so')

def test():
    assert lib.add(2,2) == 4
