
SET VERBOSE=
SET DEST=-d C:\Users\skyle\Downloads\pypi
SET FLAGS=--only-binary=:all:
SET LOG=--log C:\Users\skyle\Downloads\pip.log

@ECHO ON
:: CALL :pipdownload pip
:: CALL :pipdownload requests
:: CALL :pipdownload scipy
:: CALL :pipdownload sphinx
:: CALL :pipdownload c-to-epl
:: CALL :pipdownload pytest-sphinx
:: CALL :pipdownload pyreverse
:: CALL :pipdownload argparse
:: CALL :pipdownload macho_parser
:: CALL :pipdownload macho_analysis
:: CALL :pipdownload asn1crypto
:: CALL :pipdownload macholibre
:: CALL :pipdownload backports
:: CALL :pipdownload pyelftools
:: CALL :pipdownload pefile
:: CALL :pipdownload jupyter
:: CALL :pipdownload jupyter-git
CALL :pipdownload jupyter-ctrl
CALL :pipdownload jupyter-remote
CALL :pipdownload sphinxcontrib-jupyter
CALL :pipdownload jupyter_contrib_nbextensions
CALL :pipdownload scipy
CALL :pipdownload scikit-learn
CALL :pipdownload sphinxcontrib-book
CALL :pipdownload sphinxcontrib-pyexec
CALL :pipdownload sphinxcontrib-apidoc
CALL :pipdownload sphinxcontrib-argdoc
CALL :pipdownload sphinxcontrib-autodoc_doxygen
CALL :pipdownload sphinxcontrib-django
CALL :pipdownload sphinxcontrib-docxbuilder
CALL :pipdownload sphinxcontrib-examplecode
CALL :pipdownload sphinxcontrib-excel
CALL :pipdownload sphinxcontrib-exceltable
CALL :pipdownload sphinxcontrib-fancybox
CALL :pipdownload sphinxcontrib-findanything
CALL :pipdownload sphinxcontrib-fulltoc
CALL :pipdownload sphinxcontrib-issuetracker
CALL :pipdownload sphinxcontrib-jsonschema
CALL :pipdownload sphinxcontrib-jsontest
CALL :pipdownload sphinxcontrib-jupyter
CALL :pipdownload ptyprocess
CALL :pipdownload pexpect
CALL :pipdownload paramiko
CALL :pipdownload pylint
CALL :pipdownload pep8
CALL :pipdownload autopep8
CALL :pipdownload spyder.autopep8
CALL :pipdownload pytest-codestyle
CALL :pipdownload pycodestyle
CALL :pipdownload flake8
CALL :pipdownload flake8-bugbear
CALL :pipdownload pytest-pycodestyle
CALL :pipdownload mccabe
CALL :pipdownload pytest-pydocstyle
CALL :pipdownload flake8-docstrings
CALL :pipdownload pydoc-utils
CALL :pipdownload elffile
CALL :pipdownload IPy
CALL :pipdownload doxypy
CALL :pipdownload nose
CALL :pipdownload python-gitlab
CALL :pipdownload xlrd
CALL :pipdownload six
CALL :pipdownload pyasn1-modules
CALL :pipdownload pycrypto
CALL :pipdownload cryptography
CALL :pipdownload grumpy
CALL :pipdownload python-fire
CALL :pipdownload fire
CALL :pipdownload clint
CALL :pipdownload pip-env
CALL :pipdownload httpbin
CALL :pipdownload flask
CALL :pipdownload bottle
CALL :pipdownload ujson
CALL :pipdownload scapy
CALL :pipdownload scrapy
CALL :pipdownload pip2
CALL :pipdownload generate_pip
CALL :pipdownload ipython-pip
CALL :pipdownload jupyter-pip
CALL :pipdownload cmake
CALL :pipdownload cmake-converter
CALL :pipdownload pip2pi
CALL :pipdownload devpi
CALL :pipdownload devpi-builder
CALL :pipdownload devpi-client
CALL :pipdownload devpi-builder
CALL :pipdownload devpi-findlinks
CALL :pipdownload pyramid
CALL :pipdownload pygraph
CALL :pipdownload pyflakes
CALL :pipdownload pyterminal
CALL :pipdownload pyterminalsize
CALL :pipdownload colorama
CALL :pipdownload markdown
CALL :pipdownload markup
CALL :pipdownload pyprocess
CALL :pipdownload spyder
CALL :pipdownload pandas
CALL :pipdownload cython
CALL :pipdownload jedi
CALL :pipdownload pygments
CALL :pipdownload rope
CALL :pipdownload qtconsole
CALL :pipdownload sympy
CALL :pipdownload nose
CALL :pipdownload macholib
CALL :pipdownload numpy
CALL :pipdownload scipy 
CALL :pipdownload matplotlib 
CALL :pipdownload ipython
CALL :pipdownload pycparser

