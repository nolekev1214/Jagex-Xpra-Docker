# Change this to suit your needs.
TAG:=jamflex

all: build

build:
	docker build -t="$(TAG)" .

run:
	docker run -d -p 30000:10000 --privileged $(TAG)
	
deploy:
	kubectl apply -f deployment.yaml