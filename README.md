delete: https://github.com/AGWA/git-crypt/issues/47#issuecomment-492939759

FWIW, I found a procedure to rotate the symmetric key that doesn't need poking at hidden git-crypt dependent files:

Delete .gitattributes files. This will unencrypt your secrets.
Stash the changes (to store the unencrypted secrets locally)
Delete .gitattributes and all your secrets files.
Commit. (operation 2+3 are so as you don't have to commit any plaintext secrets)
do 'git-crypt lock' which in this instance just throws away your key
do 'git-crypt init' to create a new key.
Unstash the stashed files and recreate .gitattributes
commit
Note that collaborators need to do 'git-crypt lock' before pulling the new changes in order to throw away the old key and work with just text files in plain git mode (although the secrets are encrypted still).
After updating, just git-crypt unlock with the new key.