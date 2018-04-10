#!/bin/sh

set -e

echo "Creating/fixing home"
sudo mkdir -p ${HOME}
sudo -E chown -R $(whoami):$(whoami) ${HOME}
sudo -E chmod -R a+rxw ${HOME}

cd /travis

sudo -H pip3 install -r requirements.txt | cat
sudo -H pip3 install -r test-requirements.txt | cat
sudo -H pip3 install setuptools | cat

echo
echo
echo "****************************************************************"
echo "****************************************************************"
python3 --version
cmake --version
pip --version
pip3 --version
echo "****************************************************************"
echo "****************************************************************"
echo
echo

if [ -n "${STYLECHECK:+1}" ]; then
    echo "****************************************************************"
    echo "****************************************************************"
    echo "                          STYLE CHECK"
    echo "****************************************************************"
    echo "****************************************************************"
    sudo pip install pycodestyle==2.3.1 | cat
    sudo pip install -U flake8 | cat
    flake8
    pycodestyle
fi

if [ -n "${TEST:+1}" ]; then
    echo "****************************************************************"
    echo "****************************************************************"
    echo "                            TEST"
    echo "****************************************************************"
    echo "****************************************************************"
    python3 setup.py test
fi

if [ -n "${DEPLOY:+1}" ]; then
    echo "****************************************************************"
    echo "****************************************************************"
    echo "                           DEPLOY"
    echo "****************************************************************"
    echo "****************************************************************"
    python3 setup.py sdist
fi