CALL :pipdownload machobot
CALL :pipdownload altgraph
CALL :pipdownload elflib
CALL :pipdownload pwnypack
CALL :pipdownload grequests
CALL :pipdownload elffile
CALL :pipdownload pyvmomi
CALL :pipdownload virtualenv
CALL :pipdownload vmtools
CALL :pipdownload spyder-reports
CALL :pipdownload spyder.autopep8
CALL :pipdownload profiler
CALL :pipdownload line_profiler
CALL :pipdownload memory_profiler
CALL :pipdownload kitten
CALL :pipdownload implant
CALL :pipdownload keepercommander
CALL :pipdownload SQLAlchemy
CALL :pipdownload pipdeptree
CALL :pipdownload itsdangerous
CALL :pipdownload psycopg2
CALL :pipdownload mako
CALL :pipdownload jinja2
CALL :pipdownload flask
CALL :pipdownload slugify
CALL :pipdownload setuptools
CALL :pipdownload twine
CALL :pipdownload pip-utils
CALL :pipdownload pillow
CALL :pipdownload beautifulsoup4
CALL :pipdownload pywin32
CALL :pipdownload useful
CALL :pipdownload psutil
CALL :pipdownload procexp 
CALL :pipdownload pysysmon
CALL :pipdownload olefile
CALL :pipdownload spyder
CALL :pipdownload click
CALL :pipdownload selenium
CALL :pipdownload pyopenssl
CALL :pipdownload ldapdomaindump
CALL :pipdownload ldap3
CALL :pipdownload pyreadline
CALL :pipdownload impacket
CALL :pipdownload nmap
CALL :pipdownload python-nmap
CALL :pipdownload osxrelocator
CALL :pipdownload macpack
CALL :pipdownload py2app
CALL :pipdownload tab-osx
CALL :pipdownload DEPy
CALL :pipdownload stronghold
CALL :pipdownload urwid
CALL :pipdownload pycryptodomex
CALL :pipdownload pipenv
CALL :pipdownload virtualenvwrapper
CALL :pipdownload virtualenv-burrito
CALL :pipdownload autoenv
CALL :pipdownload pycco
CALL :pipdownload epydoc
CALL :pipdownload mkdocs
CALL :pipdownload camelot
CALL :pipdownload clint
CALL :pipdownload click
CALL :pipdownload docopt
CALL :pipdownload plac
CALL :pipdownload cliff
CALL :pipdownload cement
CALL :pipdownload gunicorn
CALL :pipdownload kivy
CALL :pipdownload sqlalchemy
CALL :pipdownload gevent
CALL :pipdownload fabric
CALL :pipdownload salt
CALL :pipdownload puppet
CALL :pipdownload buildout
CALL :pipdownload shinken
CALL :pipdownload tox
CALL :pipdownload untangle
CALL :pipdownload xmltodict
CALL :pipdownload pyinstaller
CALL :pipdownload modulegraph
CALL :pipdownload pyinstaller
CALL :pipdownload compiletools
CALL :pipdownload rstcloth
CALL :pipdownload webtest
CALL :pipdownload webtest-docgen
CALL :pipdownload paver
CALL :pipdownload muck
CALL :pipdownload pride
CALL :pipdownload argcomplete
CALL :pipdownload jumpssh
CALL :pipdownload pexpect-u
CALL :pipdownload unicode
CALL :pipdownload ptysh
CALL :pipdownload capturer
CALL :pipdownload executor
CALL :pipdownload py3to2
CALL :pipdownload astdump
CALL :pipdownload cppheaderparser
CALL :pipdownload pseudomethod
CALL :pipdownload pymoca
CALL :pipdownload shivyc
CALL :pipdownload entree
CALL :pipdownload picka
CALL :pipdownload hyde
CALL :pipdownload peachpy
CALL :pipdownload snakeskin
CALL :pipdownload codetree
CALL :pipdownload readme-md
CALL :pipdownload readme-files
CALL :pipdownload readme-sources
CALL :pipdownload readme-install
CALL :pipdownload readme-links
CALL :pipdownload sphinxcontrib-autoprogram
CALL :pipdownload mdutils
CALL :pipdownload setuptools-lint
CALL :pipdownload setuptools-pep8
CALL :pipdownload setuptools-epydoc
CALL :pipdownload pyresttable
CALL :pipdownload opcodes
CALL :pipdownload sphinx-testing
CALL :pipdownload docutils
CALL :pipdownload pygenstub
CALL :pipdownload darglint
CALL :pipdownload pelican
CALL :pipdownload plone
CALL :pipdownload pylons
CALL :pipdownload sphinx_rtd_theme
CALL :pipdownload paste
CALL :pipdownload oauth
CALL :pipdownload haystack-reverse
CALL :pipdownload WebOb
CALL :pipdownload bintrees
CALL :pipdownload rstr
CALL :pipdownload synopsis
CALL :pipdownload mac_alias
CALL :pipdownload remodep
CALL :pipdownload netaddr
CALL :pipdownload ds_store
CALL :pipdownload python-string-utils
CALL :pipdownload waitress
CALL :pipdownload itertools
CALL :pipdownload datetime-glob
CALL :pipdownload backports.datetime_timestamp
CALL :pipdownload maya
CALL :pipdownload jsontree
CALL :pipdownload ps2
CALL :pipdownload ps_mem
CALL :pipdownload ps_tree
CALL :pipdownload pxpx
CALL :pipdownload uname2
CALL :pipdownload backports.datetime_timestamp
CALL :pipdownload contextlib2
CALL :pipdownload backports.csv
CALL :pipdownload backports.pdb
CALL :pipdownload pdb
CALL :pipdownload backports.functools_partialmethod
CALL :pipdownload importlib
CALL :pipdownload importlib2
CALL :pipdownload pickle5
CALL :pipdownload inspect2
CALL :pipdownload yield-from
CALL :pipdownload simplru
CALL :pipdownload textwrap3
CALL :pipdownload discover
CALL :pipdownload functools32
CALL :pipdownload subprocess32
CALL :pipdownload unicodedata2
CALL :pipdownload stablesort
CALL :pipdownload backports.lzma
CALL :pipdownload yieldfrom
CALL :pipdownload zipfile36 
CALL :pipdownload subprocess32-ext
CALL :pipdownload backports.inspect
CALL :pipdownload enum34
CALL :pipdownload pep3134
CALL :pipdownload pyecore-py2
CALL :pipdownload python2-pythondialog
CALL :pipdownload shellescape
CALL :pipdownload zope



