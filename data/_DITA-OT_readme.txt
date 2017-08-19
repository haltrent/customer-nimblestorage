The DITA Open Toolkits integrated in the IXIASOFT Output Generator are a copy of:
- the "full easy install" package version 1.8.5 
- the zip package version 2.3.1

Both are available from the DITA OT website at http://www.dita-ot.org/download

IXIASOFT made the following changes to OT 1.8.5:

1. Added the following required IXIASOFT plugins: 
   - com.ixiasoft.dita.dtd: IXIASOFT DITA DTD specializations (using the legacy
     DTD folder)
   - com.ixiasoft.pdf.review: Specialized output type for the DITA CMS PDF-based
     review process (only for OT 1.6 and up but not 2.x)

IXIASOFT made the following changes to OT 2.3.1:

1. Added the following required IXIASOFT plugins: 
   - com.ixiasoft.dita.dtd: IXIASOFT DITA DTD specializations (using the new
     plugin DITA 1.2 plugin org.oasis-open.dita.v1_2)
   - com.ixiasoft.pdf.review20: Specialized output type for the DITA CMS PDF-based
     review process (only for OT 2.x and up)

IXIASOFT made the following changes to each OT:

1. Integrated the following plugins:
   - com.ixiasoft.images: Integration of the ".image" file extension for images
   
   Note: This plugin is required to support the image format of the DITA CMS
   
2 Integrated the following plugins:
   - org.oasis-open.dita.mathml.doctypes: MathML DITA integration
   - org.mathml3: MathML 3 DTDs
   - org.w3c.svg1.0: SVG 1.0
   - org.w3c.svg1.1: SVG 1.1
   
   Note: These plugins were made by IXIASFOT and they are not the same as the one
         already integrated in the DITA 1.3 atandard. They are requried if you have
         content that was using them before DITA 1.3. If you content comply with 
         DITA 1.3, you can remove these plugin.
    
3. Executed the integration process.

TO INSTALL A NEW DITA OPEN TOOLKIT IN THE OUTPUT GENERATOR

1. Copy the new OT folder in the [OG_INSTALL_DIR]/data folder.

TO CHANGE OR UPDATE THE DITA OPEN TOOLKIT IN THE OUTPUT GENERATOR

1. Change the path to the OT folder:
   In the following file:
   /data/catalogs/catalog-dita-outgen.xml
   
    Change the following line:

    <nextCatalog catalog="../DITA-OT1.8.5/catalog-dita.xml"/>

    to this line:

    <nextCatalog catalog="../dita-ot-%version%/catalog-dita.xml"/>
  
  Where %version% is the version of the OT; 
  
  For example:
  <nextCatalog catalog="../dita-ot-2.1.1/catalog-dita.xml"/>
    
    NOTE: The name of the folder of the DITA OT *MUST* match either DITA-OTx.x.x or dita-ot-.x.x.x (case sensitive)

2. Set the version of the DITA OT to use

   To change it globally for every conductor*.xml file that doesnt't overide it
   
   1. Open the file outgen-init.properties (if it doesn't exist rename
      outgen-init.properties.orig)
   2. Change the value of outgen.ot.verion=2.3.1 to the new version
   
   To change the DITA OT version for only one cnductor file
   
   1. Open condutor-*.xml files that need to use the new DITA OT, change or add
    the following info at the beginning of the file:

    <!-- Set the version of the OT that will be used -->
    <property name="outgen.ot.version" value="2.1.1"/>
    <property name="outgen.ot.release.family" value="2.x"/>


For more detailed instructions, see Installing and Configuring the Output Generator and
the DITA CMS Support Portal.
