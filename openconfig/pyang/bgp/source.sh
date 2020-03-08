#!/bin/bash

pip install pyang pyangbind

SDIR="$(cd -P "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

mkdir -p $SDIR/yang

git clone https://github.com/openconfig/public $SDIR/yang/


PYBINDPLUGIN=`/usr/bin/env python -c 'import pyangbind; import os; print ("{}/plugin".format(os.path.dirname(pyangbind.__file__)))'`
pyang --plugindir $PYBINDPLUGIN -f pybind -p $SDIR/yang/ -o $SDIR/binding.py $SDIR/yang/release/models/bgp/openconfig-bgp.yang --ignore-errors

#pyang --plugindir $PYBINDPLUGIN -f pybind -p yang/ -o binding.py yang/release/models/bgp/openconfig-bgp.yang

echo "Bindings successfully generated!"