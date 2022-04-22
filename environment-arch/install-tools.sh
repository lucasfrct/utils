#!/bin/bash +x

## TERRAFORM
asdf plugin add terraform
asdf plugin add iam-policy-json-to-terraform
asdf plugin add terraform-docs
asdf install terraform latest
asdf install iam-policy-json-to-terraform latest
asdf install terraform-docs latest
asdf global terraform latest
asdf global iam-policy-json-to-terraform latest
asdf global terraform-docs latest

## AWS
asdf plugin add awscli
asdf plugin add aws-copilot
asdf plugin add aws-iam-authenticator
asdf plugin add saml2aws
asdf install awscli latest
asdf install aws-copilot latest
asdf install aws-iam-authenticator latest
asdf install saml2aws latest
asdf global awscli latest
asdf global aws-copilot latest
asdf global aws-iam-authenticator latest
asdf global saml2aws latest