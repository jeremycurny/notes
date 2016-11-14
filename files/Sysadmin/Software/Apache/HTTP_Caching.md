# HTTP Caching

## Summary

Type of HTTP Caching :

- ETag
- Expires
- Last-Modified

## How to

### Disable Deflate's Etag 
```
<IfModule mod_deflate.c>
    FileETag None
    <IfModule mod_headers.c>
        Header unset ETag
    </IfModule>
</IfModule>
```

### Etag

### Expires

```
<IfModule mod_expires.c>
    ExpiresActive On
    ExpiresDefault "now"
    ExpiresByType text/css "now plus 1 month"
</IfModule>
```

### Last-Modified
