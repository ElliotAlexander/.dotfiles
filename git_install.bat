


SET GPG_PUBLIC=094C0C8C5CBF06AE13758AA5628A8CBDEB12F285


git config credential.helper store
git config --global user.email "ep1e16@soton.ac.uk"
git config --global user.name "ElliotAlexander"
git config --global core.editor "vim"
git config --global credential.helper 'cache --timeout=3600'

gpg --list-keys %GPG_PUBLIC%
IF %errorlevel%==0 (
    echo Signing commits using %GPG_PUBLIC%
	git config --global user.signingkey %GPG_PUBLIC%
	git config --global commit.gpgsign true
) ELSE (
	echo GPG Key $GPG_PUBLIC not found.
)