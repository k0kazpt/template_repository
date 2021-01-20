install-tflint-azure-rules:
	@wget https://github.com/terraform-linters/tflint-ruleset-azurerm/releases/download/v0.6.0/tflint-ruleset-azurerm_linux_amd64.zip ~/
	@unzip ~/tflint-ruleset-azurerm_linux_amd64.zip -d ~/
	@mkdir -p ~/.tflint.d/plugins/
	@mv ~/tflint-ruleset-azurerm ~/.tflint.d/plugins
	@echo 'plugin "azurerm" {' > ~/.tflint.hcl
	@echo '	enabled = true' > ~/.tflint.hcl
	@echo '}' > ~/.tflint.hcl