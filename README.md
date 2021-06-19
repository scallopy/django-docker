# django-docker

1. create files:
docker-compose.yml
Dockerfile
requirements.txt

1. Create django project

$ docker-compose run web django-admin startproject scallopy .

Change permissions from:

```
caly@debian:~/djdo/django-docker$ sudo ls -l
total 24
-rw-r--r-- 1 scaly docker  186 Jun 19 16:22 docker-compose.yml
-rw-r--r-- 1 scaly docker  144 Jun 19 16:39 Dockerfile
-rwxr-xr-x 1 root  root    628 Jun 19 16:45 manage.py
-rw-r--r-- 1 scaly docker  172 Jun 19 16:41 README.md
-rw-r--r-- 1 scaly docker   12 Jun 19 16:16 requirements.txt
drwxr-xr-x 2 root  root   4096 Jun 19 16:45 scallopy

```
to:

```
caly@debian:~/djdo/django-docker$ sudo chown -R $USER:$USER .
scaly@debian:~/djdo/django-docker$ ls -l
total 24
-rw-r--r-- 1 scaly scaly  186 Jun 19 16:22 docker-compose.yml
-rw-r--r-- 1 scaly scaly  144 Jun 19 16:39 Dockerfile
-rwxr-xr-x 1 scaly scaly  628 Jun 19 16:45 manage.py
-rw-r--r-- 1 scaly scaly  172 Jun 19 16:41 README.md
-rw-r--r-- 1 scaly scaly   12 Jun 19 16:16 requirements.txt
drwxr-xr-x 2 scaly scaly 4096 Jun 19 16:45 scallopy
```
3. Run server:
```
$ docker-compose up
```
