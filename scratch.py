# -*- coding: utf-8 -*-
"""
Spyder Editor

This is a temporary script file.
"""
import base64
from pyasn1.codec.der import decoder
import pyasn1
from collections import namedtuple
Asn1Node = namedtuple('Asn1Node', ['type','length','value'])
path_to_privkey = r'D:/Program Files/cmder/vendor/git-for-windows/usr/ssl/cert.pem'

SPACE = ' '
FORMFEED = '\f'
NEWLINE = '\n'
HORZTAB = '\t'
VERTTAB = '\v'
CARRIAGE_RETURN = '\r'

class Process(object):
    """
    PID - the number of the process
TTY - the name of the console that the user is logged into
TIME- the amount of CPU in minutes and seconds that the process has been running
CMD - the name of the command that launched the process
    """
    pid = None
    tty = None
    time = None
    cmd = None


MAX_INT64 = (1 << 63) - 1
MAX_INT32 = (1 << 31) - 1
MAX_INT16 = (1 << 15) - 1

pem_markers = ('-----BEGIN RSA PRIVATE KEY-----',
               '-----END RSA PRIVATE KEY-----')
is_bytes = lambda obj: isinstance(obj, bytes)

def load_pem_privkey(data):
    pem = data.partition(pem_markers[1])[0]
    pem = pem.partition(pem_markers[0])[2]
    return base64.standard_b64decode(bytes(pem))

privkey_raw = ''
with open(path_to_privkey, 'rb') as kf:
    privkey_raw = kf.read()
privkey_pem = """
-----BEGIN RSA PRIVATE KEY-----
MIICXAIBAAKBgQCqGKukO1De7zhZj6+H0qtjTkVxwTCpvKe4eCZ0FPqri0cb2JZfXJ/DgYSF6vUp
wmJG8wVQZKjeGcjDOL5UlsuusFncCzWBQ7RKNUSesmQRMSGkVb1/3j+skZ6UtW+5u09lHNsj6tQ5
1s1SPrCBkedbNf0Tp0GbMJDyR4e9T04ZZwIDAQABAoGAFijko56+qGyN8M0RVyaRAXz++xTqHBLh
3tx4VgMtrQ+WEgCjhoTwo23KMBAuJGSYnRmoBZM3lMfTKevIkAidPExvYCdm5dYq3XToLkkLv5L2
pIIVOFMDG+KESnAFV7l2c+cnzRMW0+b6f8mR1CJzZuxVLL6Q02fvLi55/mbSYxECQQDeAw6fiIQX
GukBI4eMZZt4nscy2o12KyYner3VpoeE+Np2q+Z3pvAMd/aNzQ/W9WaI+NRfcxUJrmfPwIGm63il
AkEAxCL5HQb2bQr4ByorcMWm/hEP2MZzROV73yF41hPsRC9m66KrheO9HPTJuo3/9s5p+sqGxOlF
L0NDt4SkosjgGwJAFklyR1uZ/wPJjj611cdBcztlPdqoxssQGnh85BzCj/u3WqBpE2vjvyyvyI5k
X6zk7S0ljKtt2jny2+00VsBerQJBAJGC1Mg5Oydo5NwD6BiROrPxGo2bpTbu/fhrT8ebHkTz2epl
U9VQQSQzY1oZMVX8i1m5WUTLPz2yLJIBQVdXqhMCQBGoiuSoSjafUhV7i1cEGpb88h5NBYZzWXGZ
37sJ5QsW+sJyoNde3xH8vdXhzU7eT82D6X/scw9RZz+/6rCJ4p0=
-----END RSA PRIVATE KEY-----
"""

privkey_der = load_pem_privkey(privkey_pem)
#(priv, _) = decoder.decode(privkey_der)
####################### BEGIN ASN1 DECODER ############################

# Author: Jens Getreu, 8.11.2014

##### NAVIGATE

# The following 4 functions are all you need to parse an ASN1 structure

# gets the first ASN1 structure in der
def asn1_node_root(der):
        return asn1_read_length(der,0)

# gets the next ASN1 structure following (ixs,ixf,ixl)
def asn1_node_next(der, (ixs,ixf,ixl)):
        return asn1_read_length(der,ixl+1)

# opens the container (ixs,ixf,ixl) and returns the first ASN1 inside
def asn1_node_first_child(der, (ixs,ixf,ixl)):
        if ord(der[ixs]) & 0x20 != 0x20:
                raise ValueError('Error: can only open constructed types. '
                                +'Found type: 0x'+der[ixs].encode("hex"))
        return asn1_read_length(der,ixf)

