echo Adding Golang variables...
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$(go env GOPATH)/bin
export GOPATH=$(go env GOPATH)
echo Finished....

echo Adding Ansible variables..
export ANSIBLEPATH=/vagrant/scripts/ansible/
echo Finished.. 

echo Adding Arista openconfigbeat...
go get github.com/aristanetworks/openconfigbeat
echo Finished
echo Adding Openconfig gnmi client..
go get github.com/aristanetworks/goarista/cmd/gnmi
go get github.com/aristanetworks/goarista/cmd/ockafka 
echo Finished
echo Adding pyangbind env
export PYBINDPLUGIN=`/usr/bin/env python -c \
	'import pyangbind; import os; print "%s/plugin" % os.path.dirname(pyangbind.__file__)'`
