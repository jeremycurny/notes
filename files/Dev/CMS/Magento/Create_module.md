# Create a Magento module

## Module content

### Code
Code of the module, will be in /app/code/local/..., example : /app/code/local/Jcurny/Firstmodule

#### Content of the code folder

* Block/
* Helper/
* Model/
* controllers/
* etc/
* sql/

## Creating the module Jcurny/Firstmodule

### Initialization

* Create the folder "/app/code/local/Jcurny/Firstmodule"
* Create the file /app/code/local/Jcurny/Firstmodule/etc/config.xml with this content :

```
<?xml version="1.0"?>
<config>
  <modules>
    <Jcurny_Firstmodule>
      <version>1.0.0</version>
    </Jcurny_Firstmodule>
  </modules>
</config>
```

* Create the file /app/etc/modules/Jcurny_Firstmodule.xml with this content :

```
<?xml version="1.0"?>
<config>
  <modules>
    <Jcurny_Firstmodule>
      <active>true</active>
      <codePool>local</codePool>
    </Jcurny_Firstmodule>
  </modules>
</config>
```

### Controller

Creating the /**frontName**/**action** url. Frontname = jcurnyfirstmodule, Action= index (see config.xml and controller below)

* Edit the file /app/code/local/Jcurny/Firstmodule/etc/config.xml, add this child node in the config node :

```
<frontend>
  <routers>
    <jcurnyfirstmodule>
      <use>standard</use>
      <args>
        <module>Jcurny_Firstmodule</module>
        <frontName>jcurnyfirstmodule</frontName>
      </args>
    </jcurnyfirstmodule>
  </routers>
</frontend>
```

* Create the file /app/code/local/Jcurny/Firstmodule/controllers/IndexController.php :

```
<?php
class Jcurny_Firstmodule_IndexController extends Mage_Core_Controller_Front_Action
{
   public function indexAction()
   {
     echo 'boo !';
   }
}
```

* Try http://website.com/jcurnyfirstmodule/index

### Helper

* Edit the file /app/code/local/Jcurny/Firstmodule/etc/config.xml, add this child node in the config node :

```
<global>
  <helpers>
    <jcurny_firstmodule>
      <class>Jcurny_Firstmodule_Helper</class>
    </jcurny_firstmodule>
  </helpers>
</global>
```

* Create the file /app/code/local/Jcurny/Firstmodule/Helper/Boo.php :

```
<?php
class Jcurny_Firstmodule_Helper_Boo extends Mage_Core_Helper_Abstract
{
   public function boo()
   {
     return 'boo !';
   }
}
```

To call it : 

```
$booHelper = Mage::helper('jcurny_firstmodule/boo');
echo $booHelper->boo();
```
