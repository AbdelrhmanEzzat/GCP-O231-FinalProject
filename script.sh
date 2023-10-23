
#!/bin/bash

# Install Google Cloud SDK and Kubernetes CLI
# Add necessary repositories and update package list

# Update package repositories
if ! sudo apt-get update -y; then
    echo "Failed to update package repositories. Exiting."
    exit 1
fi

# Install Google Cloud SDK
sudo apt-get install apt-transport-https ca-certificates gnupg -y
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
sudo apt-get update -y && sudo apt-get install google-cloud-sdk -y

# Install Kubernetes CLI
sudo apt-get install kubectl -y

# Install additional components if needed
sudo apt-get install google-cloud-sdk-gke-gcloud-auth-plugin -y

# Run gcloud initialization (requires user interaction)
gcloud init

# Note: Consider adding more specific instructions or handling for gcloud init based on your requirements.
