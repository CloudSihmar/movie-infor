echo "Start"
IMAGE_NAME="tsrana1/s2-movie-info-service:${BUILD_NUMBER}"
echo "Creating Image..."
docker build -t $IMAGE_NAME .
docker login -u tsrana1 -p${DOCKER_HUB}
docker push $IMAGE_NAME
echo "Deploying Image to Kubernetes..."
export KUBECONFIG=/home/ubuntu/kubeconfig/kubeConfig/kube-config-mil01-rana-cluster.yml
kubectl set image deployment.v1beta1.extensions/s2-movie-info-service-deployment s2-movie-info-service=$IMAGE_NAME
echo "End"
