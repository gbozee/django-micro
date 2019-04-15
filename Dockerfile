# FROM revolutionsystems/python:3.6.3-wee-optimized-lto as python-base
FROM python:3.6.4
ENV PYTHONUNBUFFERED 1
# RUN apt-get update && apt-get install -y git build-essential
RUN pip install -U pip

COPY requirements /requirements

RUN pip install -r /requirements/production.txt
RUN pip install -e git+https://gitlab+deploy-token-60342:Xs78xdAhrkn3pCucL2uP@gitlab.com/careerlyft-team/careerlyft-shared.git#egg=cv_utils

COPY . /{{project_name}}

RUN find . | grep -E "(__pycache__|\.pyc|\.pyo$)" | xargs rm -rf

EXPOSE 5000

WORKDIR /{{project_name}}
ENV DJANGO_SETTINGS_MODULE {{project_name}}.settings.production

CMD gunicorn -k uvicorn.workers.UvicornWorker -b 0.0.0.0:5000 run:app --access-logfile -