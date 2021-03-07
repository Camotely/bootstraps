#!/bin/bash

# Slack's old GPG key they still have so they don't break installs
cat > /tmp/slack1.gpg << EOF
-----BEGIN PGP PUBLIC KEY BLOCK-----
Version: GnuPG v1.4.11 (GNU/Linux)

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
sA==
=H60S
-----END PGP PUBLIC KEY BLOCK-----
EOF

# Slack's new signing key
cat > /tmp/slack2.gpg << EOF
-----BEGIN PGP PUBLIC KEY BLOCK-----
Version: GnuPG v1.4.11 (GNU/Linux)

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
lIs=
=ZPAR
-----END PGP PUBLIC KEY BLOCK-----
EOF

# Import the GPG Keys
rpm --import /tmp/slack1.gpg
rpm --import /tmp/slack2.gpg

# Creating the repository
cat > /etc/yum.repos.d/slack.repo << EOF
[slack]
name=slack
baseurl=https://packagecloud.io/slacktechnologies/slack/fedora/21/x86_64
enabled=1
gpgcheck=0
gpgkey=https://packagecloud.io/gpg.key
sslverify=1
sslcacert=/etc/pki/tls/certs/ca-bundle.crt
EOF

# Update and install
dnf update
dnf install slack -y

# Remove keys
rm -f /tmp/slack*.gpg