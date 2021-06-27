# django-docker
```
Python3
Django==2.28
```
# Git repo
```
github.com:scallopy/django-docker
```
# Create venv to install requirements:

```
virtualenv venv -p python3
source venv/bin/activate

```
# Run django project with docker and postgres

```
$ docker-compose run web //create container

$ docker-compose down -v //remove docker-compose set in existing container(when
we change docker-compose.yml file => run changes:

$ docker-compose build

$ docker-compose run --rm web python3 manage.py migrate //make migrations in
new db

$ docker-compose run --rm web python3 manage.py createsuperuser
```

## Fix Bugs:
### Port 5432
Error starting userland proxy: listen tcp 0.0.0.0:5432: bind: address already in use
```
$ sudo ss -lptn 'sport = :5432'
$ sudo kill <pid>
```
# Create django project with docker
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
$ docker-compose run web django-admin startproject config .
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
drwxr-xr-x 2 root  root   4096 Jun 19 16:45 config

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
drwxr-xr-x 2 scaly scaly 4096 Jun 19 16:45 config
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

5. Create virtualenvironment

```
$ python --version
Python 2.7.13

$ which python3
/usr/bin/python3

$ alias python="/usr/bin/python3"

$ python --version
Python 3.5.3

$ virtualenv venv -p python3

(venv) scaly@debian:~/djdo/django-docker$
```

6. Create database greet-dev
```
$ docker run --name greet-dev -e POSTGRES_USER=scallopy -e POSTGRES_PASSWORD=scallopy -d postgres
```
7. Create superuser with docker
```
docker-compose run --rm app python manage.py createsuperuser
```

# Error starting userland proxy: listen tcp 0.0.0.0:5432: bind: address already in use
```
$ docker-compose up
Error starting userland proxy: listen tcp 0.0.0.0:5432: bind: address already in use
(django-docker) scaly@debian:~/djdo/django-docker$ lsof -i tcp:5432
(django-docker) scaly@debian:~/djdo/django-docker$ netstat -anp tcp | grep 5432
(Not all processes could be identified, non-owned process info
 will not be shown, you would have to be root to see it all.)
 tcp        0      0 127.0.0.1:5432          0.0.0.0:*               LISTEN
 -
 tcp6       0      0 ::1:5432                :::*                    LISTEN
 -
 unix  2      [ ACC ]     STREAM     LISTENING     16843977 -
 /var/run/postgresql/.s.PGSQL.5432
 (django-docker) scaly@debian:~/djdo/django-docker$ sudo ss -lptn 'sport = :5432'
 [sudo] password for scaly:
 Sorry, try again.
 [sudo] password for scaly:
 State      Recv-Q Send-Q Local Address:Port               Peer Address:Port
 LISTEN     0      128    127.0.0.1:5432                     *:*
 users:(("postgres",pid=9731,fd=4))
 LISTEN     0      128        ::1:5432                    :::*
 users:(("postgres",pid=9731,fd=3))
 (django-docker) scaly@debian:~/djdo/django-docker$ kill 9731
 bash: kill: (9731) - Operation not permitted
 (django-docker) scaly@debian:~/djdo/django-docker$ sudo kill 9731
 (django-docker) scaly@debian:~/djdo/django-docker$ docker-compose up
 ```
