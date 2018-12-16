A simple project for displaying xml files to non technical humans.

## Features
* Transform xml into html
* Translate names from technical xml into human readable names, using an external xml map
* Supports running in the client (the browser) as well as in the server

## Running the project
To run the project in the browser, clone or download the project and serve the project over http.
Modify the 'map.xml' as you wish and add the input xml files to the same directory.
In order to run the transformation in the client, each input xml file should reference the xslt stylesheet.

Here is an example taken from 'file.xml' which is included in this project:
```
<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type="text/xsl" href="view.xsl"?>
<catalog>
  <cd>
  ...
```
You may serve the project on any HTTP Server of your choice such as nginx.
If you are running on a linux machine, you can simply run the following from within the project dir:
```python -m SimpleHTTPServer```
