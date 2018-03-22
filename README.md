# Django micro setup #


### What is this repository for? ###

This is a sample template to use when scaffolding a django project to be used as a microservice.

It disables a lot of the default settings provided by django by default and provides multiple settings to choose between 


### Configuration
The bare minimum dependency to get the app to production is what is introduced.
to install, run `pip install -r requirements/local.txt`

```
$ mkdir project_location
$ python -m venv venv
$ source venv/Scripts/activate # on linux/mac venv/bin/activate
$ pip install -r requirements/local.txt
$ django-admin startproject --template=https://github.com/gbozee/django-micro/archive/master.zip --name=Dockerfile  <project_name>

```

### Database configuration
The project makes use of environment variables which is a good way to switch configuration at runtime.
The following are the variable supported

**DATABASE_URL**: a url connection string of the database

**DJANGO_SETTINGS_MODULE**: settings module to load the django app in *default is <project_name>.settings.local*

### Running Tests
To run tests, `python manage.py test <project_name>`

### Preparing for deployments
There is a dockerfile created by default to help deploy the app as a docker-container. 
To build the docker container run the following command
`docker build -t=<container_name> .`

