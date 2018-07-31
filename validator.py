# -*- coding: utf-8 -*-
"""
Created on Fri Jul 27 20:24:28 2018

@author: steve
"""
regex_linuxpath = r'^\/$|(^(?=\/)|^\.|^\.\.)(\/(?=[^/\0])[^/\0]+)*\/?$'
regex_winpath = r'(^([a-z]|[A-Z]):(?=\\(?![\0-\37<>:"/\\|?*])|\/(?![\0-\37<>:"/\\|?*])|$)|^\\(?=[\\\/][^\0-\37<>:"/\\|?*]+)|^(?=(\\|\/)$)|^\.(?=(\\|\/)$)|^\.\.(?=(\\|\/)$)|^(?=(\\|\/)[^\0-\37<>:"/\\|?*]+)|^\.(?=(\\|\/)[^\0-\37<>:"/\\|?*]+)|^\.\.(?=(\\|\/)[^\0-\37<>:"/\\|?*]+))((\\|\/)[^\0-\37<>:"/\\|?*]+|(\\|\/)$)*()$'


class Validator(object):
    max_Nb_int = lambda N: int(pow(2,4*N))

    def eval(self, negate=False):
        is_valid = all(self._eval)
        self._eval = []
        return is_valid
    
    
    def push(self, eval_f, negate=False):
        print eval_f
        if negate:
            self._eval.append(not eval_f)
        else:
            self._eval.append(eval_f)
        return self
    
    def is_instance(self, typedef):
        return self.push(isinstance(self._obj, typedef))
    
    def is_gt(self, a, negate=False):
        return self.push(self._obj > a, negate)
    
    def is_gte(self, a):
        return self.push(self._obj >= a)
    
    def is_lt(self, b):
        return self.push(self._obj < b)
    
    def is_lte(self, b):
        return self.push(self._obj <= b)

    def is_between(self, a, b):
        return self.push(self.is_gt(a) and self.is_lt(b))
    
    def contains(self, soul, negate=False):
        return self.push(soul in self._obj, negate)
        
    def devoid_of(self, soul, negate=False):
        negate = not negate
        return self.contains(soul, negate)

    def len_lt(self, z):
        return self.push(len(self._obj) < z)
    
    def bitlen_lt(self, m):
        return self.push(int(self._obj).bit_length() < m)

    def bitlen_lte(self, m):
        return self.push(int(self._obj).bit_length() <= m)

    def len_lte(self, z):
        return self.push(len(self._obj) <= z)
    
    def len_gt(self, z):
        return self.push(len(self._obj) > z)

    def len_gte(self, z):
        return self.push(len(self._obj) >= z)
    
    def starts(self, substr):
        return self.push(str(self._obj).startswith(str(substr)))

    def ends(self, substr):
        return self.push(str(self._obj).endswith(str(substr)))
    
#    def is_digit(self):
#        return self.push(str(self._obj).isdigit())
#    
#    def is_space(self):
#        return self.push(str(self._obj).isspace())
    
    def __init__(self, obj):
        self._obj = obj
        self._eval = []
        self.is_alnum = lambda:self.push(str(self._obj).isalnum())
        self.is_digit = lambda:self.push(str(self._obj).isdigit())
        self.is_space = lambda:self.push(str(self._obj).isspace())
#        for funcname in filter(lambda s:s.startswith('is'), dir(str)):
#            print funcname
#            funcname_lcl = funcname.replace('is','is_')
#            print funcname_lcl
#            eval_f = lambda: self.push(getattr(str(self._obj), funcname)())
#            self.__dict__[funcname.replace('is','is_')] = eval_f

        
max_Nb_int = lambda N: int(pow(2,4*N))
n=Validator(9)
n.is_lt(30).is_gte(9).is_instance(int).eval()

s=Validator('somestring')
s=Validator([1,2,3])


# int that fits dssize
dssize =4000
_5kb = pow(2,10)*5
_4bytes = 4*8
is_size_valid = lambda dssize: Validator(dssize).is_gte(_5kb).bitlen_lte(_4bytes).eval()
is_ttl_valid = lambda ttl: Validator(ttl).is_gte(0).is_lt(pow(2,32)).eval()
is_path_valid = lambda path: Validator(path).devoid_of(' ').len_lt(256).eval()
