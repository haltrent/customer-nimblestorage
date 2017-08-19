<?xml version="1.0" encoding="UTF-8"?>
<!-- ============================================================= -->
<!--                    HEADER                                     -->
<!-- ============================================================= -->
<!--  MODULE:    IXIA Version Tag                                  -->
<!--  VERSION:   1.0                                               -->
<!--  DATE:      July 2015                                         -->
<!--                                                               -->
<!-- ============================================================= -->

<!-- ============================================================= -->
<!--                    PUBLIC DOCUMENT TYPE DEFINITION            -->
<!--                    TYPICAL INVOCATION                         -->
<!--                                                               -->
<!--  Refer to this file by the following public identifier or an 
    appropriate system identifier 
    PUBLIC "-//IXIA//ELEMENTS DITA CMS Version Tag//EN"
    Delivered as file "version-tag.mod"                            -->

<!-- ============================================================= -->
<!-- SYSTEM:     Darwin Information Typing Architecture (DITA)     -->
<!--                                                               -->
<!-- PURPOSE:    Declaring the elements and specialization         -->
<!--             attributes for the Version Tags                   -->
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

<!ENTITY % version-tag        "version-tag"                          >
<!ENTITY % tagmeta            "tagmeta"                              >
<!ENTITY % productdata        "productdata"                          >
<!ENTITY % releaseinfo        "releaseinfo"                          >
<!ENTITY % productinfo        "productinfo"                          >
<!ENTITY % versioninfo        "versioninfo"                          >
<!ENTITY % librarydata        "librarydata"                          >
<!ENTITY % name               "name"                                 >
<!ENTITY % partlist           "partlist"                             >
<!ENTITY % partref            "partref"                              >

<!ENTITY % tagpart            "tagpart"                              >
<!ENTITY % tagpartmeta        "tagpartmeta"                          >

<!-- ============================================================= -->
<!--                    DOMAINS ATTRIBUTE OVERRIDE                 -->
<!-- ============================================================= -->

<!ENTITY included-domains 
"" 
>

<!-- ============================================================= -->
<!--                    ELEMENT DECLARATIONS                       -->
<!-- ============================================================= -->

<!--                LONG NAME: DRM Version Tag content             -->
<!ENTITY % tag.content
            "((%title;)?, 
              (%tagmeta;)?, 
              (%partlist;))"
>

<!ELEMENT version-tag   %tag.content;                                >
<!ATTLIST version-tag    
              %map.attributes;
              %arch-atts;
              domains 
                        CDATA 
                                  "&included-domains;" 
>

<!--                 LONG NAME: DRM Version Tag Topic Metadata     -->
<!ENTITY % tagmeta.content
                "((%navtitle;)?,
                (%linktext;)?, 
                (%searchtitle;)?, 
                (%shortdesc;)?, 
                (%author;)*, 
                (%source;)?, 
                (%publisher;)?, 
                (%copyright;)*, 
                (%critdates;)?, 
                (%permissions;)?, 
                (%metadata;)*,
                (%productdata;),
                (%librarydata;)*,
                (%audience;)*, 
                (%category;)*, 
                (%keywords;)*, 
                (%prodinfo;)*, 
                (%othermeta;)*, 
                (%resourceid;)*, 
                (%data.elements.incl; | 
                %foreign.unknown.incl;)*)"
>
<!ELEMENT tagmeta    %tagmeta.content;                               >
<!ATTLIST tagmeta    %topicmeta.attributes;                          >

<!--                    LONG NAME: DRM PRODUCT Data                -->
<!ENTITY % productdata.content
                       "((%audience;)*, 
                         (%category;)*, 
                         (%keywords;)*,
                         (%prodinfo;)*, 
                         (%productinfo;),
                         (%releaseinfo;),
                         (%versioninfo;),
                         (%othermeta;)*, 
                         (%data.elements.incl; |
                          %foreign.unknown.incl;)*)"
>

<!ELEMENT productdata %productdata.content;                          >
<!ATTLIST productdata %metadata.attributes;                          >


