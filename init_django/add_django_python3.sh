#!/bin/sh
initial () {
    python3 --version
    pip --version
}

create () {
    #pyenv virtualenv 3.6.5 venv_myproject
    python3 -m venv env
    touch .gitignore
    echo "env/" >> .gitignore
}

activate () {
    source env/bin/activate
}

install () {
    python3 -m pip install Django
    django-admin --version
    pip freeze > requirements.txt
    echo "********* install successfully **********"
}

createApp () {
    django-admin startproject myapp
}

startApp () {
    cd myapp
    python3 manage.py runserver
    echo "********* server is running at port 8000 **********"
}

initial
create
activate
install
createApp
startApp