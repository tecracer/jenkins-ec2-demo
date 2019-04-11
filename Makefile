.DEFAULT_GOAL := help

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
##
# Configure here
region = eu-central-1
template = jenkins-security
#
# Get Account number with `aws sts get-caller-identity`
###

get-standard-vpc: ## Write Standard vpc into paramater
	scripts/get-vpc-ids.sh

security: get-standard-vpc ## Deploy role and security groups
	clouds -r $(region) update --events -c $(template)

cleanup: ## Remoce cloudformation template
	clouds delete --events -f $(template)