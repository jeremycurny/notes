# Apache

## Directives

### AddDefaultCharset

Response charset

```
AddDefaultCharset utf-8
```

### AllowOverride

Directives allowed in .htaccess

```
AllowOverride All
AllowOverride None
AllowOverride FileInfo
AllowOverride FileInfo Indexes Options
```

### Options

Features available in a particular directory
*The FollowSymLinks and SymLinksIfOwnerMatch Options work only in **<Directory>** sections or .htaccess files.*

```
Options Indexes FollowSymLinks
Options +Indexes -FollowSymLinks
```

#### All

All options except for MultiViews. This is the default setting.

#### FollowSymLinks

#### Indexes

Return a formatted listing of the directory if no DirectoryIndex (default : index.html, index.php...).

#### MultiViews

#### SymLinksIfOwnerMatch
