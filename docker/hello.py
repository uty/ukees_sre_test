import ctypes


libhello = ctypes.cdll.LoadLibrary('./libhello.so')
libhello.print_hello()
