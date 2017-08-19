<?xml version="1.0" encoding="UTF-8"?>
<!-- ============================================================= -->
<!--                    HEADER                                     -->
<!-- ============================================================= -->
<!--  MODULE:    Container                                         -->
<!--  VERSION:   1.0                                               -->
<!--  DATE:      September 2013                                    -->
<!--                                                               -->
<!-- ============================================================= -->

<!-- ============================================================= -->
<!--                    PUBLIC DOCUMENT TYPE DEFINITION            -->
<!--                    TYPICAL INVOCATION                         -->
<!--                                                               -->
<!--  Refer to this file by the following public identifier or an 
      appropriate system identifier 
PUBLIC "-//IXIA//ELEMENTS DITA Container//EN"
      Delivered as file "container.mod"                            -->

<!-- ============================================================= -->
<!-- SYSTEM:     Darwin Information Typing Architecture (DITA)     -->
<!--                                                               -->
<!-- PURPOSE:    Declaring the elements and specialization         -->
<!--             attributes for the DITA Maps                      -->
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


<!ENTITY % container   "container"                                   >
<!ENTITY % containermeta
                       "containermeta"                               >
<!ENTITY % description "description"                                 >
<!ENTITY % owner       "owner"                                       >
<!ENTITY % layer       "layer"                                       >
<!ENTITY % translation-domain
                       "translation-domain"                          >
<!ENTITY % keydefs     "keydefs"                                     >
<!ENTITY % containerpartref
                       "containerpartref"                            >

<!-- ============================================================= -->
<!--                    ENTITY DECLARATIONS FOR ATTRIBUTE VALUES   -->
<!-- ============================================================= -->


<!-- ============================================================= -->
<!--                    COMMON ATTLIST SETS                        -->
<!-- ============================================================= -->


<!-- ============================================================= -->
<!--                    MODULES CALLS                              -->
<!-- ============================================================= -->


<!-- ============================================================= -->
<!--                    DOMAINS ATTRIBUTE OVERRIDE                 -->
<!-- ============================================================= -->

<!ENTITY included-domains 
  "" 
>
 
<!-- ============================================================= -->
<!--                    ELEMENT DECLARATIONS                       -->
<!-- ============================================================= -->


<!--                    LONG NAME: Content Container               -->
<!ENTITY % container.content
                       "((%title;)?, 
                         (%containermeta;)?, 
                         (%mapref;)*, 
                         (%containerpartref;)* )"
>
<!ELEMENT container     %container.content;                          >
<!ATTLIST container
              %map.attributes;
              %arch-atts;
              domains 
                        CDATA 
                                  "&included-domains;" 
>


<!--                    LONG NAME: Container Metadata              -->
<!ENTITY % containermeta.content
                       "((%navtitle;)?,
                         (%linktext;)?, 
                         (%searchtitle;)?, 
                         (%description;)?, 
                         (%owner;)*, 
                         (%source;)?, 
                         (%publisher;)?, 
                         (%copyright;)*, 
                         (%critdates;)?, 
                         (%permissions;)?, 
                         (%metadata;)*, 
                         (%audience;)*, 
                         (%category;)*, 
                         (%keywords;)*, 
                         (%prodinfo;)*, 
                         (%layer;)?, 
                         (%translation-domain;)?, 
                         (%othermeta;)*, 
                         (%resourceid;)*, 
                         (%data.elements.incl; | 
                          %foreign.unknown.incl;)*)"
>
<!ELEMENT containermeta %containermeta.content;                      >
<!ATTLIST containermeta %topicmeta.attributes;                       >


<!--                    LONG NAME: Container Description           -->
<!ELEMENT description   (#PCDATA)                                    >
<!ATTLIST description   %shortdesc.attributes;                       >


<!--                    LONG NAME: Container Owner                 -->
<!ENTITY % owner.attributes
             "%univ-atts;
              href 
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
              keyref 
                        CDATA 
                                  #IMPLIED
              type 
                        CDATA 
                                  'owner'"
>
<!ELEMENT owner         (#PCDATA)                                    >
<!ATTLIST owner         %owner.attributes;                           >


<!--                    LONG NAME: Layer Level                     -->
<!ENTITY % layer.content
                        "EMPTY"
>
<!ENTITY % layer.attributes
             "name 
                        CDATA 
                                  'layer' 
              content 
                        (1 | 2 | 3 | 4 | 5 | 6 | 7 | 
                         8 | 9 | 10 | 11 | 12 | 13) 
                                  #REQUIRED
              translate-content
                        CDATA 
                                  'no' 
              %univ-atts;"
>
<!ELEMENT layer         %layer.content;                              >
<!ATTLIST layer         %layer.attributes;                           >


<!--                    LONG NAME: Translation Domain              -->
<!ENTITY % translation-domain.content
                        "EMPTY"
>
<!ENTITY % translation-domain.attributes
             "name 
                        CDATA 
                                  'translation-domain' 
              content 
                        CDATA 
                                  #REQUIRED
              translate-content
                        CDATA 
                                  'no' 
              %univ-atts;"
>
<!ELEMENT translation-domain 
                        %translation-domain.content;                 >
<!ATTLIST translation-domain 
                        %translation-domain.attributes;              >


<!--                    LONG NAME: Keydefs                         -->
<!ENTITY % keydefs.content
                       "((%topicmeta;)?, 
                         (%topicgroup; | %keydef;)* )"
>
<!ENTITY % keydefs.attributes
             "outputclass 
                        CDATA 
                                  #IMPLIED
              %topicref-atts;
              %conref-atts;
              %select-atts;
              %localization-atts;"
>
<!ELEMENT keydefs       %keydefs.content;                            >
<!ATTLIST keydefs       %keydefs.attributes;
                        id        CDATA     "keydefs"                >


<!--                    LONG NAME: ContainerPartRef                -->
<!ENTITY % containerpartref.attributes
                        "%mapref.attributes;"                        >
<!ELEMENT containerpartref    EMPTY                                  >
<!ATTLIST containerpartref    %containerpartref.attributes;          >

<!-- ============================================================= -->
<!--                    SPECIALIZATION ATTRIBUTE DECLARATIONS      -->
<!-- ============================================================= -->


<!ATTLIST container          %global-atts;  class CDATA "- map/map container/container " >
<!ATTLIST containermeta      %global-atts;  class CDATA "- map/topicmeta container/containermeta " >
<!ATTLIST description        %global-atts;  class CDATA "- map/shortdesc container/description " >
<!ATTLIST owner              %global-atts;  class CDATA "- topic/author container/owner " >
<!ATTLIST layer              %global-atts;  class CDATA "- topic/othermeta container/layer " >
<!ATTLIST translation-domain %global-atts;  class CDATA "- topic/othermeta container/translation-domain " >
<!ATTLIST keydefs            %global-atts;  class CDATA "+ map/topicref mapgroup-d/topicgroup container/keydefs " >
<!ATTLIST containerpartref   %global-atts;  class CDATA "- map/topicref mapgroup-d/mapref container/containerpartref " >


<!-- ================== End Container ============================ -->
