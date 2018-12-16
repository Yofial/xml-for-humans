A simple project for displaying xml files to non technical humans.

#Features
* Transform xml into html
* Translate names from technical xml into human readable names, using an external xml map
* Supports running in the client (the browser) as well as in the server

#Running the project
To test the project in the browser, serve the project over http and request the xml file from the browser.
Each xml file should reference the xslt stylesheet.

Here is an example
```
<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type="text/xsl" href="view.xsl"?>
<catalog>
  <cd>
  ...
```
