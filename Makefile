OPERATOR_IMAGE:=docker-registry.default.svc:5000/artifactory-operator/artifactory-operator:latest
PULL_POLICY:=Always

.PHONY: deploy
deploy:
	@kubectl apply -f deploy/service_account.yaml
	@kubectl apply -f deploy/role.yaml
	@kubectl apply -f deploy/role_binding.yaml
	@cat deploy/operator.yaml | sed 's|<<<OPERATOR_IMAGE>>>|${OPERATOR_IMAGE}|g; s|<<<PULL_POLICY>>>|${PULL_POLICY}|g;' | kubectl apply -f-
