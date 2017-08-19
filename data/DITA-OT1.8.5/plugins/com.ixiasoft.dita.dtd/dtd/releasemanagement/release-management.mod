<?xml version="1.0" encoding="UTF-8"?>
<!-- ============================================================= -->
<!--                    HEADER                                     -->
<!-- ============================================================= -->
<!--  MODULE:    Release Managemment                               -->
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
PUBLIC "-//IXIA//ELEMENTS DITA CMS ReleaseManagement//EN"
      Delivered as file "release-management.mod"                   -->

<!-- ============================================================= -->
<!-- SYSTEM:     Darwin Information Typing Architecture (DITA)     -->
<!--                                                               -->
<!-- PURPOSE:    Declaring the domain entity for the strict task   -->
<!--             constraint module                                 -->
<!--                                                               -->
<!-- ORIGINAL CREATION DATE:                                       -->
<!--             April 2008                                        -->
<!--                                                               -->
<!--             (C) Copyright OASIS Open 2008, 2009.              -->
<!--             All Rights Reserved.                              -->
<!--                                                               -->
<!--  UPDATES:                                                     -->
<!-- ============================================================= -->



<!-- ============================================================= -->
<!--               Release Management common contants              -->
<!-- ============================================================= -->

<!ENTITY % name             "name"                                   >
<!ENTITY % aliases          "aliases"                                >
<!ENTITY % alias            "alias"                                  >
<!ENTITY % description      "description"                            >


<!-- ============================================================= -->
<!--                    ELEMENT DECLARATIONS                       -->
<!-- ============================================================= -->

<!--            LONG NAME: release management name                 -->
<!ELEMENT name (#PCDATA)                                             >
<!ATTLIST name %title.attributes;                                    >


<!--            LONG NAME: release management alias set            -->
<!ENTITY % aliases.content "(%alias;)*"                              >
<!ELEMENT aliases %aliases.content;                                  >
<!ATTLIST aliases %category.attributes;                              >


<!--            LONG NAME: release management alias                -->
<!ELEMENT alias (#PCDATA)                                            >
<!ATTLIST alias %term.attributes;                                    >


<!--            LONG NAME: release management description          -->
<!ELEMENT description (#PCDATA)                                      >
<!ATTLIST description %shortdesc.attributes;                         >

<!-- ============================================================= -->
<!--                    SPECIALIZATION ATTRIBUTE DECLARATIONS      -->
<!-- ============================================================= -->

<!ATTLIST name            %global-atts;  class CDATA "- topic/title release-management/name " >
<!ATTLIST aliases         %global-atts;  class CDATA "- topic/category release-management/aliases " >
<!ATTLIST alias           %global-atts;  class CDATA "- topic/term release-management/alias " >
<!ATTLIST description     %global-atts;  class CDATA "- map/shortdesc release-management/description " >

<!-- ========================END================================== -->