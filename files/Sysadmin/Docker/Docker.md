# Docker

## Commands

### General

```
docker exec -it <mycontainer> bash
```

### Environments

#### Run MySQL environment

```
docker run --name mysql -e MYSQL_ROOT_PASSWORD=t00r -p 3306:3306 -d mysql:latest
```

#### Run Magento1 environment

```
docker run --name mysql -e MYSQL_ROOT_PASSWORD=t00r -e MYSQL_DATABASE=magento1 -e MYSQL_USER=magento1 -e MYSQL_PASSWORD=magento1 -d mysql:latest
docker run --name magento1 --link mysql:mysql -p 80:80 -d jeremycurny/magento1:latest
```

#### Run Magento2 environment

```
docker run --name mysql -e MYSQL_ROOT_PASSWORD=t00r -e MYSQL_DATABASE=magento2 -e MYSQL_USER=magento2 -e MYSQL_PASSWORD=magento2 -d mysql:latest
docker run --name magento2 --link mysql:mysql -p 80:80 -d jeremycurny/magento2:latest
```
