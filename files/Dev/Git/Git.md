# Git

## Avoid collaborative errors

### CR, CRLF

#### By configuring Git

```
git config core.autocrlf true
```

#### By remplacing on local

```
find . -type f -exec dos2unix {} \;
```

### Ignore fileMode (chmod)
```
git config core.fileMode false
```

## Change remote URL

```
git remote set-url origin ssh://git@github.com:jeremycurny/project.git
```
