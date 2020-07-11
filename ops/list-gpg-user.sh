#/bin/bash

ls -1 .git-crypt/keys/ | while read key; do
	echo -e "\n\nGit-crypt key: ${key}\nUsers:"
	find .git-crypt/keys/${key} -name \*gpg | while read gpgfile; do
		gpg --list-keys $(basename ${gpgfile} .gpg)
	done
done
