#!/bin/sh
initial () {
    pyenv versions
    django-admin --version
}

install () {
    pip install -r requirements.txt
    echo "********* install extenend successfully **********"
}

initial
install