goto :exit

:pipdownload
SETLOCAL
SET _package=%1
pip download %VERBOSE% %DEST% %FLAGS% --python-version=2 --platform=manylinux1_x86_64 %_package%
pip download %VERBOSE% %DEST% %FLAGS% --python-version=27 --platform=manylinux1_x86_64 %_package%
pip download %VERBOSE% %DEST% %FLAGS% --python-version=3 --platform=manylinux1_x86_64 %_package%
:: pip download %VERBOSE% %DEST% %FLAGS% --python-version=33 --platform=manylinux1_x86_64 %_package%
:: pip download %VERBOSE% %DEST% %FLAGS% --python-version=34 --platform=manylinux1_x86_64 %_package%
:: pip download %VERBOSE% %DEST% %FLAGS% --python-version=35 --platform=manylinux1_x86_64 %_package%
:: pip download %VERBOSE% %DEST% %FLAGS% --python-version=36 --platform=manylinux1_x86_64 %_package%
:: pip download %VERBOSE% %DEST% %FLAGS% --python-version=37 --platform=manylinux1_x86_64 %_package%
:: 
pip download %VERBOSE% %DEST% %FLAGS% --python-version=2  --platform=macosx-10_10_x86_64 %_package%
pip download %VERBOSE% %DEST% %FLAGS% --python-version=27 --platform=macosx-10_10_x86_64 %_package%
pip download %VERBOSE% %DEST% %FLAGS% --python-version=3  --platform=macosx-10_10_x86_64 %_package%
:: pip download %VERBOSE% %DEST% %FLAGS% --python-version=33 --platform=macosx-10_10_x86_64 %_package%
pip download %VERBOSE% %DEST% %FLAGS% --python-version=34 --platform=macosx-10_10_x86_64 %_package%
:: pip download %VERBOSE% %DEST% %FLAGS% --python-version=35 --platform=macosx-10_10_x86_64 %_package%
:: pip download %VERBOSE% %DEST% %FLAGS% --python-version=36 --platform=macosx-10_10_x86_64 %_package%
pip download %VERBOSE% %DEST% %FLAGS% --python-version=37 --platform=macosx-10_10_x86_64 %_package%
:: 
:: pip download %VERBOSE% %DEST% %FLAGS% --python-version=2  --platform=win32 %_package%
pip download %VERBOSE% %DEST% %FLAGS% --python-version=27 --platform=win32 %_package%
pip download %VERBOSE% %DEST% %FLAGS% --python-version=3  --platform=win32 %_package%
:: pip download %VERBOSE% %DEST% %FLAGS% --python-version=33 --platform=win32 %_package%
:: pip download %VERBOSE% %DEST% %FLAGS% --python-version=34 --platform=win32 %_package%
:: pip download %VERBOSE% %DEST% %FLAGS% --python-version=35 --platform=win32 %_package%
:: pip download %VERBOSE% %DEST% %FLAGS% --python-version=36 --platform=win32 %_package%
:: pip download %VERBOSE% %DEST% %FLAGS% --python-version=37 --platform=win32 %_package%
:: 
pip download %VERBOSE% %DEST% %FLAGS% --python-version=2  --platform=win_amd64 %_package%
pip download %VERBOSE% %DEST% %FLAGS% --python-version=27 --platform=win_amd64 %_package%
pip download %VERBOSE% %DEST% %FLAGS% --python-version=3  --platform=win_amd64 %_package%
:: pip download %VERBOSE% %DEST% %FLAGS% --python-version=33 --platform=win_amd64 %_package%
:: pip download %VERBOSE% %DEST% %FLAGS% --python-version=34 --platform=win_amd64 %_package%
:: pip download %VERBOSE% %DEST% %FLAGS% --python-version=35 --platform=win_amd64 %_package%
:: pip download %VERBOSE% %DEST% %FLAGS% --python-version=36 --platform=win_amd64 %_package%
:: pip download %VERBOSE% %DEST% %FLAGS% --python-version=37 --platform=win_amd64 %_package%
:: 
pip download %VERBOSE% %DEST% %_package%
pip download %VERBOSE% %DEST% %FLAGS% --no-binary=:all: %_package%
pip download %VERBOSE% %DEST% %FLAGS% --no-binary=:all: %_package%
pip download %VERBOSE% %DEST% %FLAGS% --no-binary=:all: %_package%
pip download %VERBOSE% %DEST% %FLAGS% --no-binary=:all: %_package%
pip download %VERBOSE% %DEST% %FLAGS% --no-binary=:all: %_package%
pip download %VERBOSE% %DEST% %FLAGS% --no-binary=:all: %_package%
pip download %VERBOSE% %DEST% %FLAGS% --no-binary=:all: %_package%

