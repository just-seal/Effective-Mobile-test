
INVENTORY = ./ansible/inventory/hosts
PLAYBOOKS = ./ansible/playbooks/monitoring-playbook.yaml
#REMOTEUSER = $REMOTE_USER


.PHONY: up
up:
	@echo "Deploying monitoring scripts and services..."
	ansible-playbook -i $(INVENTORY) ./ansible/playbooks/monitoring-playbook.yaml # --extra-vars

