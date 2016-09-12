# Create a Magento module

## Module content

### Code
Code of the module, will be in /app/code/local/..., example : /app/code/local/Jcurny/Firstmodule

#### Content of the template code folder

* Block/
* Helper/
* Model/
* controllers/
* etc/
* sql/

### Template
TBD

## Creating the module Jcurny/Firstmodule

### Initialization

* Create the folder "/app/code/local/Jcurny/Firstmodule"
* Create the file Jcurny_Firstmodule.xml with this content :

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