ENDLOCAL & SET _result=0

:exit
EXIT /B 0

pip download -d C:\Users\skyle\Downloads\pypi --only-binary=:all: --platform macosx-10_10_x86_64 requests
pip download -d C:\Users\skyle\Downloads\pypi --only-binary=:all: --platform macosx-10_10_x86_64 libiconv 
pip download -d C:\Users\skyle\Downloads\pypi --only-binary=:all: --platform macosx-10_10_x86_64 xlrd
pip download -d C:\Users\skyle\Downloads\pypi --only-binary=:all: --python-version=3 xlrd
pip download -d C:\Users\skyle\Downloads\pypi pandoc pandocfilters nbconvert
pip download -d C:\Users\skyle\Downloads\pypi pefile       
pip download -d C:\Users\skyle\Downloads\pypi --only-binary=:all: --python-version=3 pip
pip download -d C:\Users\skyle\Downloads\pypi --only-binary=:all: --python-version=2 pip	   
pip download -d C:\Users\skyle\Downloads\pypi --only-binary=:all: --python-version=2 xlrd
pip download -d C:\Users\skyle\Downloads\pypi --only-binary=:all: --platform macosx-10_10_x86_64 --python-version=3 requests
pip download -d C:\Users\skyle\Downloads\pypi --only-binary=:all: --platform macosx-10_10_x86_64 --python-version=2 requests
pip download --log=C:\Users\skyle\Downloads\pip.log -d C:\Users\skyle\Downloads\pypi numpy scipy matplotlib ipython jupyter pandas sympy nose
pip download -d C:\Users\skyle\Downloads\pypi --only-binary=:all: --platform=any --python-version=3 scipy
pip download -v --log=C:\Users\skyle\Downloads\pip.log --only-binary=:all: scipy
pip download --log=C:\Users\skyle\Downloads\pip.log --only-binary=:all: --python-version=33 nose
pip download -v --log=C:\Users\skyle\Downloads\pip.log --only-binary=:all: --python-version=3 requests
pip download -v --log=C:\Users\skyle\Downloads\pip.log --only-binary=:all: --python-version=2 requests
pip download --log=C:\Users\skyle\Downloads\pip.log --only-binary=:all: --python-version=33 coverage
pip download --log=C:\Users\skyle\Downloads\pip.log --only-binary=:all: --python-version=34 coverage
pip download --log=C:\Users\skyle\Downloads\pip.log --only-binary=:all: --python-version=35 coverage
pip download --log=C:\Users\skyle\Downloads\pip.log --only-binary=:all: --python-version=27 coverage
pip download --log=C:\Users\skyle\Downloads\pip.log --only-binary=:all: --python-version=27 --platform=macosx_10_10_x86_64 coverage
pip download --log=C:\Users\skyle\Downloads\pip.log --only-binary=:all: --python-version=27 --platform=macosx_10_12_x86_64 coverage
pip download --log=C:\Users\skyle\Downloads\pip.log --only-binary=:all: --python-version=27 --platform=win_amd64 coverage
pip download --log=C:\Users\skyle\Downloads\pip.log --only-binary=:all: --python-version=27 --platform=win32 coverage
pip download --log=C:\Users\skyle\Downloads\pip.log --only-binary=:all: --platform macosx-10_10_x86_64 --python-version 27 --implementation cp SomePackage
pip download --log=C:\Users\skyle\Downloads\pip.log --only-binary=:all: --python-version=27 --platform=manylinux1_x86_64 coverage

