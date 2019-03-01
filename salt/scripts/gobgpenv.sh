export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$(go env GOPATH)/bin
export GOPATH=$(go env GOPATH)

go get github.com/aristanetworks/goarista/cmd/gnmi

go get github.com/osrg/gobgp/gobgpd
go get github.com/osrg/gobgp/gobgp

