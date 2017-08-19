<?xml version="1.0" encoding="UTF-8"?>
<!-- ============================================================= -->
<!--                    HEADER                                     -->
<!-- ============================================================= -->
<!--  MODULE:    Version                                           -->
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
PUBLIC "-//IXIA//ELEMENTS DITA CMS Version//EN" 
      Delivered as file "version.mod"                              -->

<!-- ============================================================= -->
<!-- SYSTEM:     Darwin Information Typing Architecture (DITA)     -->
<!--                                                               -->
<!-- PURPOSE:    Declaring the elements and specialization         -->
<!--             attributes for the DITA Version                   -->
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
                                  '1.2'
  "
>

<!-- ============================================================= -->
<!--                   ELEMENT NAME ENTITIES                       -->
<!-- ============================================================= -->

<!ENTITY % version          "version"                                >
<!ENTITY % libversion       "libversion"                             >
<!ENTITY % versionmeta      "versionmeta"                            >
<!ENTITY % containers       "containers"                             >
<!ENTITY % container        "container"                              >
<!ENTITY % libraries        "libraries"                              >
<!ENTITY % library          "library"                                >



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

<!--            LONG NAME: version                                 -->
<!ENTITY % version.content 
                            "( (%name;), 
                               (%versionmeta;)?,
                               (%containers;),
                               (%libraries;)? ) "                    >

<!ELEMENT version  %version.content;                                 >
<!ATTLIST version 
                   %map.attributes; 
                   %arch-atts; 
                   domains 
                             CDATA 
                                       "&included-domains;"          >


<!ELEMENT libversion
                   %version.content;                                 >
<!ATTLIST libversion 
                   %map.attributes; 
                   %arch-atts; 
                   domains 
                             CDATA 
                                       "&included-domains;"          >


<!--            LONG NAME: version meta                            -->
<!ENTITY % versionmeta.content 
                       "((%description;)?,
                         (%aliases;)?)"                              >
<!ELEMENT versionmeta %versionmeta.content;                          >
<!ATTLIST versionmeta %topicmeta.attributes;                         >


<!--            LONG NAME: version container set                   -->
<!ENTITY % containers.content "( (%container;)* )"                   >
<!ELEMENT containers %containers.content;                            >
<!ATTLIST containers %topicgroup.attributes;                         >


<!--            LONG NAME: version container                       -->
<!ENTITY % container.content  "EMPTY"                                >
<!ELEMENT container %container.content;                              >
<!ATTLIST container %mapref.attributes;                              >


<!--            LONG NAME: version library set                     -->
<!ENTITY % libraries.content "( (%library;)* )"                      >
<!ELEMENT libraries %libraries.content;                              >
<!ATTLIST libraries %topicgroup.attributes;                          >


<!--            LONG NAME: version library                         -->
<!ENTITY % library.content  "EMPTY"                                  >
<!ELEMENT library %container.content;                                >
<!ATTLIST library %mapref.attributes;                                >


<!-- ============================================================= -->
<!--                    SPECIALIZATION ATTRIBUTE DECLARATIONS      -->
<!-- ============================================================= -->

<!ATTLIST version          %global-atts;  class CDATA "- map/map version/version " >
<!ATTLIST libversion       %global-atts;  class CDATA "- map/map version/version libversion/libversion " >
<!ATTLIST versionmeta      %global-atts;  class CDATA "- map/topicmeta version/versionmeta " >
<!ATTLIST containers       %global-atts;  class CDATA "+ map/topicref mapgroup-d/topicgroup version/containers " >
<!ATTLIST container        %global-atts;  class CDATA "+ map/topicref mapgroup-d/mapref version/container " >
<!ATTLIST libraries        %global-atts;  class CDATA "+ map/topicref mapgroup-d/topicgroup version/libraries " >
<!ATTLIST library          %global-atts;  class CDATA "+ map/topicref mapgroup-d/mapref version/library " >

<!-- ===================== End Version =========================== -->