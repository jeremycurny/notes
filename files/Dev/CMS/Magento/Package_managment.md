# Magento package managment with Composer

## Initialisation

Create a composer.json at the magento root with this content :

```
{
    "require": {
        "magento-hackathon/magento-composer-installer": "*"
    },
    "extra": {
        "magento-root-dir":"./",
        "magento-deploystrategy":"copy"
    },
    "repositories": [
        {
            "packagist": false
        },
        {
            "type":"composer",
            "url":"https://packages.firegento.com"
        }
   ]
}
```

Then install

```
composer install
```

## Adding our First Package

```
composer require pulsestorm/magento-better404
```

Look at the "app/code/community/" folder, "Pulsestorm" is here !

Congratulations ! You’ve used composer to download your first Magento package with Composer !
