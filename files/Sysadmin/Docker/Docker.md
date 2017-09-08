# Docker

## Commands

### Run MySQL environment

```
docker run --name mysql -e MYSQL_ROOT_PASSWORD=t00r -p 3306:3306 -d mysql:latest
```

### Run Magento environment

```
docker run --name mysql -e MYSQL_ROOT_PASSWORD=t00r -e MYSQL_DATABASE=magento -e MYSQL_USER=magento -e MYSQL_PASSWORD=magento -d mysql:latest
docker run --name magento --link mysql:mysql -p 80:80 -d alexcheng/magento:latest
```
