# django-docker

```
install docker
https://linuxize.com/post/how-to-install-and-use-docker-on-debian-9/
install docker-compose
https://linuxize.com/post/how-to-install-and-use-docker-compose-on-debian-9/
```

1. create files:
```
docker-compose.yml
Dockerfile
requirements.txt
```

1. Create django project

```
$ docker-compose run web django-admin startproject scallopy .
```

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
3. Run container:
```
$ docker-compose up
```
4. Create app with docker:
- create new terminal
- add user to the docker group:
```
$ sudo groupadd docker
$ sudo gpasswd -a $USER docker
$ newgrp docker
```
- run container
```
$ docker-compose up
```

- use `$ docker ps` to view process and your name, (in this case "django-docker_web_1_35f8c3c4163a")
- start new app execute this name:
```
$ docker exec django-docker_web_1_35f8c3c4163a python manage.py startapp greet
```
- give permission for new app:
```
$ sudo chown -R $USER:$USER .
```

5. Create superuser with docker
```
docker-compose run --rm app python manage.py createsuperuser
```
