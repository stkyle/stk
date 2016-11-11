# -*- coding: utf-8 -*-
"""Utilities for working with your environment in python"""
import sys as _sys
import os as _os
import shutil as _shutil
import inspect as _inspect
import platform as _platform

WINDOWS = _platform.system().lower() == 'windows'
LINUX = _platform.system().lower() == 'linux'
PY2 = _sys.version_info.major == 2
PY3 = _sys.version_info.major == 3


def import_by_name(name, path=None):
    """Import name given full dotted module path."""
    if path:
        _sys.path = path + _sys.path
    if '.' not in name:
        return __import__(name)
    modpath, trailer = name.rsplit('.', 1)
    try:
        mod = __import__(modpath, fromlist=[trailer])
        item = getattr(mod, trailer)
    except ImportError as exc:
        raise exc
    except AttributeError as exc:
        message = '"{}" has no attribute "{}"'.format(modpath, trailer)
        raise AttributeError(message)
    return item


def find_subclasses(module, base):
    """Find Subclasses of `base` in `module`."""
    module_classlist = filter(_inspect.isclass, module.__dict__.values())
    subclasslist = filter(lambda x: issubclass(x, base), module_classlist)
    return subclasslist