pip download --log=C:\Users\skyle\Downloads\pip.log --only-binary=:all: --python-version=34 --platform=macosx_10_10_x86_64 coverage
pip download --log=C:\Users\skyle\Downloads\pip.log --only-binary=:all: --python-version=34 --platform=macosx_10_12_x86_64 coverage
pip download --log=C:\Users\skyle\Downloads\pip.log --only-binary=:all: --python-version=34 --platform=win_amd64 coverage
pip download --log=C:\Users\skyle\Downloads\pip.log --only-binary=:all: --python-version=34 --platform=win32 coverage
pip download --log=C:\Users\skyle\Downloads\pip.log --only-binary=:all: --platform macosx-10_10_x86_64 --python-version 27 --implementation cp SomePackage
pip download --log=C:\Users\skyle\Downloads\pip.log --only-binary=:all: --python-version=34 --platform=manylinux1_x86_64 coverage


EXIT /B 0


    --only-binary=:all: \
    --platform macosx-10_10_x86_64 \
    --python-version 27 \
    --implementation cp \
    SomePackage
# The wheel filename is {distribution}-{version}(-{build tag})?-{python tag}-{abi tag}-{platform tag}.whl.
# Platforms:
# - win32
# - linux_i386
# - linux_x86_64
# - macosx-10_9_x86_64
# - macosx-10_8_x86_64
# - macosx-10_8_intel
# - any
# - linux_x86_64