# is true if one ASN1 chunk is inside another chunk.
def asn1_node_is_child_of((ixs,ixf,ixl), (jxs,jxf,jxl)):
        return ( (ixf <= jxs ) and (jxl <= ixl) ) or \
           ( (jxf <= ixs ) and (ixl <= jxl) )

##### END NAVIGATE



##### ACCESS PRIMITIVES

# get content and verify type byte
def asn1_get_value_of_type(der,(ixs,ixf,ixl),asn1_type):
        asn1_type_table = {
        'BOOLEAN':           0x01,        'INTEGER':           0x02,
        'BIT STRING':        0x03,        'OCTET STRING':      0x04,
        'NULL':              0x05,        'OBJECT IDENTIFIER': 0x06,
        'SEQUENCE':          0x70,        'SET':               0x71,
        'PrintableString':   0x13,        'IA5String':         0x16,
        'UTCTime':           0x17,        'ENUMERATED':        0x0A,
        'UTF8String':        0x0C,        'PrintableString':   0x13,
        }
        if asn1_type_table[asn1_type] != ord(der[ixs]):
                raise ValueError('Error: Expected type was: '+
                        hex(asn1_type_table[asn1_type])+
                        ' Found: 0x'+der[ixs].encode('hex'))
        return der[ixf:ixl+1]

# get value
def asn1_get_value(der,(ixs,ixf,ixl)):
        return der[ixf:ixl+1]

# get type+length+value
def asn1_get_all(der,(ixs,ixf,ixl)):
        return der[ixs:ixl+1]

##### END ACCESS PRIMITIVES



##### HELPER FUNCTIONS

# converter
def bitstr_to_bytestr(bitstr):
        if bitstr[0] != '\x00':
                raise ValueError('Error: only 00 padded bitstr can be converted to bytestr!')
        return bitstr[1:]

# converter
def bytestr_to_int(s):
        # converts bytestring to integer
        i = 0
        for char in s:
                i <<= 8
                i |= ord(char)
        return i

# ix points to the first byte of the asn1 structure
# Returns first byte pointer, first content byte pointer and last.
def asn1_read_length(der,ix):
        first= ord(der[ix+1])
        if  (ord(der[ix+1]) & 0x80) == 0:
                length = first
                ix_first_content_byte = ix+2
                ix_last_content_byte = ix_first_content_byte + length -1
        else:
                lengthbytes = first & 0x7F
                length = bytestr_to_int(der[ix+2:ix+2+lengthbytes])
                ix_first_content_byte = ix+2+lengthbytes
                ix_last_content_byte = ix_first_content_byte + length -1
        return Asn1Node(ix,ix_first_content_byte,ix_last_content_byte)

##### END HELPER FUNCTIONS


####################### END ASN1 DECODER ############################
# ASN.1 contents of  private key:
        #
        # RSAPrivateKey ::= SEQUENCE {
        #     version           Version,
        #     modulus           INTEGER,  -- n
        #     publicExponent    INTEGER,  -- e
        #     privateExponent   INTEGER,  -- d
        #     prime1            INTEGER,  -- p
        #     prime2            INTEGER,  -- q
        #     exponent1         INTEGER,  -- d mod (p-1)
        #     exponent2         INTEGER,  -- d mod (q-1)
        #     coefficient       INTEGER,  -- (inverse of q) mod p
        #     otherPrimeInfos   OtherPrimeInfos OPTIONAL
        # }




root = asn1_node_root(privkey_der)
child = asn1_node_first_child(privkey_der,root)
child2 = asn1_node_next(privkey_der,child)
child3 = asn1_node_next(privkey_der,child2)
child4 = asn1_node_next(privkey_der,child3)
child5 = asn1_node_next(privkey_der,child4)
child6 = asn1_node_next(privkey_der,child5)
print root
print child
print child2
print child3
print child4
print child5
print child6
(priv, _) = decoder.decode(privkey_der)
n, e, d, p, q = map(int, priv[1:6])
exp1, exp2, coef = map(int, priv[6:9])

def decrypt(cyphertext):
    message = pow(cyphertext, d, n)
    return message

class PrivKey(object):
    
    __slots__ = ('n', 'e', 'd', 'p', 'q', 'exp1', 'exp2', 'coef')
    def __init__(self, n, e, d, p, q):
        AbstractKey.__init__(self, n, e)
        self.d = d
        self.p = p
        self.q = q

        # Calculate exponents and coefficient.
        self.exp1 = int(d % (p - 1))
        self.exp2 = int(d % (q - 1))
        self.coef = rsa.common.inverse(q, p)    


