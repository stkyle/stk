
def flatten_dict(ddict):
    def get_keys(ddict, prefix=''):
        keys, vals = [], []
    
        for k,v in ddict.items():
            if isinstance(v, list) and not isinstance(v, str):
                v=dict((str(i), q) for i,q in enumerate(v))
            if isinstance(v, dict):
                prefix = prefix+'.' if prefix else ''
                kk, vv = get_keys(v,prefix+k)
                keys.extend(kk)
                vals.extend(vv)
            else:
                vals.append(v)
                if prefix:
                    keys.append(prefix+'.'+k)
                else:
                    keys.append(k)
        return keys, vals

    k,v = get_keys(ddict)
    d = dict(zip(k,v))
    return d