cycler 0.9.0
decorator 4.0.4
ipykernel 4.1.0
ipython 4.0.0
ipython-genutils 0.1.0
ipywidgets 4.0.3
Jinja2 2.8
jsonschema 2.5.1
jupyter 1.0.0
jupyter-client 4.1.1
python-2.7.14        
astroid-1.6.1        
bleach-2.1.2         
dask-core-0.16.1     
cffi-1.11.4          
msgpack-python-0.5.1 
pyzmq-16.0.3         
sortedcontainers-1.5 
h5py-2.7.1           
astropy-2.0.3        
curl-7.58.0          
ipaddress-1.0.19     
py-1.5.2             
patsy-0.5.0          
comtypes-1.1.4       
toolz-0.9.0          
wheel-0.30.0         
ipython-5.4.1        
werkzeug-0.14.1      
attrs-17.4.0         
jupyter-1.0.0        
pywin32-222          
filelock-2.0.13      
psutil-5.4.3         
jedi-0.11.1          
ruamel_yaml-0.15.35  
mkl-2018.0.1         
dask-0.16.1          
nltk-3.2.5           
anaconda-5.1.0       
yaml-0.1.7           
babel-2.5.3          
cytoolz-0.9.0        
olefile-0.45.1       
scikit-image-0.13.1  
jupyterlab_launcher- 
pillow-5.0.0         
pycurl-7.43.0.1      
numba-0.36.2         
distributed-1.20.2   
jpeg-9b              
pyopenssl-17.5.0     
matplotlib-2.1.2     
html5lib-1.0.1       
freetype-2.8         
libcurl-7.58.0       
libxslt-1.1.32       
libtiff-4.0.9        
numexpr-2.6.4        
pep8-1.7.1           
send2trash-1.4.2     
llvmlite-0.21.0      
libxml2-2.9.7        
sphinx-1.6.6         
pytest-3.3.2         
openpyxl-2.4.10      
mpmath-1.0.0         
glob2-0.6            
widgetsnbextension-3 
pandas-0.22.0        
asn1crypto-0.24.0    
anaconda-client-1.6. 
icu-58.2             
pluggy-0.6.0         
backports.shutil_whi 
cloudpickle-0.5.2    
ipykernel-4.8.0      
seaborn-0.8.1        
xlwings-0.11.5       
sqlite-3.22.0        
hdf5-1.10.1          
zlib-1.2.11          
numpy-1.14.0         
bitarray-0.8.1       
networkx-2.1         
pylint-1.8.2         
tornado-4.5.3        
pywinpty-0.5         
futures-3.2.0        
pip-9.0.1            
cython-0.27.3        
notebook-5.4.0       
rope-0.10.7          
pyodbc-4.0.22        
simplegeneric-0.8.1  
terminado-0.8.1      
intel-openmp-2018.0. 
bokeh-0.12.13        
jupyterlab-0.31.4    
path.py-10.5         
certifi-2018.1.18    
lxml-4.1.1           
tk-8.6.7             
jupyter_client-5.2.2 
decorator-4.2.1      
jupyter_core-4.4.0   
heapdict-1.0.0       
setuptools-38.4.0    
menuinst-1.4.11      
libssh2-1.8.0        
lzo-2.10             
winpty-0.4.3         
bzip2-1.0.6          
pytz-2017.3          
pycrypto-2.6.1       
anaconda-project-0.8 
sqlalchemy-1.2.1     
scipy-1.0.0          
cdecimal-2.3         
fastcache-1.0.2      
parso-0.1.1          
mistune-0.8.3        
cryptography-2.1.4   
grin-1.2.1           
vs2015_runtime-14.0. 
ipywidgets-7.1.1     
libpng-1.6.34        
jinja2
