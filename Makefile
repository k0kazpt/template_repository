# TODO: implement package manager detection
PKGMANINST := apt-get install -y
PKGMANUPD := apt-get update
COREPKGSTOINSTALL := python python3 golang unzip rename

# Full setup
repository: install-core-requisites repo-init

# Menu
menu:
	.first-setup/menu.sh

# CORE Dependencies
install-core-requisites: install-base-dependencies install-pre-commit install-commitizen install-git-chlog

install-base-packages:
	@sudo $(PKGMANUPD)
	@sudo $(PKGMANINST) $(COREPKGSTOINSTALL)

install-pre-commit:
	@pip install pre-commit

install-commitizen:
	@pip install -U Commitizen

install-git-chlog:
	@go get -u github.com/git-chglog/git-chglog/cmd/git-chglog

# Terraform Dependencies
-include .first-setup/terraform.mk


repo-init:
	@pre-commit install
	@pre-commit install --hook-type commit-msg



