"""
Work with *.cab files
"""
from ctypes import pythonapi
from ctypes import cdll
from ctypes import cast
import ctypes as _ctypes

libc = cdll[_ctypes.util.find_library('c')]
libcab = cdll[_ctypes.util.find_library('cabinet')]

PyMem_Malloc = pythonapi.PyMem_Malloc
PyMem_Malloc.restype = _ctypes.c_size_t
PyMem_Malloc.argtypes = [_ctypes.c_size_t]

strncpy = libc.strncpy
strncpy.restype = _ctypes.c_char_p
strncpy.argtypes = [_ctypes.c_char_p, _ctypes.c_char_p, _ctypes.c_size_t]

HOOKFUNC = _ctypes.CFUNCTYPE(_ctypes.c_char_p, _ctypes.c_void_p, _ctypes.c_void_p, _ctypes.c_char_p)

# typedef struct {
#  DWORD cbStruct;
#  DWORD dwReserved1;
#  DWORD dwReserved2;
#  DWORD dwFileVersionMS;
#  DWORD dwFileVersionLS;
# } CABINETDLLVERSIONINFO, *PCABINETDLLVERSIONINFO;

class CABINETDLLVERSIONINFO(_ctypes.Structure):
    _fields_ = [('cbStruct', _ctypes.c_double),
                ('dwReserved1', _ctypes.c_double),
                ('dwReserved2', _ctypes.c_double),
                ('dwFileVersionMS', _ctypes.c_double),
                ('dwFileVersionLS', _ctypes.c_double)]

libcab.DllGetVersion.restype = CABINETDLLVERSIONINFO
