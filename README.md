sudo trivy image --vuln-type os --ignore-unfixed nginx:1.21.6
docker buildx create --name copademo
trivy image --vuln-type os --ignore-unfixed -f json -o nginx.1.21.6.json nginx:1.21.6
copa patch -i docker.io/library/nginx:1.21.6 -r nginx.1.21.6.json -t 1.21.6-patched -a buildx://copademo
docker images | grep 1.21.6-patched

sudo trivy image --vuln-type os --ignore-unfixed nginx:1.21.6-patched 
docker history nginx:1.21.6-patched

# distroless
## We want to patch opa:0.46.0, which is a distroless image
cat Dockerfile.patch

docker buildx build -t opa:0.46.0-patched . -f Dockerfile.patch
sudo trivy image --ignore-unfixed -f json -o opa.0.46.0.json openpolicyagent/opa:0.46.0

copa patch -i docker.io/openpolicyagent/opa:0.46.0 -r opa.0.46.0.json -t 0.46.0-patched -a buildx://copademo

