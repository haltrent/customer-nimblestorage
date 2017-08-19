<?xml version="1.0" encoding="UTF-8"?>
<!-- ============================================================= -->
<!--                    HEADER                                     -->
<!-- ============================================================= -->
<!--  MODULE:    Release                                           -->
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
PUBLIC "-//IXIA//ELEMENTS DITA CMS Release//EN" 
      Delivered as file "release.mod"                              -->

<!-- ============================================================= -->
<!-- SYSTEM:     Darwin Information Typing Architecture (DITA)     -->
<!--                                                               -->
<!-- PURPOSE:    Declaring the elements and specialization         -->
<!--             attributes for the DITA Release                   -->
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

<!ENTITY % release          "release"                                >
<!ENTITY % releasemeta      "releasemeta"                            >
<!ENTITY % versions         "versions"                               >
<!ENTITY % version          "version"                                >

<!ENTITY % librelease       "librelease"                             >

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

<!--            LONG NAME: release                                 -->
<!ENTITY % release.content 
                            "( (%name;), 
                               (%releasemeta;)?, 
                               (%versions;) ) "                      >

<!ELEMENT release %release.content;                                  >
<!ATTLIST release 
                   %map.attributes; 
                   %arch-atts; 
                   domains 
                             CDATA 
                                       "&included-domains;"          >


<!ENTITY % librelease.content 
                            "( (%name;), 
                               (%releasemeta;)?, 
                               (%versions;) ) "                      >
<!ELEMENT librelease %librelease.content;                            >
<!ATTLIST librelease 
                   %map.attributes; 
                   %arch-atts; 
                   domains 
                             CDATA 
                                       "&included-domains;"          >


<!--            LONG NAME: release meta                            -->
<!ENTITY % releasemeta.content 
                       "((%description;)?,
                         (%aliases;)?)"                              >
<!ELEMENT releasemeta %releasemeta.content;                          >
<!ATTLIST releasemeta %topicmeta.attributes;                         >


<!--            LONG NAME: release version set                     -->
<!ENTITY % versions.content "( (%version;)* )"                       >
<!ELEMENT versions %versions.content;                                >
<!ATTLIST versions %topicgroup.attributes;                           >


<!--            LONG NAME: release version                         -->
<!ENTITY % version.content  "EMPTY"                                  >
<!ELEMENT version %version.content;                                  >
<!ATTLIST version %mapref.attributes;                                >


<!-- ============================================================= -->
<!--                    SPECIALIZATION ATTRIBUTE DECLARATIONS      -->
<!-- ============================================================= -->

<!ATTLIST release           %global-atts;  class CDATA "- map/map release/release " >
<!ATTLIST releasemeta       %global-atts;  class CDATA "- map/topicmeta release/releasemeta " >
<!ATTLIST versions          %global-atts;  class CDATA "+ map/topicref mapgroup-d/topicgroup release/versions " >
<!ATTLIST version           %global-atts;  class CDATA "+ map/topicref mapgroup-d/mapref release/version " >
<!ATTLIST librelease        %global-atts;  class CDATA "- map/map release/release librelease/librelease " >

<!-- ===================== End Release =========================== -->