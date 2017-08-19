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
PUBLIC "-//IXIA//ELEMENTS DITA Global Href Constraints//EN"
      Delivered as file "constraint-href-global.mod"               -->

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

<!ENTITY href-constraints     
                        "(topic hrefConstraints-c)"             >


<!--                    Redeclaration of common attribute groups   -->
<!ENTITY % props-attribute-extensions 
  ""
>
<!ENTITY % base-attribute-extensions 
  ""
>
<!ENTITY % filter-atts
             'props 
                         CDATA 
                                   #IMPLIED
              platform 
                         CDATA 
                                   #IMPLIED
              product 
                         CDATA 
                                   #IMPLIED
              audience 
                         CDATA 
                                   #IMPLIED
              otherprops 
                         CDATA 
                                   #IMPLIED
              %props-attribute-extensions; 
  ' 
>
<!ENTITY % select-atts 
             '%filter-atts;
              base 
                         CDATA 
                                  #IMPLIED
              %base-attribute-extensions;
              importance 
                        (default | 
                         deprecated | 
                         high | 
                         low | 
                         normal | 
                         obsolete | 
                         optional | 
                         recommended | 
                         required | 
                         urgent | 
                         -dita-use-conref-target ) 
                                  #IMPLIED
              rev 
                        CDATA 
                                  #IMPLIED
              status 
                        (changed | 
                         deleted | 
                         new | 
                         unchanged | 
                         -dita-use-conref-target) 
                                  #IMPLIED' 
>
<!ENTITY % conref-atts 
             'conrefend
                        CDATA
                                  #IMPLIED
              conaction
                        (mark |
                         pushafter |
                         pushbefore |
                         pushreplace |
                         -dita-use-conref-target)
                                  #IMPLIED
              conkeyref
                        CDATA
                                  #IMPLIED' 
>
<!ENTITY % id-atts 
             'id 
                        NMTOKEN 
                                  #IMPLIED
              %conref-atts;' 
>
<!ENTITY % localization-atts 
             'translate 
                        (no | 
                         yes | 
                         -dita-use-conref-target) 
                                  #IMPLIED
              xml:lang 
                        CDATA 
                                  #IMPLIED
              dir 
                        (lro | 
                         ltr | 
                         rlo | 
                         rtl | 
                         -dita-use-conref-target) 
                                  #IMPLIED' 
>
<!ENTITY % univ-atts 
             '%id-atts;
              %select-atts;
              %localization-atts;' 
>
<!ENTITY % univ-atts-no-importance
             "base 
                        CDATA 
                                  #IMPLIED
              %base-attribute-extensions;
              %id-atts;
              %filter-atts;
              %localization-atts; 
              rev 
                        CDATA 
                                  #IMPLIED
               status 
                        (new | 
                         changed | 
                         deleted |
                         unchanged | 
                         -dita-use-conref-target) 
                                  #IMPLIED
  " 
> 
<!ENTITY % relational-atts 
             'type 
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
              role 
                        (ancestor | 
                         child | 
                         cousin | 
                         descendant | 
                         external | 
                         friend | 
                         next | 
                         other |
                         parent | 
                         previous | 
                         sample | 
                         sibling | 
                         -dita-use-conref-target) 
                                  #IMPLIED
              otherrole 
                        CDATA 
                                  #IMPLIED
  '
>

<!-- ================== End Href Constraints ===================== -->
