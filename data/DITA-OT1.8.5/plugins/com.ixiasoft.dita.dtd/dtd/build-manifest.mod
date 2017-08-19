<!-- ============================================================= -->
<!--                    HEADER                                     -->
<!-- ============================================================= -->
<!--  MODULE:    DITA Build-Manifest                               -->
<!--  VERSION:   1.0                                               -->
<!--  DATE:      November 2014                                     -->
<!--                                                               -->
<!-- ============================================================= -->

<!-- ============================================================= -->
<!--                    PUBLIC DOCUMENT TYPE DEFINITION            -->
<!--                    TYPICAL INVOCATION                         -->
<!--                                                               -->
<!--  Refer to this file by the following public identfier or an 
      appropriate system identifier 
PUBLIC "-//IXIA//ELEMENTS DITA CMS Build Manifest//EN"
      Delivered as file "build-manifest.mod"                       -->

<!-- ============================================================= -->
<!-- SYSTEM:     Darwin Information Typing Architecture (DITA)     -->
<!--                                                               -->
<!-- PURPOSE:    Define elements and specialization necessary      -->
<!--             for build manifests                               -->
<!--                                                               -->
<!-- ORIGINAL CREATION DATE:                                       -->
<!--             September 2014                                    -->
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

<!ENTITY % build-manifest    "build-manifest"                        >
<!ENTITY % globals           "globals"                               >
<!ENTITY % mode              "mode"                                  >
<!ENTITY % locstatusend      "locstatusend"                          >
<!ENTITY % languages         "languages"                             >
<!ENTITY % language          "language"                              >
<!ENTITY % rootcontext       "rootcontext"                           >
<!ENTITY % ditaval           "ditaval"                               >
<!ENTITY % properties        "properties"                            >
<!ENTITY % property          "property"                              >
<!ENTITY % notify            "notify"                                >
<!ENTITY % outputtypes       "outputtypes"                           >
<!ENTITY % outputtype        "outputtype"                            >
<!ENTITY % description       "description"                           >


<!-- ============================================================= -->
<!--                    DOMAINS ATTRIBUTE OVERRIDE                 -->
<!-- ============================================================= -->

<!ENTITY included-domains 
"" 
>

<!-- ============================================================= -->
<!--                    ELEMENT DECLARATIONS                       -->
<!-- ============================================================= -->


<!ELEMENT build-manifest         
                  (%title;,globals,outputtypes)                      >
<!ATTLIST build-manifest
             %arch-atts;
             domains 
                        CDATA 
                                  "&included-domains;" 
             xml:lang   NMTOKEN                          #REQUIRED
             id         ID                               #REQUIRED   >
             
<!ELEMENT globals (%shortdesc;,mode,%locstatusend;,%mapref;,languages,
            rootcontext,ditaval,properties,notify?)                  >

<!ELEMENT mode EMPTY                                                 >
<!ATTLIST mode otherprops (DEBUG|PRODUCTION)  #REQUIRED              >

<!ELEMENT locstatusend (#PCDATA)                                     >
  
<!ELEMENT languages (language+)                                      >

<!ELEMENT language EMPTY                                             >
<!ATTLIST language 
             xml:lang      NMTOKEN    #REQUIRED                      >

<!ELEMENT rootcontext (%mapref;*)                                    >
<!ATTLIST rootcontext 
            xmlns CDATA #FIXED ''
            href CDATA #IMPLIED                                      >

<!ELEMENT ditaval EMPTY                                              >
<!ATTLIST ditaval
            xmlns CDATA #FIXED ''
            href CDATA #IMPLIED                                      >

<!ELEMENT properties (property*)                                     >
<!ATTLIST properties
            xmlns CDATA #IMPLIED 
            id NMTOKEN #REQUIRED                                     >

<!ELEMENT property EMPTY                                             >
<!ATTLIST property
            xmlns CDATA #FIXED ''
            name CDATA #REQUIRED
            content CDATA #REQUIRED                                  >
  
<!ELEMENT notify EMPTY                                               >
<!ATTLIST notify
            xmlns CDATA #FIXED ''
            href CDATA ''                                     
            type CDATA #FIXED 'mailto'                               >

<!ELEMENT outputtypes (outputtype*)                                  >
<!ATTLIST outputtypes
            xmlns CDATA #FIXED ''                                    >

<!ELEMENT outputtype (description,languages?,properties?,ditaval?)   >
<!ATTLIST outputtype
            xmlns CDATA #FIXED ''
            id NMTOKEN #REQUIRED
            type CDATA #IMPLIED
            status (ENABLED|DISABLED) #REQUIRED                      >

<!ELEMENT description  (#PCDATA)                                     >


<!-- ============================================================= -->
<!--                    SPECIALIZATION ATTRIBUTE DECLARATIONS      -->
<!-- ============================================================= -->


<!ATTLIST build-manifest  %global-atts; class CDATA "- map/map build-manifest/build-manifest " >
<!ATTLIST globals         %global-atts; class CDATA "- map/topicmeta build-manifest/topicmeta " >
<!ATTLIST rootcontext     %global-atts; class CDATA "+ map/topicref build-manifest/rootcontext " >
<!ATTLIST ditaval         %global-atts; class CDATA "+ map/topicref build-manifest/ditaval " >
<!ATTLIST properties      %global-atts; class CDATA "- map/topicmeta build-manifest/properties " >
<!ATTLIST property        %global-atts; class CDATA "- topic/othermeta build-manifest/property " >
<!ATTLIST outputtypes     %global-atts; class CDATA "+ map/topicref build-manifest/outputtypes " >
<!ATTLIST outputtype      %global-atts; class CDATA "+ map/topicref build-manifest/outputtype " >
<!ATTLIST description     %global-atts; class CDATA "- map/shortdesc build-manifest/description " >
<!ATTLIST locstatusend    %global-atts; class CDATA "- map/shortdesc build-manifest/locstatusend " >
<!ATTLIST languages       %global-atts; class CDATA "- topic/keywords build-manifest/languages " >
<!ATTLIST language        %global-atts; class CDATA "+ map/topicref build-manifest/language " >
<!ATTLIST mode            %global-atts; class CDATA "- topic/keywords build-manifest/mode " >
<!ATTLIST notify          %global-atts; class CDATA "- topic/author build-manifest/notify " >


<!-- ================== End DITA CMS Build-Manifest ============== -->
