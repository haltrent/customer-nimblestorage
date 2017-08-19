<?xml version="1.0" encoding="UTF-8"?>
<!-- ============================================================= -->
<!--                    HEADER                                     -->
<!-- ============================================================= -->
<!--  MODULE:    Href Constraints                                  -->
<!--  VERSION:   1.3                                               -->
<!--  DATE:      March 2012                                        -->
<!--                                                               -->
<!-- ============================================================= -->

<!-- ============================================================= -->
<!--                    PUBLIC DOCUMENT TYPE DEFINITION            -->
<!--                    TYPICAL INVOCATION                         -->
<!--                                                               -->
<!--  Refer to this file by the following public identifier or an 
      appropriate system identifier 
PUBLIC "-//IXIA//ELEMENTS DITA Topic Href Constraints//EN"
      Delivered as file "constraint-href-topic.mod"                -->

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
<!--                    SAP Href Constraints                       -->
<!-- ============================================================= -->

<!--                    Redeclaration of topic elements attributes -->
<!ENTITY % coderef.attributes
             "keyref 
                        CDATA 
                                  #IMPLIED
              type 
                        CDATA 
                                  #IMPLIED
              format 
                        CDATA 
                                  #IMPLIED
              scope 
                        (external | 
                         local | 
                         peer | 
                         -dita-use-conref-target) 
                                  #IMPLIED
              %univ-atts;
              outputclass 
                        CDATA 
                                  #IMPLIED"
>

<!ENTITY % data-about.attributes
             "%univ-atts;
              keyref 
                        CDATA 
                                  #IMPLIED
              format 
                        CDATA 
                                  #IMPLIED
              type 
                        CDATA 
                                  #IMPLIED
              scope 
                       (external | 
                        local | 
                        peer | 
                        -dita-use-conref-target) 
                                  #IMPLIED
              outputclass
                        CDATA 
                                  #IMPLIED"
>

<!ENTITY % data-element-atts
             '%univ-atts;
              name 
                        CDATA 
                                  #IMPLIED
              datatype 
                        CDATA 
                                  #IMPLIED
              value 
                        CDATA 
                                  #IMPLIED
              keyref 
                        CDATA 
                                  #IMPLIED
              format 
                        CDATA 
                                  #IMPLIED
              type 
                        CDATA 
                                  #IMPLIED
              scope 
                        (external | 
                         local | 
                         peer | 
                         -dita-use-conref-target) 
                                  #IMPLIED
              outputclass
                        CDATA 
                                  #IMPLIED' 
>

<!ENTITY % fragref.attributes
             "href 
                        CDATA 
                                  #IMPLIED
              importance 
                        (optional | 
                         required | 
                         -dita-use-conref-target) 
                                  #IMPLIED
              %univ-atts-no-importance; 
              outputclass 
                        CDATA
                                  #IMPLIED"
>

<!ENTITY % hazardsymbol.attributes
             "scope 
                        (external | 
                         local | 
                         peer | 
                         -dita-use-conref-target) 
                                  #IMPLIED
              keyref 
                        CDATA 
                                  #IMPLIED
              longdescref 
                        CDATA 
                                  #IMPLIED
              height 
                        NMTOKEN 
                                  #IMPLIED
              width 
                        NMTOKEN 
                                  #IMPLIED
              align 
                        CDATA 
                                  #IMPLIED
              scale 
                        NMTOKEN 
                                  #IMPLIED
              scalefit
                        (yes |
                         no |
                         -dita-use-conref-target)
                                  #IMPLIED
              placement 
                        (break | 
                         inline | 
                         -dita-use-conref-target) 
                                  'inline'
              %univ-atts;
              outputclass 
                        CDATA 
                                  #IMPLIED"
>

<!ENTITY % image.attributes
             "scope 
                        (external | 
                         local | 
                         peer | 
                         -dita-use-conref-target) 
                                  #IMPLIED
              keyref 
                        CDATA 
                                  #IMPLIED
              alt 
                        CDATA 
                                  #IMPLIED
              longdescref 
                        CDATA 
                                  #IMPLIED
              height 
                        NMTOKEN 
                                  #IMPLIED
              width 
                        NMTOKEN 
                                  #IMPLIED
              align 
                        CDATA 
                                  #IMPLIED
              scale 
                        NMTOKEN 
                                  #IMPLIED
              scalefit
                        (yes |
                         no |
                         -dita-use-conref-target)
                                  #IMPLIED
              placement 
                        (break | 
                         inline | 
                         -dita-use-conref-target) 
                                  'inline'
              %univ-atts;
              outputclass 
                        CDATA 
                                  #IMPLIED"
>

<!ENTITY % longdescref.attributes
             "keyref 
                        CDATA 
                                  #IMPLIED
              type 
                        CDATA 
                                  #IMPLIED
              format 
                        CDATA 
                                  #IMPLIED
              scope 
                        (external | 
                         local | 
                         peer | 
                         -dita-use-conref-target) 
                                  #IMPLIED
              %univ-atts;
              outputclass 
                        CDATA 
                                  #IMPLIED"
>

<!ENTITY % longquoteref.attributes
             "keyref 
                        CDATA 
                                  #IMPLIED
              type 
                        CDATA 
                                  #IMPLIED
              format 
                        CDATA 
                                  #IMPLIED
              scope 
                        (external | 
                         local | 
                         peer | 
                         -dita-use-conref-target) 
                                  #IMPLIED
              %univ-atts;
              outputclass 
                        CDATA 
                                  #IMPLIED"
>

<!ENTITY % lq.attributes
             "keyref 
                        CDATA 
                                  #IMPLIED
              format 
                        CDATA 
                                  #IMPLIED
              type 
                        CDATA 
                                  #IMPLIED
              scope 
                       (external | 
                        local | 
                        peer | 
                        -dita-use-conref-target) 
                                  #IMPLIED
              reftitle 
                        CDATA 
                                  #IMPLIED
              %univ-atts;
              outputclass 
                        CDATA 
                                  #IMPLIED"
>

<!ENTITY % source.attributes
             "%univ-atts;
              format 
                        CDATA 
                                  #IMPLIED
              type 
                        CDATA 
                                  #IMPLIED
              scope 
                       (external | 
                        local | 
                        peer | 
                        -dita-use-conref-target) 
                                  #IMPLIED
              keyref 
                        CDATA 
                                  #IMPLIED"
>

<!ENTITY % synnoteref.attributes
             "href 
                        CDATA 
                                  #IMPLIED
              %univ-atts; 
              outputclass 
                        CDATA
                                  #IMPLIED"
>

<!-- ================== End Href Constraints ===================== -->
