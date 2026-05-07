# webmethods-vibecoding-demos
Repo to host the various packages generated with Bob vibecoding

## Relevant Documents

All this docs were created by [IBM BoB](https://bob.ibm.com)!!!

+ [Calculator Service with Kafka Event Publishing - Integration Summary](./docs/INTEGRATION_SUMMARY.md)
+ [Code Quality Assessment: Calculator with Kafka Event Publishing Integration](./docs/CODE_QUALITY_ASSESSMENT.md)

Services:

+ [CalculateEnhanced Service](./docs/calculator/CalculateEnhanced.md)
+ [API README](./docs/calculator/API-README.md)
+ [API SUMMARY](./docs/calculator/API-SUMMARY.md)

+ [SendEvent Service Documentation](./docs/eventing/SendEvent.md)

## deployment to docker

### Prerequisites - webMethods Docker Registry

+ Get Access to the [webMethods Container Registry](https://containers.webmethods.io/login) (IBM ID Required)
+ Create a new registry access key (Account > Settings > Create access token)
+ use the user + key to login to the registry using `docker login` command
+ pull down the latest `Microservice Runtime image` (ie. ibmwebmethods.azurecr.io/webmethods-microservicesruntime:11.1.0.11)

### Prerequisites - webMethods Package Registry

The build also installs some webMethods package adapters in the containers (JDBC Adapter, Kafka Adapter, MQ Adapter)

+ Get Access to the [webMethods Package Registry](https://packages.webmethods.io/) (IBM ID Required)
+ click "login" and use your IBM ID
+ Create a new access tokens (account > settings > generate password)
+ Save the token into a file at ${HOME}/wpm_token_key.txt so the container build can use it

### Build the container

Run build-manual.sh script

```sh
docker login containers.webmethods.io
docker pull ibmwebmethods.azurecr.io/webmethods-microservicesruntime:11.1.0.11
sh ./build-manual.sh
```

### install

Navigate to ./deployments/docker

```sh
cd ./deployments/docker
docker compose up -d
```

Logs:

```sh
docker logs -f docker-msr-1
```

Integration Server Administrative URL: http://localhost:5555/

Testing the API - As explained in the docs at [Calculator Service with Kafka Event Publishing - Integration Summary](./docs/INTEGRATION_SUMMARY.md)

### delete

```sh
docker compose down 
```

## deployment to local kubernetes

Using helm chart at: https://github.com/IBM/webmethods-helm-charts

```sh
helm repo add webmethods https://github.com/IBM/webmethods-helm-charts
helm repo update webmethods
```

### install

```sh
kubectl create namespace msrdemos

helm upgrade -i --namespace msrdemos \
    -f ./deployments/kubernetes/helm-deployment.yml \
    webmethods-ai-coding-demos webmethods/microservicesruntime
```

URL: http://msr-ai-coding.localhost/

### delete

```sh
helm delete --namespace msrdemos webmethods-ai-coding-demos

kubectl delete namespace msrdemos
```
