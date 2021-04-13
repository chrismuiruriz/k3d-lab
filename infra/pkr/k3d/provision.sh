#!/bin/bash

# Upgrade and install basics
sudo apt update -y && sudo apt upgrade -y && sudo apt install -y curl vim jq git make docker.io unzip bash-completion
sudo usermod -aG docker ubuntu

# Install oh-my-bash and remove snap
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"
bash -c "$(curl -fsSL https://raw.githubusercontent.com/BryanDollery/remove-snap/main/remove-snap.sh)"

# Install K3D
curl -s https://raw.githubusercontent.com/rancher/k3d/main/install.sh | bash

# and kubectl
curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl

echo 'source <(kubectl completion bash)' >>~/.bashrc
echo 'alias k=kubectl' >>~/.bashrc
echo 'complete -F __start_kubectl k' >>~/.bashrc

# Install Krew
(
  set -x; cd "$(mktemp -d)" &&
  OS="$(uname | tr '[:upper:]' '[:lower:]')" &&
  ARCH="$(uname -m | sed -e 's/x86_64/amd64/' -e 's/\(arm\)\(64\)\?.*/\1\2/' -e 's/aarch64$/arm64/')" &&
  curl -fsSLO "https://github.com/kubernetes-sigs/krew/releases/latest/download/krew.tar.gz" &&
  tar zxvf krew.tar.gz &&
  KREW=./krew-"${OS}_${ARCH}" &&
  "$KREW" install krew
)

echo 'export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"' >> .bashrc

# Use krew to install kubectl plugins
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
kubectl krew update
kubectl krew install get-all change-ns ingress-nginx janitor doctor ns pod-dive pod-inspect pod-lens pod-logs pod-shell podevents service-tree sick-pods view-secret

# Add some more aliases
echo 'alias less="less -R"' >> ~/.bashrc
echo 'alias jq="jq -C"' >> ~/.bashrc
echo 'export VISUAL=vim' >> ~/.bashrc
echo 'export EDITOR="$VISUAL"' >> ~/.bashrc

# tidy up
rm -f ~/provision.sh

# And, finally, clone our repo
mkdir -p ~/git
cd ~/git
git clone https://github.com/BryanDollery/k3d-lab


