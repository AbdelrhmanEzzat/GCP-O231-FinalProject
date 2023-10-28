
# #!/bin/bash

# # Install Google Cloud SDK and Kubernetes CLI
# # Add necessary repositories and update package list

# # Update package repositories
# if ! sudo apt-get update -y; then
#     echo "Failed to update package repositories. Exiting."
#     exit 1
# fi

# # Install Google Cloud SDK
# sudo apt-get install apt-transport-https ca-certificates gnupg -y
# echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
# curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
# sudo apt-get update -y && sudo apt-get install google-cloud-sdk -y

# # Install Kubernetes CLI
# sudo apt-get install kubectl -y

# # Install additional components if needed
# sudo apt-get install google-cloud-sdk-gke-gcloud-auth-plugin -y

# # Run gcloud initialization (requires user interaction)
# gcloud init

# # Note: Consider adding more specific instructions or handling for gcloud init based on your requirements.

# # sudo apt update
# # sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
# # curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg 
# # echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
# # sudo apt update
# # sudo apt install docker-ce docker-ce-cli containerd.io -y
# # sudo systemctl start docker
# # sudo systemctl enable docker
# # sudo docker --version
#!/bin/bash

# Update package repositories
if ! sudo apt-get update -y; then
    echo "Failed to update package repositories. Exiting."
    exit 1
fi

# Install necessary packages
sudo apt-get install apt-transport-https ca-certificates gnupg curl software-properties-common -y

# Install Google Cloud SDK
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
sudo apt-get update -y && sudo apt-get install google-cloud-sdk -y

# Install Kubernetes CLI
sudo apt-get install kubectl -y

# Install Docker
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update -y && sudo apt-get install docker-ce docker-ce-cli containerd.io -y
sudo systemctl start docker
sudo systemctl enable docker

# Install additional components if needed
sudo apt-get install google-cloud-sdk-gke-gcloud-auth-plugin -y

# Run gcloud initialization non-interactively
echo "y" | gcloud init

# Check installations
kubectl version --client
docker --version
gcloud --version

# docker build -t asia-east1-docker.pkg.dev/first-project-gcp-course/my-repository/mongo:5.0.15 .
# gcloud auth configure-docker asia-east1-docker.pkg.dev
# docker push asia-east1-docker.pkg.dev/first-project-gcp-course/my-repository/mongo:5.0.15
# docker tag asia-east1-docker.pkg.dev/first-project-gcp-course/my-repository/mongo:5.0.15 \
# asia-east1-docker.pkg.dev/first-project-gcp-course/my-repository/mongo:v1

#docker build -t asia-east1-docker.pkg.dev/first-project-gcp-course/my-repository/node-app .
# gcloud auth configure-docker asia-east1-docker.pkg.dev
# docker push asia-east1-docker.pkg.dev/first-project-gcp-course/my-repository/node-app