<!--                    LONG NAME: DRM PRODUCT information         -->
<!ENTITY % productinfo.content
                       "((%name;)*,
                         (%vrmlist;)*,
                         (%brand; | 
                          %component; | 
                          %featnum; | 
                          %platform; | 
                          %prognum; | 
                          %series;)* )"
>
<!ELEMENT productinfo %productinfo.content;                          >
<!ATTLIST productinfo %prodinfo.attributes;                          >


<!--                    LONG NAME: DRM Name                        -->
<!ENTITY % name.content
                       "(%words.cnt;)*"
>
<!ELEMENT name %name.content;                                        >
<!ATTLIST name        %prodname.attributes;                          >

<!--                    LONG NAME: DRM RELEASE information         -->
<!ELEMENT releaseinfo %productinfo.content;                          >
<!ATTLIST releaseinfo %prodinfo.attributes;                          >

<!--                    LONG NAME: DRM VERSION information         -->
<!ELEMENT versioninfo %productinfo.content;                          >
<!ATTLIST versioninfo %prodinfo.attributes;                          >

<!--                    LONG NAME: DRM LIBRARY information         -->
<!ELEMENT librarydata %productdata.content;                          >
<!ATTLIST librarydata %metadata.attributes;                          >


<!--                    LONG NAME: DRM Tag Part List               -->
<!ENTITY % partlist.content
                "((%partref;)*)"
>
<!ELEMENT partlist      %partlist.content;                           >
<!ATTLIST partlist      %topicgroup.attributes;                      >

<!--                    LONG NAME: DRM Tag Part                    -->
<!ELEMENT partref        %topicref.content;                          >
<!ATTLIST partref        %topicref.attributes;                       >


<!--                    LONG NAME: DRM Tag part content            -->
<!ENTITY % tagpart.content
            "((%title;)?, 
              (%tagpartmeta;)?, 
              (%manifest;))"
>
<!ELEMENT tagpart   %tagpart.content;                                >
<!ATTLIST tagpart    
              %map.attributes;
              %arch-atts;
              domains 
                        CDATA 
                                  "&included-domains;" 
>

<!--                    LONG NAME: DRM Tag part Topic Metadata     -->
<!ELEMENT tagpartmeta    %snapshotmeta.content;                      >
<!ATTLIST tagpartmeta    %topicmeta.attributes;                      >

<!-- ============================================================= -->
<!--                    SPECIALIZATION ATTRIBUTE DECLARATIONS      -->
<!-- ============================================================= -->

<!ATTLIST version-tag         %global-atts; class CDATA "- map/map snapshot/snapshot version-tag/version-tag " >
<!ATTLIST tagmeta             %global-atts; class CDATA "- map/topicmeta snapshot/snapshotmeta version-tag/tagmeta " >
<!ATTLIST productdata         %global-atts; class CDATA "- topic/metadata version-tag/productdata " >
<!ATTLIST productinfo         %global-atts; class CDATA "- topic/prodinfo version-tag/productinfo " >
<!ATTLIST releaseinfo         %global-atts; class CDATA "- topic/prodinfo version-tag/releaseinfo " >
<!ATTLIST versioninfo         %global-atts; class CDATA "- topic/prodinfo version-tag/versioninfo " >
<!ATTLIST name                %global-atts; class CDATA "- topic/prodname version-tag/name " >
<!ATTLIST librarydata         %global-atts; class CDATA "- topic/metadata version-tag/librarydata " >
<!ATTLIST containerref        %global-atts; class CDATA "- map/topicref snapshot/snapshotref version-tag/containerref " >
<!ATTLIST partlist            %global-atts; class CDATA "- mapgroup-d/topicgroup version-tag/partlist " >
<!ATTLIST partref             %global-atts; class CDATA "- map/topicref version-tag/partref " >

<!ATTLIST tagpart             %global-atts; class CDATA "- map/map snapshot/snapshot tag/tag tagpart/tagpart " >
<!ATTLIST tagpartmeta         %global-atts; class CDATA "- map/topicmeta snapshot/snapshotmeta tagpart/tagpartmeta " >

<!-- ================== End IXIA Version Tag Domain ============== -->
