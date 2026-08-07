# oauth2tenant
Making the tenant with the CLI

mkdir oauth2tenant && cd oauth2tenant

greymatter create project oauth2tenant --security spire

greymatter create edge edge \
--protocol http \
--security tls \
--gateway-port 10909 \
--display-name "oauth2tenant edge"

greymatter create service service1 \
--protocol http \
--port 8080 \
--security spire \
--edge edge \
--display-name "oauth2tenant nginx"

greymatter evaluate project --install-script > install-tenant
chmod +x install-tenant


kubectl create secret generic \
--from-file=ca.crt=edge.crt \
--from-file=tls.crt=edge.crt \
--from-file=tls.key=edge.key \
-n oauth2tenant greymatter-edge-ingress \
--dry-run=client -o yaml | kubectl apply -f -

kubectl apply -f nginx.yaml


# replace with edge load balancer domain
https://172.18.0.4:10909/services/oauth2tenant/service1/

# Deploying Keycloak

kubectl create namespace keycloak
kubectl apply -f keycloak.yaml


kubectl create secret generic greymatter-oauth2-secret     --from-file=token.yaml=token.yaml     --from-file=hmac.yaml=hmac.yaml     --namespace oauth2tenant
