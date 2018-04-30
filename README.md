```
$ docker volume create tlmgit_data
$ docker run -t -v tlmgit_data:/opt/data/ -p 9418:9418 -p 80:80 quay.io/spivegin/tlmgit
```
