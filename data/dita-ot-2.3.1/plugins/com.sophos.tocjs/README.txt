TOCJS README

The tocjs plugin generates a Table of Contents for the DITA Open Toolkit's 
XHTML output that can expand and collapse nodes. It is a more usable and 
visually pleasing option than the standard index.html generated by the Open 
Toolkit's dita2html  transformation.

Note: The examples below assume a Unix style file separator. If you are on 
      a Windows machine, replace the '/' character with a '\' character for 
      all file paths.

To install and test the plugin:

 1) From the main directory of the DITA Open Toolkit, type:

      ant -f integrator.xml
     
 2) Type: ant -f demo/tocjs/buildsample.xml sample2tocjs.

 3) Open demo/tocjs/out/sample/frameset.html in a browser.

For more detailed documentation and licensing information, see README.html 
in the 'docs' directory.


     
