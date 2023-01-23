# autosd-build-pipeline
Tekton Pipeline to build AutoSD image

## Deploy the Pipeline

### Using the Makefile
```
make deploy
```

### Step-by-step deployment
- Deploy the Service Account and RBAC roles
    ```bash
    oc apply -f rbac/autosd-builder.yml
    ```

- Deploy the ansible-runner task
    ```bash
    oc apply -f https://api.hub.tekton.dev/v1/resource/tekton/task/ansible-runner/0.2/raw
    ```

- Deploy the required tasks
    ```bash
    oc apply -f tasks/extravars-task.yml
    ```

- Deploy the pipeline
    ```bash
    oc apply -f pipeline/pipeline.yml
    ```

## Run the pipeline using the example
```bash
oc apply -f example/pipelinerun.yml
```