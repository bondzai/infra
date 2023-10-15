#!/bin/sh
initial () {
    pyenv versions
    pyenv global 3.10.4
}

create () {
    pyenv virtualenv 3.10.4 django-basic
    ln -s /usr/bin/python3 /usr/bin/python
}

activate () {
    pyenv activate django-basic
}

install () {
    python get-pip.py
    pip install Django
    django-admin --version
    pip freeze > requirements.txt
    echo "********* install successfully **********"
}

createApp () {
    django-admin startproject myapp
}

startApp () {
    cd myapp
    python manage.py runserver
    echo "********* server is running at port 8000 **********"
}

initial
create
activate
install
createApp
startApp