# pull official base image
FROM python:3.7-slim

# set work directory and copy project fiels
WORKDIR /user/src/app
COPY ./app .

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# setup pipenv and install dependency package
COPY Pipfile Pipfile.lock /user/src/
RUN pip install --upgrade pip && pip install pipenv && pipenv install --system

# create default command
CMD [ "gunicorn", "-b 0.0.0.0:8000", "-w 3", "config.wsgi:application"]