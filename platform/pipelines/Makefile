
install:
	@kubectl apply --filename https://storage.googleapis.com/tekton-releases/pipeline/latest/release.notags.yaml

cli:
	sudo apt install -y gnupg
	sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 3EFE0E0A2F2F60AA
	echo "deb http://ppa.launchpad.net/tektoncd/cli/ubuntu focal main" | sudo tee /etc/apt/sources.list.d/tektoncd-ubuntu-cli.list
	sudo apt update
	sudo apt install -y tektoncd-cli
	ln -s /usr/bin/tkn /usr/local/bin/kubectl-tkn
	
uninstall:
	@kubectl delete --filename https://storage.googleapis.com/tekton-releases/pipeline/latest/release.notags.yaml



