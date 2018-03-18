# FROM revolutionsystems/python:3.6.3-wee-optimized-lto as python-base
FROM revolutionsystems/python:3.6.3-wee-optimized-lto
ENV PYTHONUNBUFFERED 1
RUN apt-get update && apt-get install -y git build-essential


COPY requirements /requirements

RUN pip install -r /requirements/production.txt
COPY . /{{project_name}}

RUN find . | grep -E "(__pycache__|\.pyc|\.pyo$)" | xargs rm -rf

EXPOSE 5000

WORKDIR /{{project_name}}
ENV DJANGO_SETTINGS_MODULE {{project_name}}.settings.production

CMD gunicorn --workers=4 --worker-class="egg:meinheld#gunicorn_worker" -b 0.0.0.0:5000 {{project_name}}.wsgi:application --access-logfile -