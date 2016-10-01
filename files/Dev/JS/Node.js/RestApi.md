# NodeJS REST API

## Initialization

### Nodemon

Nodemon (reload server when source changed)

```
npm install -g nodemon
```

### Application folder

```
mkdir node-rest-api
cd node-rest-api
touch server.js
```

### Npm

Entry point : server.js

```
npm init
npm install express --save
```

### Development

#### Initialization of server.js

Content of server.js : 

```
// Get packages
var express = require('express');

// Create Express application
var app = express();

// Start the server
var port = process.env.PORT || 7477;
app.listen(port);
console.log('Server started on port ' + port);
```

Server start with  :

```
nodemon server.js
```
