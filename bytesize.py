# -*- coding: utf-8 -*-
"""
@author: stk
"""
import sys
import itertools
from collections import defaultdict

_ver = sys.version_info

#: Python 2.x?
_is_py2 = (_ver[0] == 2)

#: Python 3.x?
_is_py3 = (_ver[0] == 3)

if _is_py2:
    builtin_str = str
    bytes = str
    str = unicode
    basestring = basestring
    numeric_types = (int, long, float)
    integer_types = (int, long)

elif _is_py3:
    builtin_str = str
    str = str
    bytes = bytes
    basestring = (str, bytes)
    numeric_types = (int, float)
    integer_types = (int,)



class _CaseInsensitiveDict(dict):
    """CaseInsensitiveDict with aliasing."""
    def _k(self, key):
        """get normalized key."""
        k = key.upper() if isinstance(key, basestring) else key
        return self.get_alias(k) or k
       
    def __init__(self, *args, **kwargs):
        super(_CaseInsensitiveDict, self).__init__(*args, **kwargs)
        self._pseudonyms = defaultdict(list)
        self._convert_keys()
    
    def set_alias(self, key, aliaslist):
        self._pseudonyms[key] = set([key]+aliaslist)

    def get_alias(self, key):
        alias = None
        for k, aliaslist in iter(self._pseudonyms.items()):
            if key in aliaslist:
                alias = k
                break
        return alias
            
    def __getitem__(self, key):
        return super(_CaseInsensitiveDict, self).__getitem__(self._k(key))
    
    def __setitem__(self, key, value):
        super(_CaseInsensitiveDict, self).__setitem__(self._k(key), value)
    
    def _convert_keys(self):
        """normalize keys set during dict constructor."""
        for k in list(self.keys()):
            v = super(_CaseInsensitiveDict, self).pop(k)
            self.__setitem__(k, v)

            
    
B = SZ_B,SUFFIX_B = 1<<0, 'B'
KB = SZ_KB,SUFFIX_KB = 1<<10, 'KB'
MB = SZ_MB,SUFFIX_MB = 1<<20, 'MB'
GB = SZ_GB,SUFFIX_GB = 1<<30, 'GB'
TB = SZ_TB,SUFFIX_TB = 1<<40, 'TB'
PB = SZ_PB,SUFFIX_PB = 1<<50, 'PB'
EB = SZ_EB,SUFFIX_EB = 1<<60, 'EB'
ZB = SZ_ZB,SUFFIX_ZB = 1<<70, 'ZB'
YB = SZ_YB,SUFFIX_YB = 1<<80, 'YB'

_size_list = [B, KB, MB, GB, TB, PB, EB, ZB, YB]
_size_names = [suffix for _,suffix in _size_list]
_size_multipliers = [mult for mult,_ in _size_list]

size_map = _CaseInsensitiveDict(zip(_size_names, _size_multipliers))
size_map.set_alias(SUFFIX_B,  ['BYTE', 'BYTES', ''])
size_map.set_alias(SUFFIX_KB, ['KILO', 'KILOS', 'KILOBYTE', 'KILOBYTES', 'K'])
size_map.set_alias(SUFFIX_MB, ['MEGA', 'MEGAS', 'MEGABYTE', 'MEGABYTES', 'M'])
size_map.set_alias(SUFFIX_GB, ['GIGA', 'GIGAS', 'GIGABYTE', 'GIGABYTES', 'G'])
size_map.set_alias(SUFFIX_TB, ['TERA', 'TERAS', 'TERABYTE', 'TERABYTES', 'T'])
size_map.set_alias(SUFFIX_PB, ['PETA', 'PETAS', 'PETABYTE', 'PETABYTES', 'P'])
size_map.set_alias(SUFFIX_EB, ['EXA',  'EXABS',  'EXABYTE',  'EXABYTES',  'E'])
size_map.set_alias(SUFFIX_ZB, ['ZETA',  'ZETTA',  'EXABYTE',  'EXABYTES',  'E'])
size_map.set_alias(SUFFIX_YB, ['YOTA', 'YOTTA', 'YOTTABYTE','YOTTABYTES', 'Y'])


class ByteSize(int):
    
    def as_unit(self, unit_suffix):
        dividend, divisor = self, size_map[unit_suffix]
        k = 1.0 if divisor>1 else 1
        return dividend/(k*divisor)
        
    def __new__(cls, value):
        kv = [''.join(x) for _, x in itertools.groupby(str(value), key=str.isdigit)]
        if not kv or len(kv) > 2:
            raise ValueError('invalid ByteSize Val: %s' % str(value))
        multiplicand, multiplier = (kv+['B'])[:2]
        multiplicand = int(multiplicand)
        multiplier = size_map[str(multiplier).strip()]
        bytesize = multiplicand*multiplier
        return int.__new__(cls, bytesize)

