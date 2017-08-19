<?xml version="1.0" encoding="UTF-8"?>
<!-- ============================================================= -->
<!--                    HEADER                                     -->
<!-- ============================================================= -->
<!--  MODULE:    Product                                           -->
<!--  VERSION:   1.0                                               -->
<!--  DATE:      February 2014                                     -->
<!--                                                               -->
<!-- ============================================================= -->

<!-- ============================================================= -->
<!--                    PUBLIC DOCUMENT TYPE DEFINITION            -->
<!--                    TYPICAL INVOCATION                         -->
<!--                                                               -->
<!--  Refer to this file by the following public identifier or an 
      appropriate system identifier 
PUBLIC "-//IXIA//ELEMENTS DITA CMS Product//EN" 
      Delivered as file "product.mod"                              -->

<!-- ============================================================= -->
<!-- SYSTEM:     Darwin Information Typing Architecture (DITA)     -->
<!--                                                               -->
<!-- PURPOSE:    Declaring the elements and specialization         -->
<!--             attributes for the DITA Product                   -->
<!--                                                               -->
<!-- ============================================================= -->


<!-- ============================================================= -->
<!--                   ARCHITECTURE ENTITIES                       -->
<!-- ============================================================= -->

<!-- default namespace prefix for DITAArchVersion attribute can be
     overridden through predefinition in the document type shell   -->
<!ENTITY % DITAArchNSPrefix
  "ditaarch"
>

<!-- must be instanced on each topic type                          -->
<!ENTITY % arch-atts 
             "xmlns:%DITAArchNSPrefix; 
                        CDATA
                                  #FIXED 'http://dita.oasis-open.org/architecture/2005/'
              %DITAArchNSPrefix;:DITAArchVersion
                        CDATA
                                  '1.3'
  "
>

<!-- ============================================================= -->
<!--                   ELEMENT NAME ENTITIES                       -->
<!-- ============================================================= -->

<!ENTITY % product          "product"                                >
<!ENTITY % productmeta      "productmeta"                            >
<!ENTITY % code             "code"                                   >
<!ENTITY % codealias        "codealias"                              >
<!ENTITY % productlines     "productlines"                           >
<!ENTITY % layer            "layer"                                  >
<!ENTITY % productline      "productline"                            >
<!ENTITY % linename         "linename"                               >
<!ENTITY % linecode         "linecode"                               >
<!ENTITY % linealias        "linealias"                              >
<!ENTITY % relatedproducts  "relatedproducts"                        >
<!ENTITY % relatedproduct   "relatedproduct"                         >
<!ENTITY % components       "components"                             >
<!ENTITY % releases         "releases"                               >
<!ENTITY % release          "release"                                >

<!ENTITY % library         "library"                                 >
<!ENTITY % librarymeta     "librarymeta"                             >

<!-- ============================================================= -->
<!--                    ENTITY DECLARATIONS FOR ATTRIBUTE VALUES   -->
<!-- ============================================================= -->


<!-- ============================================================= -->
<!--                    COMMON ATTLIST SETS                        -->
<!-- ============================================================= -->


<!-- ============================================================= -->
<!--                    MODULES CALLS                              -->
<!-- ============================================================= -->

<!ENTITY % release-management-def
                        PUBLIC 
"-//IXIA//ELEMENTS DITA CMS ReleaseManagement//EN"
"release-management.mod"                                             >
%release-management-def;

<!-- ============================================================= -->
<!--                    DOMAINS ATTRIBUTE OVERRIDE                 -->
<!-- ============================================================= -->

<!ENTITY included-domains 
  "" 
>

<!-- ============================================================= -->
<!--                    ELEMENT DECLARATIONS                       -->
<!-- ============================================================= -->

<!--            LONG NAME: product                                 -->
<!ENTITY % product.content 
                            "( (%name;), 
                               (%productmeta;),
                               (%relatedproducts;)?, 
                               (%releases;) ) "                      >

<!ELEMENT product %product.content;                                  >
<!ATTLIST product 
                   %map.attributes; 
                   %arch-atts; 
                   domains 
                             CDATA 
                                       "&included-domains;"          >


<!--            LONG NAME: product meta                            -->
<!ENTITY % productmeta.content 
                       "((%code;), 
                         (%codealias;)?,
                         (%description;)?,
                         (%layer;)?,  
                         (%aliases;)?,
                         (%productlines;)?,
                         (%components;)?)"                           >
<!ELEMENT productmeta %productmeta.content;                          >
<!ATTLIST productmeta %topicmeta.attributes;                         >


