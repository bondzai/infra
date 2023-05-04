#!/bin/sh
initial () {
    python -m venv env
    source env/bin/activate
}

install () {
    pip install -r requirements.txt
}

gitignore () {
    touch .gitignore
    echo "env/" >> .gitignore
}

if [ -e env/ ]
    then
        echo "===== venv already exist ====="
    else
        echo "===== start create venv ====="
        initial
fi

if [ -e requirements.txt ]
    then
        echo "===== start install requirements  ====="
        install
    else
        echo "===== please manual install requirements (pip) ====="
fi

if [ -e .gitignore ]
    then
        echo "===== .gitignore already exist ====="
    else
        echo "===== start create .gitignore ====="
        gitignore
fi