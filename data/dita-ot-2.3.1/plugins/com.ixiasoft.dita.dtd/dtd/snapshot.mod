<?xml version="1.0" encoding="UTF-8"?>
<!-- ============================================================= -->
<!--                    HEADER                                     -->
<!-- ============================================================= -->
<!--  MODULE:    IXIA Snapshot                                     -->
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
    PUBLIC "-//IXIA//ELEMENTS DITA CMS Snapshot//EN"
    Delivered as file "snapshot.mod"                               -->

<!-- ============================================================= -->
<!-- SYSTEM:     Darwin Information Typing Architecture (DITA)     -->
<!--                                                               -->
<!-- PURPOSE:    Declaring the elements and specialization         -->
<!--             attributes for the Snapshots                      -->
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


<!ENTITY % snapshot           "snapshot"                             >
<!ENTITY % snapshotmeta       "snapshotmeta"                         >
<!ENTITY % snapshotref        "snapshotref"                          >
<!ENTITY % manifest           "manifest"                             >


<!-- ============================================================= -->
<!--                    DOMAINS ATTRIBUTE OVERRIDE                 -->
<!-- ============================================================= -->

<!ENTITY included-domains 
"" 
>

<!-- ============================================================= -->
<!--                    ELEMENT DECLARATIONS                       -->
<!-- ============================================================= -->


<!--                    LONG NAME: Snapshot content                -->
<!ENTITY % snapshot.content
            "((%title;)?, 
              (%snapshotmeta;)?, 
              (%manifest;))"
>

<!ELEMENT snapshot   %snapshot.content;                              >
<!ATTLIST snapshot    
              %map.attributes;
              %arch-atts;
              domains 
                        CDATA 
                                  "&included-domains;" 
>

<!--                    LONG NAME: Snapshot Topic Metadata         -->
<!ENTITY % snapshotmeta.content
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
                (%audience;)*, 
                (%category;)*, 
                (%keywords;)*, 
                (%prodinfo;)*, 
                (%othermeta;)*, 
                (%resourceid;)*, 
                (%data.elements.incl; | 
                %foreign.unknown.incl;)*)"
>
<!ELEMENT snapshotmeta    %snapshotmeta.content;                     >
<!ATTLIST snapshotmeta    %topicmeta.attributes;                     >

<!ENTITY % snapshotref.content
				"((%topicmeta;)?, 
                   (%anchor; | 
                   %data.elements.incl; |
                   %navref; | 
                   %snapshotref;)* )"
>

<!ELEMENT snapshotref    %snapshotref.content;                       >
<!ATTLIST snapshotref 	 %topicref.attributes;                       >
             
<!ENTITY % manifest.content
                "((%snapshotref;)*)"
>
<!ELEMENT manifest        %manifest.content;                         >
<!ATTLIST manifest        %topicgroup.attributes;                    >


<!-- ============================================================= -->
<!--                    SPECIALIZATION ATTRIBUTE DECLARATIONS      -->
<!-- ============================================================= -->


<!ATTLIST snapshot            %global-atts; class CDATA "- map/map snapshot/snapshot " >
<!ATTLIST snapshotmeta        %global-atts; class CDATA "- map/topicmeta snapshot/snapshotmeta " >
<!ATTLIST snapshotref         %global-atts; class CDATA "- map/topicref snapshot/snapshotref " >
<!ATTLIST manifest            %global-atts; class CDATA "- mapgroup-d/topicgroup snapshot/manifest " >


<!-- ================== End IXIA Snapshot Domain ================= -->
