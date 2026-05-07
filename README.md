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

URL: http://localhost:5555/

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
