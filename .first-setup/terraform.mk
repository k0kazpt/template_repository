install-terraform-requisites: install-tflint install-terraform-docs

install-terraform:
	@sudo apt-get install -y terraform

install-tflint:
	@curl -L "$$(curl -Ls https://api.github.com/repos/terraform-linters/tflint/releases/latest | grep -o -E "https://.+?_linux_amd64.zip")" -o tflint.zip && unzip tflint.zip && rm tflint.zip

install-terraform-docs:
	@GO111MODULE="on" go get github.com/terraform-docs/terraform-docs@v0.10.1

# If Azure cloud is to be used
-include terraform-azure.mk