<!--            LONG NAME: product code                            -->
<!ELEMENT code (#PCDATA)                                             >
<!ATTLIST code %linktext.attributes;                                 >


<!--            LONG NAME: product code alias                      -->
<!ELEMENT codealias (#PCDATA)                                        >
<!ATTLIST codealias %searchtitle.attributes;                         >


<!--                    LONG NAME: Layer Level                     -->
<!ENTITY % layer.content "EMPTY"                                     >
<!ENTITY % layer.attributes
             "name 
                        CDATA 
                                  'layer' 
              content 
                        CDATA 
                                  #REQUIRED
              translate-content
                        CDATA 
                                  'no' 
              %univ-atts;"
>


<!--            LONG NAME: product line set                        -->
<!ENTITY % productlines.content 
                       "((%productline;)*)"                          >
<!ELEMENT productlines %productlines.content;                        >
<!ATTLIST productlines %prodinfo.attributes;                         >


<!--            LONG NAME: product line                            -->
<!ENTITY % productline.content 
                       "((%linename;), 
                         (%linecode;),
                         (%linealias;)?)"                            >
<!ELEMENT productline %productline.content;                          >
<!ATTLIST productline %component.attributes;                         >


<!--            LONG NAME: product line name                       -->
<!ELEMENT linename (#PCDATA)                                         >
<!ATTLIST linename %keyword.attributes;                              >


<!--            LONG NAME: product line code                       -->
<!ELEMENT linecode (#PCDATA)                                         >
<!ATTLIST linecode %keyword.attributes;                              >


<!--            LONG NAME: product line alias                      -->
<!ELEMENT linealias (#PCDATA)                                        >
<!ATTLIST linealias %term.attributes;                                >


<!ELEMENT layer         %layer.content;                              >
<!ATTLIST layer         %layer.attributes;                           >

<!--            LONG NAME: component  set                          -->
<!ENTITY % components.content
                            "( (%component;)* )"                     >
<!ELEMENT components %components.content;                            >
<!ATTLIST components %prodinfo.attributes;                           >


<!--            LONG NAME: component code                          -->
<!ELEMENT componentcode (#PCDATA)                                    >
<!ATTLIST componentcode %keywords.attributes;                        >


<!--            LONG NAME: component name                          -->
<!ELEMENT componentname (#PCDATA)                                    >
<!ATTLIST componentname %term.attributes;                            >


<!--            LONG NAME: product related product set             -->
<!ENTITY % relatedproducts.content
                            "( (%relatedproduct;)* )"                >
<!ELEMENT relatedproducts %relatedproducts.content;                  >
<!ATTLIST relatedproducts %topicgroup.attributes;                    >


<!--            LONG NAME: product related product                 -->
<!ENTITY % relatedproduct.content   "EMPTY"                          >
<!ELEMENT relatedproduct %relatedproduct.content;                    >
<!ATTLIST relatedproduct %navref.attributes;                         >


<!--            LONG NAME: product release set                     -->
<!ENTITY % releases.content "( (%release;)* )"                       >
<!ELEMENT releases %releases.content;                                >
<!ATTLIST releases %topicgroup.attributes;                           >


<!--            LONG NAME: product release                         -->
<!ENTITY % release.content  "EMPTY"                                  >
<!ELEMENT release %release.content;                                  >
<!ATTLIST release %mapref.attributes;                                >



<!--            LONG NAME: library                                 -->
<!ENTITY % library.content 
                            "( (%name;), 
                               (%librarymeta;),
                               (%releases;) ) "                      >
<!ELEMENT library %library.content;                                  >
<!ATTLIST library 
                   %map.attributes; 
                   %arch-atts; 
                   domains 
                             CDATA 
                                       "&included-domains;"          >


<!--            LONG NAME: library meta                            -->
<!ENTITY % librarymeta.content 
                       "((%code;), 
                         (%codealias;)?,
                         (%description;)?, 
                         (%layer;)?,
                         (%aliases;)?,
                         (%components;)?)"                           >
<!ELEMENT librarymeta %librarymeta.content;                          >
<!ATTLIST librarymeta %topicmeta.attributes;                         >

<!-- ============================================================= -->
<!--                    SPECIALIZATION ATTRIBUTE DECLARATIONS      -->
<!-- ============================================================= -->

<!ATTLIST product           %global-atts;  class CDATA "- map/map product/product " >
<!ATTLIST productmeta       %global-atts;  class CDATA "- map/topicmeta product/productmeta " >
<!ATTLIST code              %global-atts;  class CDATA "- map/linktext product/code " >
<!ATTLIST codealias         %global-atts;  class CDATA "- map/searchtitle product/codealias " >
<!ATTLIST components        %global-atts;  class CDATA "- topic/prodinfo product/components " >
<!ATTLIST productlines      %global-atts;  class CDATA "- topic/prodinfo product/productlines " >
<!ATTLIST productline       %global-atts;  class CDATA "- topic/component product/productlines " >
<!ATTLIST linename          %global-atts;  class CDATA "- topic/keyword product/linename " >
<!ATTLIST linecode          %global-atts;  class CDATA "- topic/keyword product/linecode " >
<!ATTLIST linealias         %global-atts;  class CDATA "- topic/term product/linealias " >
<!ATTLIST componentcode     %global-atts;  class CDATA "- topic/keyword product/componentcode " >
<!ATTLIST componentname     %global-atts;  class CDATA "- topic/term product/componentname " >
<!ATTLIST relatedproducts   %global-atts;  class CDATA "+ map/topicref mapgroup-d/topicgroup product/relatedproducts " >
<!ATTLIST relatedproduct    %global-atts;  class CDATA "- map/navref product/relatedproduct " >
<!ATTLIST releases          %global-atts;  class CDATA "+ map/topicref mapgroup-d/topicgroup product/releases " >
<!ATTLIST release           %global-atts;  class CDATA "+ map/topicref mapgroup-d/mapref product/release " >

<!ATTLIST library           %global-atts;  class CDATA "- map/map product/product library/library " >
<!ATTLIST librarymeta       %global-atts;  class CDATA "- map/topicmeta product/productmeta library/librarymeta " >

<!ATTLIST layer             %global-atts;  class CDATA "- topic/othermeta product/layer " >

<!-- ===================== End Product =========================== -->