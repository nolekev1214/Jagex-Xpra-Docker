# Change this to suit your needs.
TAG:=jamflex

all: build

build:
	docker build -t="$(TAG)" .

run:
	docker run -d -p 80:10000 --privileged $(TAG)