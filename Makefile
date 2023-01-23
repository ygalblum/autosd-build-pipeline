all: deploy

deploy:
	oc apply -f rbac/autosd-builder.yml
	oc apply -f https://api.hub.tekton.dev/v1/resource/tekton/task/ansible-runner/0.2/raw
	oc apply -f tasks/
	oc apply -f pipeline/pipeline.yml