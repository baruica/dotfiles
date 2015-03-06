#!/usr/bin/env bash

# http://scotch.io/tutorials/how-to-setup-ssh-public-key-authentication

ssh-keygen -t rsa -C "ndacosta@eleven-labs.com"
ssh -i ~/.ssh/github.key username@host.com

# setup the server to receive public keys
cd ~/.ssh
touch authorized_keys

chmod 700 ~/.ssh
chmod 600 ~/.ssh/authorized_keys
# The remote server is now ready to have Public Keys put on it.

# Copying Public Keys to a Remote Server
cat ~/.ssh/id_rsa.pub |ssh user@host 'cat >> .ssh/authorized_keys'

ssh-copy-id preprod.fr.crm.etsglobal.org
