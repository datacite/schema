---
layout: schema
title: DataCite Metadata Schema for the Publication and Citation of Research Data Version 4.0
authors:
 - jstarr
 - lnielsen
 - jashton
 - abarton
 - aciolek
 - sdietiker
 - jelliott
 - kharzenetter
 - bhirschmann
 - bgenat
 - jmailloux
 - msmaele
 - myahia
 - fziedorn
---

Note that this version of the schema is not backward compatible with previous schema versions. DataCite will provide ongoing support for the use of previous schema versions for a minimum of one year after the release of this version.

# Introduction

## The DataCite Consortium

Scholarly research is producing ever increasing amounts of digital research data, and it depends on data to verify research findings, create new research, and share findings. In this context, what has been missing until recently, is a *persistent* approach to access, identification, sharing, and re-use of datasets. To address this need, the [DataCite](http://www.datacite.org) international consortium was founded in late 2009 with these three fundamental goals:

* establish easier access to scientific research data on the Internet,
* increase acceptance of research data as legitimate, citable contributions to the scientific record, and
* support data archiving that will permit results to be verified and re-purposed for future study.

Since its founding in 2009, DataCite has grown and now spans the globe from Europe and North America to Asia and Australia. The aim of DataCite is to provide domain agnostic services to benefit scholars in a wide range of disciplines.

Key to the DataCite service is the concept of a long term or *persistent identifier*. A persistent identifier is an association between a character string and a resource. Resources can be files, parts of files, persons, organizations, abstractions, etc. DataCite uses *Digital Object Identifiers* (DOIs) (NOTE:  DOIs are administered by the International DOI Foundation, http://www.doi.org/ ) at the present time and is considering the use of other identifier schemes in the future. For this reason, the Metadata Schema has been designed with flexibility and extensibility in mind.

## DataCite Community Participation

The Metadata Working Group would like to acknowledge the contributions to our work of many colleagues in our institutions who provided assistance of all kinds. Their help has been greatly appreciated. In addition, we are indebted to numerous individuals and organizations in the broader scholarly community who have taken an interest in this work. Because data citation and data management are evolving areas of concern, we look forward to continued interest. With this in mind, the Working Group provides an interactive discussion mechanism for DataCite members and clients to discuss the DataCite Metadata Schema and issues connected with metadata submitted to DataCite, as appropriate (NOTE:  Join the discussion here: schema.datacite.org.).

## The Metadata Schema

The DataCite Metadata Schema is a list of core metadata properties chosen for the accurate and consistent identification of a resource for citation and retrieval purposes, along with recommended use instructions. The resource that is being identified can be of any kind, but it is typically a dataset. We use the term ‘dataset’ in its broadest sense. We mean it to include not only numerical data, but any other research data outputs. The metadata schema properties are presented and described in detail in [Section 2](#heading=h.tyjcwt)[.](#heading=h.tyjcwt)

In this release of the metadata schema, there are some larger changes. The most significant of these is that the resourceTypeGeneral property is now required. This change has been made in order to promote interoperability with DataCite partners such as ORCID, which in turn enhances the discoverability of the research objects registered in the DataCite Metadata Store.

The second major change is the addition of a new optional property to improve support for grant and funder information. The new property is called fundingReference, and it has subproperties for the funder name,  award, and award information. This also means that the contributorType of "funder" is now deprecated.

Note that the two changes mentioned above are not backward compatible with previous schema versions. DataCite will provide ongoing support for the use of previous schema versions for a minimum of one year after the release of this version.

A third significant change included in this release is support for the optional provision of family name and given name along with creatorName.  We are introducing these subproperties in order to promote interoperability with ORCID and, generally, to provide the ability to generate citation-ready author names.

The remainder of the 4.0 changes are in response to requests from DataCite community members, clients like you that have used the metadata schema and have imagined ways in which it might work better for their particular use case. We are indebted to everyone who has provided us with their feedback, allowing us to improve our service for the broader DataCite community.

For a specified list of all changes, see [Section 1.4](#heading=h.2et92p0)[.](#heading=h.2et92p0)

Lastly, in order to support openness and future extensibility of the schema, a collaboration between DataCite and the Dublin Core Metadata Initiative (DCMI) Science and Metadata Community (SAM) (NOTE:  For more information on DCMI SAM, see http://wiki.dublincore.org/index.php/DCMI_Science_And_Metadata. ) has produced a version of the v3.1 schema in a Dublin Core Application Profile format which is currently out for review and comment via a dedicated Google forum (NOTE:  The Application Profile forum is available here: https://groups.google.com/a/datacite.org/forum/#!forum/dc2map ). The profile is made available in conjunction with the Metadata Working Group’s DataCite in RDF work which is also nearing completion.

## Version 4.0 Update

Version 4.0 of the schema includes these changes:

* Allowing more than one nameIdentifier per creator or contributor
* Add new optional subproperties for creatorName
  * familyName
  * givenName
* Add new titleType "Other"
* Add new subproperty for subjectScheme
  * subjectScheme
    * valueURI
* Changing resourceTypeGeneral from optional to mandatory
* Addition of a new resourceTypeGeneral option "Catalog"
* Addition of a new relatedIdentifierType option "IGSN"
* Addition of a new relationType pair "HasMember, IsMemberOf" in support of the Catalog resourceType
* Addition of a  new descriptionType "TechnicalInfo"
* Addition of a new subproperty for GeoLocation "geoLocationPolygon"
* Addition of a new property: FundingReference, with subproperties
  * funderName
  * funderIdentifier
  * funderIdentifierType
  * awardNumber
  * awardURI
* Deprecate contributorType "funder" (as a result of adding the new property “FundingReference”)

Version 4.0 of the documentation includes these changes:

* Correction of an error in the description of GeoLocation box (See property 18.2)
* Provision of a guideline regarding how to write the ORCID ID (See property 2.2.1 nameIdentifierScheme)
* Adjustment of the instructions for resourceTypeGeneral option "collection" (See Appendix 1, Table 7)

# DataCite Metadata Properties

## Overview

The properties of the DataCite Metadata Schema are presented in this section. More detailed descriptions of the properties, and their related sub-properties, are provided in [Section](#heading=h.17dp8vu)[ 2.3.](#heading=h.17dp8vu)

There are three different levels of obligation for the metadata properties:

* **Mandatory (M) **properties ** ***must* be provided,
* **Recommended (R )** properties are optional, but strongly recommended for interoperability and
* **Optional (O)** properties are optional and provide richer description.

**Those clients**** who wish to enhance the prospects that their metadata will be found, cited and linked to original research are strongly encouraged to submit the Recommended as well as Mandatory set of properties.** Together, the Mandatory and Recommended set of properties and their sub-properties are especially valuable to information seekers and added-service providers, such as indexers. The Metadata Working Group members strongly urge the inclusion of metadata identified as Recommended for the purpose of achieving greater exposure for the resource’s metadata record, and therefore, the underlying research itself.

The properties listed in [Table 1](#heading=h.1t3h5sf)[ ](#heading=h.1t3h5sf)have the obligation level Mandatory, and *must be* supplied when submitting DataCite metadata. The properties listed in [Table 2](#heading=h.4d34og8)[ ](#heading=h.4d34og8)have one of the obligation levels Recommended or Optional, and *may be* supplied when submitting DataCite metadata.

In Tables 1 and 2, the combined Mandatory and Recommended "super set" of properties and sub-properties that enhance the prospect that the resource’s metadata will be found, cited and linked is indicated by shading, as shown in the example below.

*Example of shading*

<table>
  <tr>
    <td>ID </td>
    <td>DataCite-Property</td>
    <td>Occ</td>
    <td>Definition</td>
    <td>Allowed values, examples, other constraints</td>
  </tr>
  <tr>
    <td>6 </td>
    <td>Subject</td>
    <td>0-n</td>
    <td>Subject, keyword, classification code, or key phrase describing the resource.</td>
    <td>Free text. </td>
  </tr>
</table>


Of the Recommended set of properties, the most important to use is the **Description** property, together with the Recommended sub-properties descriptionType ="Abstract” (see [Section 2.3](#heading=h.17dp8vu)[)](#heading=h.17dp8vu). Appendix 1 includes detailed descriptions of controlled list values, using the same shading to indicate those values that are especially important for information seekers and added-service providers. It cannot be emphasized enough how valuable an Abstract is to other scholars in finding the resource and then determining whether or not the resource, once found, is worth investigating further, re-using or validating.

Table 1: DataCite Mandatory Properties

----------------------------------------------------------------------------
ID Property                                                       Obligation
-- -------------------------------------------------------------- ----------
 1 Identifier (with type sub-property)                            M

 2 Creator (with name identifier and affiliation sub-properties)  M

 3 Title (with optional type sub-properties)                      M

 4 Publisher                                                      M

 5 PublicationYear                                                M

10 ResourceType (with general type description sub-property)      M
----------------------------------------------------------------------------


Table 2: DataCite Recommended and Optional Properties

<table>
  <tr>
    <td>ID</td>
    <td>Property</td>
    <td>Obligation</td>
  </tr>
  <tr>
    <td>6</td>
    <td>Subject (with scheme sub-property)</td>
    <td>R</td>
  </tr>
  <tr>
    <td>7</td>
    <td>Contributor (with type, name identifier, and affiliation sub-properties)</td>
    <td>R</td>
  </tr>
  <tr>
    <td>8</td>
    <td>Date (with type sub-property)</td>
    <td>R</td>
  </tr>
  <tr>
    <td>9</td>
    <td>Language </td>
    <td>O</td>
  </tr>
  <tr>
    <td>11</td>
    <td>AlternateIdentifier (with type sub-property)</td>
    <td>O</td>
  </tr>
  <tr>
    <td>12</td>
    <td>RelatedIdentifier (with type and relation type sub-properties)</td>
    <td>R</td>
  </tr>
  <tr>
    <td>13</td>
    <td>Size </td>
    <td>O</td>
  </tr>
  <tr>
    <td>14</td>
    <td>Format </td>
    <td>O</td>
  </tr>
  <tr>
    <td>15</td>
    <td>Version </td>
    <td>O</td>
  </tr>
  <tr>
    <td>16</td>
    <td>Rights </td>
    <td>O</td>
  </tr>
  <tr>
    <td>17</td>
    <td>Description (with type sub-property)</td>
    <td>R</td>
  </tr>
  <tr>
    <td>18</td>
    <td>GeoLocation (with point, box and polygon sub-properties)</td>
    <td>R</td>
  </tr>
  <tr>
    <td>19</td>
    <td>FundingReference (with name, identifier, and award related sub-properties)</td>
    <td>O</td>
  </tr>
</table>

## Citation

Because many users of this schema are members of a variety of academic disciplines, DataCite remains discipline-agnostic concerning matters pertaining to academic style sheet requirements. Therefore, DataCite encourages rather than requires a particular citation format (NOTE:  In collaboration with CrossRef, DataCite has created a DOI Citation Formatter Service available at http://crosscite.org/citeproc/. The user can choose from more than 500 different citation formats in 45 different languages.). In keeping with this approach, the following is the *preferred *format for rendering a DataCite citation for human readers using the first five properties of the schema:

> Creator (PublicationYear): Title. Publisher. Identifier 

It may also be desirable to include information from two optional properties, Version and ResourceType (as appropriate). If so, the preferred form is as follows:

> Creator (PublicationYear): Title. Version. Publisher. ResourceType. Identifier

For citation purposes, DataCite prefers that DOI names are displayed as linkable, permanent URLs. The Identifier may appear in its original format. If the original format is chosen, be sure to include the characters "doi:" pre-pended to the Identifier as in “doi:10.1234/abc."

For resources that do not have a standard publication year value, DataCite suggests that PublicationYear should include the date that would be preferred for use in a citation.

Here are several examples:

* Irino, T; Tada, R (2009): Chemical and mineral compositions of sediments from ODP Site 127-797. V. 2.1. Geological Institute, University of Tokyo. [http://dx.doi.org/10.1594/PANGAEA.726855 ](http://dx.doi.org/10.1594/PANGAEA.726855)
* Geofon operator (2009): GEFON event gfz2009kciu (NW Balkan Region). GeoForschungsZentrum Potsdam (GFZ). [http://dx.doi.org/10.1594/GFZ.GEOFON.gfz2009kciu](http://dx.doi.org/10.1594/GFZ.GEOFON.gfz2009kciu)
* Denhard, Michael (2009): dphase_mpeps: MicroPEPS LAF-Ensemble run by DWD for the MAP D-PHASE project. World Data Center for Climate. Dataset. [http://dx.doi.org/10.1594/WDCC/dphase_mpeps](http://dx.doi.org/10.1594/WDCC/dphase_mpeps)

*A special note regarding citation of dynamic datasets*:

For datasets that are continuously and rapidly updated, there are special challenges both in citation and preservation. For citation, three approaches are possible:

1. Cite a specific slice (the set of updates to the dataset made during a particular period of time or to a particular area of the dataset);
2. Cite a specific snap shot (a copy of the entire dataset made at a specific time);
3. Cite the continuously updated dataset, but add an Access Date and Time to the citation.

Note that a "slice" and “snap shot” are versions of the dataset and require unique identifiers. The third option is controversial, because it necessarily means that following the citation does not result in observation of the resource as cited.

## DataCite Properties

Table 3 provides a detailed description of the mandatory properties, together with their sub-properties, which *must* be supplied with any initial metadata submission to the managing agent for DataCite. **If one of the required properties is unavailable**, please use one of the standard (machine-recognizable) codes listed in Appendix 3, [Table 11](#heading=h.49x2ik5)[.](#heading=h.49x2ik5) In [Table 4](#heading=h.lnxbz9)[,](#heading=h.lnxbz9) the Recommended and Optional properties are described in detail. For an example of how to make a submission in XML format, please see the [XML Examples](http://schema.datacite.org/meta/kernel-3/) provided on the DataCite Metadata Schema Repository (NOTE:  http://schema.datacite.org/ ) website.

Throughout this document, a naming convention has been used for all properties and sub-properties as follows:  properties begin with a capital letter, whereas sub-properties begin with a lower case letter. If the name is a compound of more than one word, subsequent words begin with capital letters.

As with [Tables 1](#heading=h.1t3h5sf)[ ](#heading=h.1t3h5sf)and [2,](#heading=h.4d34og8) [Tables 3](#heading=h.3rdcrjn)[ ](#heading=h.3rdcrjn)and [4 ](#heading=h.lnxbz9)use shading to identify the combined Mandatory and Recommended "super set" of properties and sub-properties that enhance the prospect that the resource’s metadata will be found, cited and linked.

The third column, Occurrence (Occ), indicates cardinality/quantity constraints for the properties as follows:

0-n = optional and repeatable

0-1 = optional, but not repeatable

1-n = required and repeatable

1 = required, but not repeatable

NOTE:

XML provides an xml:lang attribute (NOTE:  Allowed values IETF BCP 47, ISO 639-1 language codes, e.g. en, de, fr) that can be used on the properties Title, Subject and Description. This provides a way to describe the language used for the content of the specified properties. The schema provides a Language property to be used to describe the language of the resource.

**Table 3: Expanded DataCite Mandatory Properties**

<table>
  <tr>
    <td>ID </td>
    <td>DataCite-Property</td>
    <td>Occ</td>
    <td>Definition</td>
    <td>Allowed values, examples, other constraints</td>
  </tr>
  <tr>
    <td>1</td>
    <td>Identifier</td>
    <td>1</td>
    <td>The Identifier is a unique string that identifies a resource. </td>
    <td>DOI (Digital Object Identifier) registered by a DataCite member. Format should be "10.1234/foo"</td>
  </tr>
  <tr>
    <td>1.1</td>
    <td>identifierType</td>
    <td>1</td>
    <td>The type of the Identifier.</td>
    <td>Controlled List Value:
DOI</td>
  </tr>
  <tr>
    <td>2</td>
    <td>Creator</td>
    <td>1-n</td>
    <td>The main researchers involved in producing the data, or the authors of the publication, in priority order.</td>
    <td>May be a corporate/institutional or personal name. Note: DataCite infrastructure supports up to between 8000-10000 names. For name lists above that size, consider attribution via linking to the related metadata.</td>
  </tr>
  <tr>
    <td>2.1</td>
    <td>creatorName</td>
    <td>1</td>
    <td>The name of the creator.</td>
    <td>Examples: Charpy, Antoine; Jemison, Mae
The personal name format should be: family, given. Non-roman names may be transliterated according to the ALA-LC schemes.</td>
  </tr>
  <tr>
    <td>2.1.1</td>
    <td>familyName</td>
    <td>0-1</td>
    <td>The surname or last name of the creator.</td>
    <td>Examples based on the 2.1 names: Charpy; Jemison</td>
  </tr>
  <tr>
    <td>2.1.2</td>
    <td>givenName</td>
    <td>0-1</td>
    <td>The personal or first name of the creator.</td>
    <td>Examples based on the 2.1 names: Antoine; Mae</td>
  </tr>
  <tr>
    <td>2.2</td>
    <td>nameIdentifier</td>
    <td>0-n</td>
    <td>Uniquely identifies an individual or legal entity, according to various schemes.</td>
    <td>The format is dependent upon scheme.</td>
  </tr>
  <tr>
    <td>2.2.1</td>
    <td>nameIdentifierScheme</td>
    <td>1</td>
    <td>The name of the name identifier scheme.</td>
    <td>If nameIdentifier is used, nameIdentifierScheme is mandatory.
Examples:  ORCID, ISNI,</td>
  </tr>
  <tr>
    <td>2.2.2</td>
    <td>schemeURI</td>
    <td>0-1</td>
    <td>The URI of the name identifier scheme.</td>
    <td>Examples:
http://www.isni.org http://orcid.org </td>
  </tr>
  <tr>
    <td>2.3</td>
    <td>affiliation</td>
    <td>0-n</td>
    <td>The organizational or institutional affiliation of the creator.</td>
    <td>Free text.</td>
  </tr>
  <tr>
    <td>3</td>
    <td>Title</td>
    <td>1-n</td>
    <td>A name or title by which a resource is known.</td>
    <td>Free text.
</td>
  </tr>
  <tr>
    <td>3.1</td>
    <td>titleType</td>
    <td>0-1</td>
    <td>The type of Title. </td>
    <td>Controlled List Values:
AlternativeTitle
Subtitle
TranslatedTitle
Other</td>
  </tr>
  <tr>
    <td>4</td>
    <td>Publisher</td>
    <td>1</td>
    <td>The name of the entity that holds, archives, publishes prints, distributes, releases, issues, or produces the resource. This property will be used to formulate the citation, so consider the prominence of the role.</td>
    <td>Examples: World Data Center for Climate (WDCC); GeoForschungsZentrum Potsdam (GFZ); Geological Institute, University of Tokyo </td>
  </tr>
  <tr>
    <td>5</td>
    <td>PublicationYear</td>
    <td>1</td>
    <td>The year when the data was or will be made publicly available. </td>
    <td>YYYY
***
If an embargo period has been in effect, use the date when the embargo period ends.
In the case of datasets, "publish" is understood to mean making the data available on a specific date to the community of researchers.
If there is no standard publication year value, use the date that would be preferred from a citation perspective.</td>
  </tr>
</table>


*PublicationYear—Additional guidance*

PublicationYear : the year when the data was or will be made publicly available. In the case of datasets, "publish" is understood to mean making the data available on a specific date to the community of researchers.

* If that date cannot be determined, use the date of registration.
* If an embargo period has been in effect, use the date when the embargo period ends.
* If there is no standard publication year value, use the date that would be preferred from a citation perspective.

*In the case of a digitized version of a physical object*

If the DOI is being used to identify a digitised version of an original item, the recommended approach is to supply the PublicationYear for the digital version and not the original object.

The Title field may be used to convey the approximate or known date of the original object. Other metadata properties available for additional date information about the object include: Subject and Description. However, only Title will be part of the citation.

Here are two examples of citations using dates or date information in the titles.

Shaked, Edith; (2015): Map by the German military, dated January 20, 1942 - date of the Wannsee Conference; Unpublished. [http://dx.doi.org/10.13140/RG.2.1.4448.8405](http://dx.doi.org/10.13140/RG.2.1.4448.8405)

Ryan, Michael W; (1991): Political change in an ancient Mesoamerican community : Kaminaljuyu within the Valley of Guatemala (500 B.C. - A.D. 1000); University of British Columbia. [http://dx.doi.org/10.14288/1.0100742](http://dx.doi.org/10.14288/1.0100742)

*Guidance for handling missing mandatory property values*

If the completion of any of the mandatory properties presents a difficulty, use of standard machine-recognizable codes is strongly advised. A set of the codes is provided in Appendix 3, [Table 11](#heading=h.49x2ik5)[.](#heading=h.49x2ik5) However, we recommend that you consider the resulting effect on the citation created from the metadata provided.

Here is an example of a citation that uses machine-readable substitutions for all but one of the required metadata properties. Obviously the more metadata that is supplied, the more information is conveyed. Note that is a demonstration DOI and not an actual identifier, so the link will not work.

(:unkn)(9999):(:none).(:null).Dataset. [http://dx.doi.org/10.5072/FK2JW8C992](http://dx.doi.org/10.5072/FK2JW8C992)

**Table 4: Expanded DataCite Recommended and Optional Properties**

<table>
  <tr>
    <td>ID</td>
    <td>DataCite-Property</td>
    <td>Occ</td>
    <td>Definition</td>
    <td>Allowed values, examples, other constraints</td>
  </tr>
  <tr>
    <td>6 </td>
    <td>Subject</td>
    <td>0-n</td>
    <td>Subject, keyword, classification code, or key phrase describing the resource.</td>
    <td>Free text. </td>
  </tr>
  <tr>
    <td>6.1</td>
    <td>subjectScheme</td>
    <td>0-1</td>
    <td>The name of the subject scheme or classification code or authority if one is used.</td>
    <td>Free text.</td>
  </tr>
  <tr>
    <td>6.2</td>
    <td>schemeURI</td>
    <td>0-1</td>
    <td>The URI of the subject identifier scheme.</td>
    <td>Examples:
http://id.loc.gov/authorities/subjects

http://udcdata.info/ </td>
  </tr>
  <tr>
    <td>6.3</td>
    <td>valueURI</td>
    <td>0-1</td>
    <td>The URI of the subject term.</td>
    <td>Example(s)
http://id.loc.gov/authorities/subjects/sh85026196
http://udcdata.info/037278 </td>
  </tr>
  <tr>
    <td>7</td>
    <td>Contributor </td>
    <td>0-n</td>
    <td>The institution or person responsible for collecting, managing, distributing, or otherwise contributing to the development of the resource. </td>
    <td>Note: DataCite infrastructure supports up to between 8000-10000 names. For name lists above that size, consider attribution via linking to the related metadata.</td>
  </tr>
  <tr>
    <td>7.1
</td>
    <td>contributorType </td>
    <td>1</td>
    <td>The type of contributor of the resource. </td>
    <td>If Contributor is used, then contributorType is mandatory.
Controlled List Values:
ContactPerson
DataCollector
DataCurator
DataManager
Distributor
Editor
HostingInstitution
Producer
ProjectLeader
ProjectManager
ProjectMember
RegistrationAgency
RegistrationAuthority
RelatedPerson
Researcher
ResearchGroup
RightsHolder
Sponsor
Supervisor
WorkPackageLeader
Other

See appendix for definitions.</td>
  </tr>
  <tr>
    <td>7.2</td>
    <td>contributorName</td>
    <td>1</td>
    <td>The name of the contributor.</td>
    <td>If Contributor is used, then contributorName is mandatory.
Examples: Patel, Emily; Nyugen, John
The personal name format may be: family, given.  Non-roman names should be transliterated according to the ALA-LC schemes.</td>
  </tr>
  <tr>
    <td>7.3</td>
    <td>nameIdentifier</td>
    <td>0-1</td>
    <td>Uniquely identifies an individual or legal entity, according to various schemes.</td>
    <td>The format is dependent upon scheme.</td>
  </tr>
  <tr>
    <td>7.3.1</td>
    <td>nameIdentifierScheme</td>
    <td>1</td>
    <td>The name of the name identifier scheme.</td>
    <td>If nameIdentifier is used, nameIdentifierScheme is mandatory.
Examples:ORCID, ISNI, FundRef</td>
  </tr>
  <tr>
    <td>7.3.2</td>
    <td>schemeURI</td>
    <td>0-1</td>
    <td>The URI of the name identifier scheme.</td>
    <td>Examples: http://www.isni.org  http://orcid.org
http://www.crossref.org/fundref/</td>
  </tr>
  <tr>
    <td>7.4</td>
    <td>affiliation</td>
    <td>0-n</td>
    <td>The organizational or institutional affiliation of the contributor.</td>
    <td>Free text.</td>
  </tr>
  <tr>
    <td>8 </td>
    <td>Date </td>
    <td>0-n</td>
    <td>Different dates relevant to the work. </td>
    <td>YYYY,YYYY-MM-DD, YYYY-MM-DDThh:mm:ssTZD or any other format or level of granularity described in W3CDTF. Use RKMS-ISO8601 standard for depicting date ranges.
Example: 2004-03-02/2005-06-02</td>
  </tr>
  <tr>
    <td>8.1 </td>
    <td>dateType </td>
    <td>1</td>
    <td>The type of date. </td>
    <td>If Date is used, dateType is mandatory.
Controlled List Values:
Accepted
Available
Copyrighted
Collected
Created
Issued
Submitted
Updated
Valid
See appendix for definitions and recommendations.</td>
  </tr>
  <tr>
    <td>9 </td>
    <td>Language </td>
    <td>0-1</td>
    <td>The primary language of the resource. </td>
    <td>Allowed values are taken from IETF BCP 47, ISO 639-1 language codes.
Examples: en, de, fr</td>
  </tr>
  <tr>
    <td>10</td>
    <td>ResourceType </td>
    <td>1</td>
    <td>A description of the resource.</td>
    <td>The format is open, but the preferred format is a single term of some detail so that a pair can be formed with the sub-property.
Text formats can be free-text OR terms from the CASRAI Publications resource type list.
***
Examples:
Dataset/Census Data, where 'Dataset' is resourceTypeGeneral value and 'Census Data' is ResourceType value.
Text/Conference Abstract, where 'Text' is resourceTypeGeneral value and 'Conference Abstract' is resourceType value aligned with CASRAI Publications term.</td>
  </tr>
  <tr>
    <td>10.1</td>
    <td>resourceTypeGeneral</td>
    <td>1</td>
    <td>The general type of a resource.</td>
    <td>Controlled List Values:
Audiovisual
Catalog
Collection
Dataset
Event
Image
InteractiveResource
Model
PhysicalObject
Service
Software
Sound
Text
Workflow
Other

See appendix for definitions and examples.</td>
  </tr>
  <tr>
    <td>11 </td>
    <td>AlternateIdentifier </td>
    <td>0-n</td>
    <td>An identifier or identifiers other than the primary Identifier applied to the resource being registered. This may be any alphanumeric string which is unique within its domain of issue. May be used for local identifiers. AlternateIdentifier should be used for another identifier of the same instance (same location, same file).</td>
    <td>Free text.
***
Example:
E-GEOD-34814</td>
  </tr>
  <tr>
    <td>11.1 </td>
    <td>alternateIdentifierType
</td>
    <td>1</td>
    <td>The type of the AlternateIdentifier. </td>
    <td>Free text.
***
If AlternateIdentifier is used, alternateIdentifierType is mandatory. For the above example, the alternateIdentifierType would be "A local accession number"</td>
  </tr>
  <tr>
    <td>12
</td>
    <td>RelatedIdentifier
</td>
    <td>0-n</td>
    <td>Identifiers of related resources. These must be globally unique identifiers.</td>
    <td>Free text.
***
Use this property to indicate subsets of properties, as appropriate.</td>
  </tr>
  <tr>
    <td>12.1 </td>
    <td>relatedIdentifierType </td>
    <td>1</td>
    <td>The type of the RelatedIdentifier </td>
    <td>If RelatedIdentifier is used, relatedIdentifierType is mandatory.
Controlled List Values:
ARK
arXiv
bibcode
DOI
EAN13
EISSN
Handle
IGSN
ISBN
ISSN
ISTC
LISSN
LSID
PMID
PURL
UPC
URL
URN

See appendix for full names and examples.</td>
  </tr>
  <tr>
    <td>12.2
</td>
    <td>relationType
</td>
    <td>1</td>
    <td>Description of the relationship of the resource being registered (A) and the related resource (B).</td>
    <td>If RelatedIdentifier is used, relationType is mandatory.
Controlled List Values:
IsCitedBy
Cites
IsSupplementTo
IsSupplementedBy
IsContinuedBy
Continues
HasMember
IsMemberOf
HasMetadata
IsMetadataFor
IsNewVersionOf
IsPreviousVersionOf
IsPartOf
HasPart
IsReferencedBy
References
IsDocumentedBy
Documents
IsCompiledBy
Compiles
IsVariantFormOf
IsOriginalFormOf
IsIdenticalTo
IsReviewedBy
Reviews
IsDerivedFrom
IsSourceOf

See appendix for definitions, examples and usage notes.</td>
  </tr>
  <tr>
    <td>12.3</td>
    <td>relatedMetadataScheme</td>
    <td>0-1</td>
    <td>The name of the scheme.</td>
    <td>Use only with this relation pair:
(HasMetadata/
IsMetadataFor)</td>
  </tr>
  <tr>
    <td>12.4</td>
    <td>schemeURI</td>
    <td>0-1</td>
    <td>The URI of the relatedMetadataScheme.</td>
    <td>Use only with this relation pair:
(HasMetadata/
IsMetadataFor)</td>
  </tr>
  <tr>
    <td>12.5</td>
    <td>schemeType</td>
    <td>0-1</td>
    <td>The type of the relatedMetadataScheme, linked with the schemeURI.</td>
    <td>Use only with this relation pair:
(HasMetadata/
IsMetadataFor)
Examples: XSD, DDT, Turtle</td>
  </tr>
  <tr>
    <td>13 </td>
    <td>Size </td>
    <td>0-n</td>
    <td>Unstructured size information about the resource.</td>
    <td>Free text.
***
Examples: "15 pages", "6 MB"</td>
  </tr>
  <tr>
    <td>14 </td>
    <td>Format </td>
    <td>0-n</td>
    <td>Technical format of the resource. </td>
    <td>Free text.
***
Use file extension or MIME type where possible, e.g., PDF, XML, MPG or application/pdf, text/xml, video/mpeg. </td>
  </tr>
  <tr>
    <td>15
</td>
    <td>Version
</td>
    <td>0-1</td>
    <td>The version number of the resource. </td>
    <td>Suggested practice: track major_version.minor_version.
Register a new identifier for a major version change. Individual stewards need to determine which are major vs. minor versions.
May be used in conjunction with properties 11 and 12 (AlternateIdentifier and RelatedIdentifier) to indicate various information updates.
May be used in conjunction with property 17 (Description) to indicate the nature and file/record range of version.</td>
  </tr>
  <tr>
    <td>16
</td>
    <td>Rights </td>
    <td>0-n</td>
    <td>Any rights information for this resource. </td>
    <td>Free text.
***
Provide a rights management statement for the resource or reference a service providing such information. Include embargo information if applicable.
Use the complete title of a license and include version information if applicable.
Example:
Creative Commons Attribution 3.0 Germany License</td>
  </tr>
  <tr>
    <td>16.1</td>
    <td>rightsURI</td>
    <td>0-1</td>
    <td>The URI of the license.</td>
    <td>Example:
http://creativecommons.org/licenses/by/3.0/de/deed.en</td>
  </tr>
  <tr>
    <td>17
</td>
    <td>Description </td>
    <td>0-n</td>
    <td>All additional information that does not fit in any of the other categories. May be used for technical information. </td>
    <td>The format is open
***
It is a best practice to supply a description.</td>
  </tr>
  <tr>
    <td>17.1 </td>
    <td>descriptionType </td>
    <td>1</td>
    <td>The type of the Description. </td>
    <td>If Description is used, descriptionType is mandatory.

Controlled List Values:
Abstract
Methods
SeriesInformation
TableOfContents
TechnicalInfo
Other
See appendix for definitions.</td>
  </tr>
  <tr>
    <td>18</td>
    <td>GeoLocation</td>
    <td>0-n</td>
    <td>Spatial region or named place where the data was gathered or about which the data is focused.</td>
    <td>Repeat this property to indicate several different locations.</td>
  </tr>
  <tr>
    <td>18.1</td>
    <td>geoLocationPoint</td>
    <td>0-1</td>
    <td>A point location in space.
</td>
    <td>A point contains a single latitude-longitude pair, separated by whitespace.
Detailed usage instructions21
Example:
<geoLocationPoint>
31.233 -67.302 </geoLocationPoint></td>
  </tr>
  <tr>
    <td>18.2</td>
    <td>geoLocationBox</td>
    <td>0-1</td>
    <td>The spatial limits of a place.</td>
    <td>A box contains two white space separated latitude-longitude pairs, with each pair separated by whitespace. The first pair is the lower corner (normally south west), the second is the upper corner (normally north east).
Detailed usage instructions
Example:
<geoLocationBox>
41.090 -71.032  42.893 -68.211 </geoLocationBox></td>
  </tr>
  <tr>
    <td>18.3</td>
    <td>geoLocationPlace</td>
    <td>0-1</td>
    <td>Description of a geographic location </td>
    <td>Free text. Use to describe a geographic location.</td>
  </tr>
  <tr>
    <td>18.4</td>
    <td>geoLocationPolygon</td>
    <td>0-1</td>
    <td>A drawn polygon area, defined by a set of points and lines connecting the points in a closed chain.</td>
    <td>A polygon contains points, longitude-latitude pairs, separated by whitespace. Each point is separated by a comma. The first point should be the same as the last point.
Example:
<geoLocationPolygon> -77.089005 38.913574,-77.029953 38.913574,-77.029953 38.886321,-77.089005 38.886321,-77.089005 38.913574 </geoLocationPolygon></td>
  </tr>
  <tr>
    <td>19</td>
    <td>FundingReference</td>
    <td>0-n</td>
    <td>Information about financial support (funding) for the resource being registered.</td>
    <td>It is a best practice to supply a funding information when financial support has been received.</td>
  </tr>
  <tr>
    <td>19.1</td>
    <td>funderName</td>
    <td>1</td>
    <td>Name of the funding provider.</td>
    <td>Example: Gordon and Betty Moore Foundation</td>
  </tr>
  <tr>
    <td>19.2</td>
    <td>funderIdentifier</td>
    <td>0-1</td>
    <td>Uniquely identifies a funding entity, according to various types.</td>
    <td>Example: http://dx.doi.org/10.13039/100000936</td>
  </tr>
  <tr>
    <td>19.2.1</td>
    <td>funderIdentifierType</td>
    <td>0-1</td>
    <td>The type of the funderIdentifier </td>
    <td>ISNI
GRID
CrossRef Funder
Other</td>
  </tr>
  <tr>
    <td>19.3</td>
    <td>awardNumber</td>
    <td>0-1</td>
    <td>The code assigned by the funder to a sponsored award.</td>
    <td>Example:
GBMF3859.01</td>
  </tr>
  <tr>
    <td>19.4</td>
    <td>awardURI</td>
    <td>0-1</td>
    <td>The URI leading to a page provided by the funder for more information about the award.</td>
    <td>Example:
https://www.moore.org/grants/list/GBMF3859.01</td>
  </tr>
</table>


1. XML Example

Examples for various resource types and special cases can be found at [http://schema.datacite.org/meta/kernel-4/index.html](http://schema.datacite.org/meta/kernel-4/index.html).

2. XML Schema

The XML Schema is available here:

[http://schema.datacite.org/meta/kernel-4/metadata.xsd](http://schema.datacite.org/meta/kernel-4/metadata.xsd)

doi:10.5438/0013

Note that the schema and this documentation will always have the same version number.

Each subsequent version of the schema will be at this same location using an address composed in the same manner, that is: [http://schema.datacite.org/meta/kernel-versionnumber/metadata.xsd](http://schema.datacite.org/meta/kernel-versionnumber/metadata.xsd).

Earlier versions will continue to be available at their previous locations for backward compatibility.

3. **Other DataCite Services**

For information about other DataCite services that pertain to DataCite metadata records, including the Metadata Store, Metadata Search and Content Negotiation, please see DataCite’s Service page at [http://www.datacite.org/services](http://www.datacite.org/services).

# Appendices

# Appendix 1: Controlled List Definitions

In Appendix 1, as in Sections 2.1 and 2.3 above, controlled list values that enhance the prospect that the resource’s metadata will be found, cited and linked are indicated by shading.

**contributorType**

**Table 5: Description of contributorType**

<table>
  <tr>
    <td>Option</td>
    <td>Description</td>
    <td>Usage Notes</td>
  </tr>
  <tr>
    <td>ContactPerson </td>
    <td>Person with knowledge of how to access, troubleshoot, or otherwise field issues related to the resource</td>
    <td>May also be "Point of Contact" in organization that controls access to the resource, if that organization is different from Publisher, Distributor, Data Manager</td>
  </tr>
  <tr>
    <td>DataCollector </td>
    <td>Person/institution responsible for finding, gathering/collecting data under the guidelines of the author(s) or Principal Investigator (PI)</td>
    <td>May also use when crediting survey conductors, interviewers, event or condition observers, person responsible for monitoring key instrument data.</td>
  </tr>
  <tr>
    <td>DataCurator</td>
    <td>Person tasked with reviewing, enhancing, cleaning, or standardizing metadata and the associated data submitted for storage, use, and maintenance within a data center or repository</td>
    <td>While the “DataManager” is concerned with digital maintenance, the DataCurator’s role encompasses quality assurance focused on content and metadata. This includes checking whether  the submitted dataset is complete, with all files and components as described by submitter, whether the metadata is standardized to appropriate systems and schema, whether  specialized metadata is needed to add value and ensure access across disciplines, and determining how   the metadata might map to search engines, database products, and automated feeds.</td>
  </tr>
  <tr>
    <td>DataManager </td>
    <td>Person (or organization with a staff of data managers, such as a data centre) responsible for maintaining the finished resource.</td>
    <td>The work done by this person or organization ensures that the resource is periodically “refreshed” in terms of software/hardware support, is kept available or is protected from unauthorized access, is stored in accordance with industry standards, and is handled in accordance with the records management requirements applicable to it.</td>
  </tr>
  <tr>
    <td>Distributor</td>
    <td>Institution tasked with responsibility to generate/disseminate copies of the resource in either electronic or print form. </td>
    <td>Works stored in more than one archive/repository may credit each as a distributor.</td>
  </tr>
  <tr>
    <td>Editor</td>
    <td>A person who oversees the details related to the publication format of the resource.</td>
    <td>Note: if the Editor is to be credited in place of multiple creators, the Editor’s name may be supplied as Creator, with “(Ed.)” appended to the name.</td>
  </tr>
  <tr>
    <td>HostingInstitution</td>
    <td>Typically, the organization allowing the resource to be available on the internet through the provision of its hardware/software/operating support.</td>
    <td>May also be used for an organization that stores the data offline.  Often a data centre (if that data centre is not the “publisher” of the resource.)</td>
  </tr>
  <tr>
    <td>Producer</td>
    <td>Typically a person or organization responsible for the artistry and form of a media product.</td>
    <td>In the data industry, this may be a company “producing” DVDs that package data for future dissemination by a distributor.</td>
  </tr>
  <tr>
    <td>ProjectLeader</td>
    <td>Person officially designated as head of project team or sub-project team instrumental in the work necessary to development of the resource.</td>
    <td>The Project Leader is not “removed” from the work that resulted in the resource; he or she remains intimately involved throughout the life of the particular project team.</td>
  </tr>
  <tr>
    <td>ProjectManager</td>
    <td>Person officially designated as manager of a project. Project may consist of one or many project teams and sub-teams.</td>
    <td>The manager of a project normally has more administrative responsibility than actual work involvement.</td>
  </tr>
  <tr>
    <td>ProjectMember</td>
    <td>Person on the membership list of a designated project/project team.</td>
    <td>This vocabulary may or may not indicate the quality, quantity, or substance of the person’s involvement.</td>
  </tr>
  <tr>
    <td>RegistrationAgency</td>
    <td>Institution/organization officially appointed by a Registration Authority to handle specific tasks within a defined area of responsibility.</td>
    <td>DataCite is a Registration Agency for the International DOI Foundation (IDF). One of DataCite’s tasks is to assign DOI prefixes to the allocating agents who then assign the full, specific character string to data clients, provide metadata back to the DataCite registry, etc.</td>
  </tr>
  <tr>
    <td>RegistrationAuthority</td>
    <td>A standards-setting body from which Registration Agencies obtain official recognition and guidance.</td>
    <td>The IDF serves as the Registration Authority for the International Standards Organization (ISO) in the area/domain of Digital Object Identifiers.</td>
  </tr>
  <tr>
    <td>RelatedPerson</td>
    <td>A person without a specifically defined role in the development of the resource, but who is someone the author wishes to recognize.</td>
    <td>This person could be an author’s intellectual mentor, a person providing intellectual leadership in the discipline or subject domain, etc.</td>
  </tr>
  <tr>
    <td>Researcher</td>
    <td>A person involved in analyzing data or the results of an experiment or formal study. May indicate an intern or assistant to one of the authors who helped with research but who was not so “key” as to be listed as an author.</td>
    <td>Should be a person, not an institution. Note that a person involved in the gathering of data would fall under the contributorType “DataCollector.” The researcher may find additional data online and correlate it to the data collected for the experiment or study, for example. </td>
  </tr>
  <tr>
    <td>ResearchGroup</td>
    <td>Typically refers to a group of individuals with a lab, department, or division; the group has a particular, defined focus of activity.</td>
    <td>May operate at a narrower level of scope; may or may not hold less administrative responsibility than a project team.</td>
  </tr>
  <tr>
    <td>RightsHolder</td>
    <td>Person or institution owning or managing property rights, including intellectual property rights over the resource.</td>
    <td></td>
  </tr>
  <tr>
    <td>Sponsor</td>
    <td>Person or organization that issued a contract or under the auspices of which a work has been written, printed, published, developed, etc.</td>
    <td>Includes organizations that provide in-kind support, through donation, provision of people or a facility or instrumentation necessary for the development of the resource, etc.</td>
  </tr>
  <tr>
    <td>Supervisor</td>
    <td>Designated administrator over one or more groups/teams working to produce a resource or over one or more steps of a development process.</td>
    <td></td>
  </tr>
  <tr>
    <td>WorkPackageLeader</td>
    <td>A Work Package is a recognized data product, not all of which is included in publication. The package, instead, may include notes, discarded documents, etc.  The Work Package Leader is responsible for ensuring the comprehensive contents,  versioning, and availability of the Work Package during the development of the resource. </td>
    <td></td>
  </tr>
  <tr>
    <td>Other</td>
    <td>Any person or institution making a significant contribution to the development and/or maintenance of the resource, but whose contribution does not “fit” other controlled vocabulary for contributorType.</td>
    <td>Could be a photographer, artist, or writer whose contribution helped to publicize the resource (as opposed to creating it), a reviewer of the resource, someone providing administrative services to the author (such as depositing updates into an online repository, analysing usage, etc.), or one of many other roles.</td>
  </tr>
</table>


**dateType**

NOTE: To indicate a date range, follow the RKMS-ISO8601 standard for depicting date ranges.

For example:

<date dateType="created">2012-03-01/2012-03-05</date>



**Table 6: Description of dateType**

<table>
  <tr>
    <td>Option</td>
    <td>Description</td>
    <td>Usage Notes</td>
  </tr>
  <tr>
    <td>Accepted</td>
    <td>The date that the publisher accepted the resource into their system.</td>
    <td>To indicate the start of an embargo period, use Submitted or Accepted, as appropriate.</td>
  </tr>
  <tr>
    <td>Available</td>
    <td>The date the resource is made publicly available. May be a range.</td>
    <td>To indicate the end of an embargo period, use Available.</td>
  </tr>
  <tr>
    <td>Copyrighted</td>
    <td>The specific, documented date at which the resource receives a copyrighted status, if applicable.</td>
    <td></td>
  </tr>
  <tr>
    <td>Collected</td>
    <td>The date or date range in which the resource content was collected.</td>
    <td>To indicate precise or particular timeframes in which research was conducted.</td>
  </tr>
  <tr>
    <td>Created</td>
    <td>The date the resource itself was put together; this could be a date range or a single date for a final component, e.g., the finalised file with all of the data.</td>
    <td>Recommended for discovery.</td>
  </tr>
  <tr>
    <td>Issued</td>
    <td>The date that the resource is published or distributed e.g. to a data center</td>
    <td></td>
  </tr>
  <tr>
    <td>Submitted</td>
    <td>The date the creator submits the resource to the publisher. This could be different from Accepted if the publisher then applies a selection process.</td>
    <td>Recommended for discovery.

To indicate the start of an embargo period, use Submitted or Accepted, as appropriate.

</td>
  </tr>
  <tr>
    <td>Updated</td>
    <td>The date of the last update to the resource, when the resource is being added to. May be a range.</td>
    <td></td>
  </tr>
  <tr>
    <td>Valid</td>
    <td>The date or date range during which the dataset or resource  is accurate. </td>
    <td></td>
  </tr>
</table>


**resourceTypeGeneral**

**Table 7: Description of resourceTypeGeneral**

<table>
  <tr>
    <td>Option</td>
    <td>Description</td>
    <td>Examples and Usage Notes</td>
    <td>Suggested Dublin Core Mapping</td>
  </tr>
  <tr>
    <td>Audiovisual</td>
    <td>A series of visual representations imparting an impression of motion when shown in succession. May or may not include sound.</td>
    <td>May be used for films, video, etc, Ex: http://data.datacite.org/10.7916/D8610XCB</td>
    <td>MovingImage</td>
  </tr>
  <tr>
    <td>Catalog</td>
    <td>An aggregation of a single type of resources.</td>
    <td>May be used to describe a data catalog or any other type of catalog. May be used in combination with the "HasMember, IsMemberOf" relationType.</td>
    <td>Collection</td>
  </tr>
  <tr>
    <td>Collection</td>
    <td>An aggregation of resources of various types. If a collection exists of a single type, use the Catalog type to describe it. </td>
    <td>A collection of samples, or various files making up a report. Ex: http://data.datacite.org/10.5284/1001038</td>
    <td>Collection</td>
  </tr>
  <tr>
    <td>Dataset</td>
    <td>Data encoded in a defined structure.</td>
    <td>Data file or files, Ex: http://data.datacite.org/10.4231/D39Z90B9T</td>
    <td>Dataset</td>
  </tr>
  <tr>
    <td>Event</td>
    <td>A non-persistent, time-based occurrence.</td>
    <td>Descriptive information and/or content that is the basis for discovery of the purpose, location, duration, and responsible agents associated with an event such as a webcast or convention. Ex: http://data.datacite.org/10.7269/P3RN35SZ</td>
    <td>Event</td>
  </tr>
  <tr>
    <td>Image</td>
    <td>A visual representation other than text.</td>
    <td>Digitized or born digital images, drawings or photographs. Ex: http://data.datacite.org/10.6083/M4QN65C5</td>
    <td>Image, StillImage</td>
  </tr>
  <tr>
    <td>InteractiveResource</td>
    <td>A resource requiring interaction from the user to be understood, executed, or experienced</td>
    <td>Training modules, files that require use of a viewer (e.g., Flash), or query/response portals. Ex: http://data.datacite.org/10.7269/P3TB14TR</td>
    <td>InteractiveResource</td>
  </tr>
  <tr>
    <td>Model</td>
    <td>An abstract, conceptual, graphical, mathematical or visualization model that represents empirical objects, phenomena, or physical processes.</td>
    <td>Modelled descriptions of, for example, different aspects of languages or a molecular biology reaction chain. Ex:
http://data.datacite.org/10.5285/4D866CD2-C907-4CE2-B070-084CA9779DC2</td>
    <td>N/A</td>
  </tr>
  <tr>
    <td>PhysicalObject</td>
    <td>An inanimate, three-dimensional object or substance.</td>
    <td>Artifacts, specimens.
Ex: http://data.datacite.org/10.7299/X78052RB</td>
    <td>PhysicalObject</td>
  </tr>
  <tr>
    <td>Service</td>
    <td>A system that provides one or more functions of value to the end-user.</td>
    <td>Data management service, authentication service, or photocopying service.</td>
    <td>Service</td>
  </tr>
  <tr>
    <td>Software</td>
    <td>A computer program in source code (text) or compiled form.</td>
    <td>Software supporting research. Ex:
http://data.datacite.org/10.7938/M1057CV9</td>
    <td>Software</td>
  </tr>
  <tr>
    <td>Sound</td>
    <td>A resource primarily intended to be heard.</td>
    <td>Audio recording. Ex: http://data.datacite.org/10.7282/T3J67F05</td>
    <td>Sound</td>
  </tr>
  <tr>
    <td>Text</td>
    <td>A resource consisting primarily of words for reading.</td>
    <td>Grey literature, lab notes, accompanying materials.
Ex: http://data.datacite.org/10.5682/9786065914018</td>
    <td>Text</td>
  </tr>
  <tr>
    <td>Workflow</td>
    <td>A structured series of steps which can be executed to produce a final outcome, allowing users a means to specify and enact their work in a more reproducible manner. </td>
    <td>Computational workflows involving sequential operations made on data by wrapped software and may be specified in a format belonging to a workflow management system, such as Taverna (http://www.taverna.org.uk/). More.</td>
    <td>N/A</td>
  </tr>
  <tr>
    <td>Other</td>
    <td>If selected, supply a value for ResourceType.</td>
    <td></td>
    <td></td>
  </tr>
</table>


**relatedIdentifierType**

**Table 8: Description of relatedIdentifierType**

<table>
  <tr>
    <td>Option</td>
    <td>Full Name</td>
    <td>Example</td>
  </tr>
  <tr>
    <td>ARK</td>
    <td>Archival Resource Key; URL designed to support long-term access to information objects. In general, ARK syntax is of the form (brackets indicate [optional] elements: [http://NMA/]ark:/NAAN/Name[Qualifier]</td>
    <td><relatedIdentifier relatedIdentifierType="ARK" relationType="IsCitedBy">ark:/13030/tqb3kh97gh8w
</relatedIdentifier>
</td>
  </tr>
  <tr>
    <td>arXiv</td>
    <td>arXiv identifier; arXiv.org is a repository of preprints of scientific papers in the fields of mathematics, physics, astronomy, computer science, quantitative biology, statistics, and quantitative finance.</td>
    <td><relatedIdentifier
relatedIdentifierType="arXiv”
relationType=”IsCitedBy”>arXiv:0706.0001
</relatedIdentifier></td>
  </tr>
  <tr>
    <td>bibcode</td>
    <td>Astrophysics Data System bibliographic codes; a standardized 19 character identifier according to the syntax yyyyjjjjjvvvvmppppa. See http://info-uri.info/registry/OAIHandler?verb=GetRecord&metadataPrefix=reg&identifier=info:bibcode/</td>
    <td><relatedIdentifier
relatedIdentifierType="bibcode"
relationType="IsCitedBy">
2014Wthr…69…72C
</relatedIdentifier>

Note:  bibcodes can be resolved via http://adsabs.harvard.edu/abs/bibcode</td>
  </tr>
  <tr>
    <td>DOI</td>
    <td>Digital Object Identifier; a character string used to uniquely identify an object. A DOI name is divided into two parts, a prefix and a suffix, separated by a slash.</td>
    <td><relatedIdentifier relatedIdentifierType="DOI" relationType=”IsSupplementTo”> 10.1016/j.epsl.2011.11.037
</relatedIdentifier></td>
  </tr>
  <tr>
    <td>EAN13</td>
    <td>European Article Number, now renamed International Article Number, but retaining the original acronym, is a 13-digit barcoding standard which is a superset of the original 12-digit Universal Product Code (UPC) system.</td>
    <td><relatedIdentifier relatedIdentifierType="EAN13” relationType=”Cites”>9783468111242
</relatedIdentifier>
</td>
  </tr>
  <tr>
    <td>EISSN</td>
    <td>Electronic International Standard Serial Number; ISSN used to identify periodicals in electronic form (eISSN or e-ISSN).</td>
    <td><relatedIdentifier relatedIdentifierType="eISSN” relationType=”Cites”>1562-6865
</relatedIdenfifier></td>
  </tr>
  <tr>
    <td>Handle</td>
    <td>A handle is an abstract reference to a resource. </td>
    <td><relatedIdentifier relatedIdentifierType="Handle" relationType="References">10013/epic.10033 </relatedIdentifier></td>
  </tr>
  <tr>
    <td>IGSN</td>
    <td>International Geo Sample Number; a 9-digit alphanumeric code that uniquely identifies samples from our natural environment and related sampling features.</td>
    <td><relatedIdentifier relatedIdentifierType="IGSN" relationType="References">IECUR0097
</relatedIdentifier>
</td>
  </tr>
  <tr>
    <td>ISBN</td>
    <td>International Standard Book Number; a unique numeric book identifier. There are 2 formats: a 10-digit ISBN format and a 13-digit ISBN.</td>
    <td><relatedIdentifier><relatedIdentifier relatedIdentifierType="ISBN" relationType="IsPartOf">978-3-905673-82-1
</relatedIdentifier>
</td>
  </tr>
  <tr>
    <td>ISSN</td>
    <td>International Standard Serial Number; a unique 8-digit number used to identify a print or electronic periodical publication. </td>
    <td><relatedIdentifier relatedIdentifierType="ISSN" relationType="IsPartOf">0077-5606
</relatedIdentifier>
</td>
  </tr>
  <tr>
    <td>ISTC</td>
    <td>International Standard Text Code; a unique "number” assigned to a textual work. An ISTC consists of 16 numbers and/or letters.</td>
    <td><relatedIdentifier relatedIdentifierType="ISTC” relationType=”Cites”>0A9 2002 12B4A105 7
</relatedIdentifier></td>
  </tr>
  <tr>
    <td>LISSN</td>
    <td>The linking ISSN or ISSN-L enables collocation or linking among different media versions of a continuing resource.</td>
    <td><relatedIdentifier relatedIdentifierType="LISSN” relationType=”Cites”>1188-1534</relatedIdentifier></td>
  </tr>
  <tr>
    <td>LSID</td>
    <td>Life Science Identifiers; a unique identifier for data in the Life Science domain. Format: urn:lsid:authority:namespace:identifier:revision</td>
    <td><relatedIdentifier relatedIdentifierType="LSID” relationType=”Cites”> urn:lsid:ubio.org:namebank:11815</relatedIdentifier></td>
  </tr>
  <tr>
    <td>PMID</td>
    <td>PubMed identifier; a unique number assigned to each PubMed record.</td>
    <td><relatedIdentifier relatedIdentifierType="PMID” relationType=”IsReferencedBy”>12082125</relatedIdentifier></td>
  </tr>
  <tr>
    <td>PURL</td>
    <td>Persistent Uniform Resource Locator. A PURL has three parts: (1) a protocol, (2) a resolver address, and (3) a name.
</td>
    <td><relatedIdentifier relatedIdentifierType="PURL” relationType=”Cites”> http://purl.oclc.org/foo/bar</relatedIdentifier></td>
  </tr>
  <tr>
    <td>UPC</td>
    <td>Universal Product Code is a barcode symbology used for tracking trade items in stores. Its most common form, the UPC-A, consists of 12 numerical digits.</td>
    <td><relatedIdentifier relatedIdentifierType="UPC” relationType=”Cites”> 123456789999</relatedIdentifier></td>
  </tr>
  <tr>
    <td>URL</td>
    <td>Uniform Resource Locator, also known as web address, is a specific character string that constitutes a reference to a resource. The syntax is:
scheme://domain:port/path?query_string#fragment_id</td>
    <td><relatedIdentifier relatedIdentifierType="URL” relationType=”IsCitedBy”>http://www.heatflow.und.edu/index2.html</relatedIdentifier></td>
  </tr>
  <tr>
    <td>URN</td>
    <td>Uniform Resource Name; is a unique and persistent identifier of an electronic document. The syntax is: urn:< NID>:<NSS>                             The leading urn: sequence is case-insensitive, <NID> is the namespace identifier, <NSS> is the namespace-specific string. </td>
    <td><relatedIdentifier relatedIdentifierType="URN" relationType=”IsSupplementTo”>urn:nbn:de:101:1-201102033592</relatedIdentifier></td>
  </tr>
</table>


**relationType**

Description of the relationship of the resource being registered (A) and the related resource (B).

**Table 9: Description of relationType**

<table>
  <tr>
    <td>Option</td>
    <td>Definition</td>
    <td>Example and Usage Notes</td>
  </tr>
  <tr>
    <td>IsCitedBy </td>
    <td>indicates that B includes A in a citation</td>
    <td>Recommended for discovery.
<relatedIdentifier relatedIdentifierType="DOI"relationType="IsCitedBy">10.4232/10.ASEAS-5.2-1
</relatedIdentifier></td>
  </tr>
  <tr>
    <td>Cites </td>
    <td>indicates that A includes B in a citation</td>
    <td>Recommended for discovery.
<relatedIdentifier relatedIdentifierType="ISBN"
relationType="Cites">0761964312
</relatedIdentifier></td>
  </tr>
  <tr>
    <td>IsSupplementTo </td>
    <td>indicates that A is a supplement to B</td>
    <td>Recommended for discovery.
<relatedIdentifier relatedIdentifierType="URN"
relationType="IsSupplementTo">urn:nbn:de:0168-ssoar-13172
</relatedIdentifier></td>
  </tr>
  <tr>
    <td>IsSupplementedBy</td>
    <td>indicates that B is a supplement to A</td>
    <td>Recommended for discovery.
<relatedIdentifier relatedIdentifierType="PMID"
relationType="IsSupplementedBy">16911322/
</relatedIdentifier></td>
  </tr>
  <tr>
    <td>IsContinuedBy </td>
    <td>indicates A is continued by the work B</td>
    <td><relatedIdentifier relatedIdentifierType="URN"
relationType="IsContinuedBy">urn:nbn:de:bsz:21-opus-4967
</relatedIdentifier></td>
  </tr>
  <tr>
    <td>Continues</td>
    <td>indicates A is a continuation of the work B</td>
    <td><relatedIdentifier relatedIdentifierType="URN"
relationType="Continues">urn:nbn:de:bsz:21-opus-4966
</relatedIdentifier></td>
  </tr>
  <tr>
    <td>HasMember</td>
    <td>indicates A has a member, B</td>
    <td>examples from usage must wait until implementation</td>
  </tr>
  <tr>
    <td>IsMemberOf</td>
    <td>indicates that A is a member of B</td>
    <td>examples from usage must wait until implementation</td>
  </tr>
  <tr>
    <td>HasMetadata </td>
    <td>indicates resource A has additional metadata B</td>
    <td><relatedIdentifier relatedIdentifierType="DOI"
relationType="HasMetadata" relatedMetadataScheme="DDI-L"
schemeURI="http://www.ddialliance.org/Specification/DDI-Lifecycle/3.1/XMLSchema/instance.xsd">10.1234/567890</relatedIdentifier></td>
  </tr>
  <tr>
    <td>IsMetadataFor </td>
    <td>indicates additional metadata A for a  resource B</td>
    <td><relatedIdentifier relatedIdentifierType="DOI"
relationType="IsMetadataFor"relatedMetadataScheme="DDI-L"
schemeURI="http://www.ddialliance.org/Specification/DDI-Lifecycle/3.1/XMLSchema/instance.xsd">10.1234/567891</relatedIdentifier></td>
  </tr>
  <tr>
    <td>IsNewVersionOf  </td>
    <td>indicates A is a new edition of B, where the new edition has been modified or updated</td>
    <td><relatedIdentifier relatedIdentifierType="DOI"
relationType="IsNewVersionOf">10.5438/0005
</relatedIdentifier>

Use for a version making previous version(s) obsolete.</td>
  </tr>
  <tr>
    <td>IsPreviousVersionOf  </td>
    <td>indicates A is a previous edition of B</td>
    <td><relatedIdentifier relatedIdentifierType="DOI"
relationType="IsPreviousVersionOf">10.5438/0007
</relatedIdentifier></td>
  </tr>
  <tr>
    <td>IsPartOf </td>
    <td>indicates A is a portion of B; may be used for elements of a series</td>
    <td>Recommended for discovery.
<relatedIdentifier relatedIdentifierType="ISBN"
relationType="IsPartOf">0-486-27557-4
</relatedIdentifier></td>
  </tr>
  <tr>
    <td>HasPart</td>
    <td>indicates A includes the part B</td>
    <td>Recommended for discovery.
<relatedIdentifier relatedIdentifierType="DOI"
relationType="HasPart">10.1234/7894
</relatedIdentifier></td>
  </tr>
  <tr>
    <td>IsReferencedBy </td>
    <td>indicates A is used as a source of information by B</td>
    <td><relatedIdentifier relatedIdentifierType="URL"
relationType="IsReferencedBy">http://www.testpubl.de
</relatedIdentifier></td>
  </tr>
  <tr>
    <td>References</td>
    <td>indicates B is used as a source of information for A</td>
    <td><relatedIdentifier relatedIdentifierType="URN"
relationType="References">urn:nbn:de:bsz:21-opus-963</relatedIdentifier></td>
  </tr>
  <tr>
    <td>IsDocumentedBy  </td>
    <td>indicates B is documentation about/
explaining A</td>
    <td><relatedIdentifier relatedIdentifierType="URL"
relationType="IsDocumentedBy">http://tobias-lib.uni-tuebingen.de/volltexte/2000/96/
</relatedIdentifier></td>
  </tr>
  <tr>
    <td>Documents  </td>
    <td>indicates A is documentation about/B</td>
    <td><relatedIdentifier relatedIdentifierType="DOI"
relationType="Documents">10.1234/7836
</relatedIdentifier></td>
  </tr>
  <tr>
    <td>IsCompiledBy </td>
    <td>indicates B is used to compile or create A</td>
    <td><relatedIdentifier relatedIdentifierType="URL"
relationType="isCompiledBy">http://d-nb.info/gnd/4513749-3
</relatedIdentifier></td>
  </tr>
  <tr>
    <td>Compiles </td>
    <td>indicates B is the result of a compile or creation event using A</td>
    <td><relatedIdentifier relatedIdentifierType="URN"
relationType="Compiles">urn:nbn:de:bsz:21-opus-963
</relatedIdentifier></td>
  </tr>
  <tr>
    <td>IsVariantFormOf  </td>
    <td>indicates A is a variant or different form of B, e.g. calculated or calibrated form or different packaging</td>
    <td><relatedIdentifier relatedIdentifierType="DOI"
relationType="IsVariantFormOf">10.1234/8675
</relatedIdentifier>

Use for a different form of one thing.</td>
  </tr>
  <tr>
    <td>IsOriginalFormOf </td>
    <td>indicates A is the original form of B</td>
    <td><relatedIdentifier relatedIdentifierType="DOI"
relationType="IsOriginalFormOf">10.1234/9035
</relatedIdentifier></td>
  </tr>
  <tr>
    <td>IsIdenticalTo </td>
    <td>indicates that A is identical to B, for use when there is a need to register two separate instances of the same resource</td>
    <td><relatedIdentifier relatedIdentifierType="URL"
relationType="IsIdenticalTo">http://oac.cdlib.org/findaid/ark:/13030/c8r78fzq
</relatedIdentifier>

IsIdenticalTo should be used for a resource that is the same as the registered resource but is saved on another location, maybe another institution.</td>
  </tr>
  <tr>
    <td>IsReviewedBy</td>
    <td>indicates that A is reviewed by B</td>
    <td><relatedIdentifier relatedIdentifierType="DOI"
relationType="IsReviewedBy">10.5256/F1000RESEARCH.4288.R4745
</relatedIdentifier></td>
  </tr>
  <tr>
    <td>Reviews</td>
    <td>indicates that A is a review of B</td>
    <td><relatedIdentifier relatedIdentifierType="DOI"
relationType="Reviews">10.12688/f1000research.4001.1
</relatedIdentifier>
</td>
  </tr>
  <tr>
    <td>IsDerivedFrom</td>
    <td>indicates B is a source upon which A is based</td>
    <td><relatedIdentifier relatedIdentifierType="DOI"
relationType="IsDerivedFrom">10.6078/M7DZ067C
</relatedIdentifier>
 
IsDerivedFrom should be used for a resource that is a derivative of an original resource.

In this example, the dataset is derived from a larger dataset and  data values have been manipulated from their original state.</td>
  </tr>
  <tr>
    <td>IsSourceOf</td>
    <td>indicates A is a source upon which B is based</td>
    <td><relatedIdentifier relatedIdentifierType="URL"
relationType="IsSourceOf"> http://opencontext.org/projects/81204AF8-127C-4686-E9B0-1202C3A47959
</relatedIdentifier>
 
IsSourceOf is the original resource from which a derivative resource was created.
 
In this example, this is the original dataset without value manipulation, and the source of the derived dataset.  </td>
  </tr>
</table>


**descriptionType**

**Table 10: Description of descriptionType**

<table>
  <tr>
    <td>Option</td>
    <td>Definition</td>
    <td>Usage Notes</td>
  </tr>
  <tr>
    <td>Abstract</td>
    <td>A brief description of the resource and the context in which the resource was created.
</td>
    <td>Recommended for discovery.

Use "<br>" to indicate a line break for improved rendering of multiple paragraphs, but otherwise no html markup.

Example: http://data.datacite.org/10.1594/PANGAEA.771774
</td>
  </tr>
  <tr>
    <td>Methods</td>
    <td>The methodology employed for the study or research.</td>
    <td>Recommended for discovery.

For example, see section "Sampling, Processing and Quality Control Methods" in the following dataset record: https://knb.ecoinformatics.org/#view/doi:10.5063/F1DZ067F</td>
  </tr>
  <tr>
    <td>SeriesInformation</td>
    <td>Information about a repeating series, such as volume, issue, number.</td>
    <td>For use with grey literature. If providing an ISSN, use property 12 (RelatedIdentifier), relatedIdentifierType=ISSN. For dataset series, use property 12 (RelatedIdentifier) and describe the relationships with isPartOf or HasPart.

Example: http://data.datacite.org/10.4229/23RDEUPVSEC2008-5CO.8.3</td>
  </tr>
  <tr>
    <td>TableOfContents</td>
    <td>A listing of the Table of Contents.
</td>
    <td>Use "<br>" to indicate a line break for improved rendering of multiple paragraphs, but otherwise no html markup.

Example: http://data.datacite.org/10.5678/LCRS/FOR816.CIT.1031</td>
  </tr>
  <tr>
    <td>TechnicalInfo</td>
    <td>Detailed information that may be associated with design, implementation, operation, use, and/or maintenance of a process or system.</td>
    <td>For software description, this may include a readme.txt, and necessary environmental information such as hardware, operation software, applications / programs, and versions. For different uses, this can include other specific and detailed information as necessary and appropriate.</td>
  </tr>
  <tr>
    <td>Other</td>
    <td>Other description information that does not fit into an existing category.</td>
    <td>Use for any other description type.</td>
  </tr>
</table>


# Appendix 2: Earlier Version Update Notes

## Version 3.1 Update

Version 3.1 of the schema includes these changes:

* New affiliation attribute for Creator and Contributor
* New relationType pairs
  * IsReviewedBy and Reviews
  * IsDerivedFrom and IsSourceOf
* New contributorType: DataCurator
* New relatedIdentifierTypes:
  * arXiv
  * bibcode

Version 3.1 of the documentation includes these changes:

* Documentation for the new affiliation attributes for Creator and Contributor
* Special notes about support for long lists of names (Creator and Contributor)
* Additional guidance for:
  * Recording Publication Year
  * Handling the digitized version of physical object
  * Handling missing mandatory property values, including standard values table
* Documentation for the new contributorType: DataCurator
* Documentation for the two new relatedIdentifierTypes:
  * arXiv
  * bibcode
* Documentation, including examples, for the new relationType pairs:
  * IsReviewedBy and Reviews
  * IsDerivedFrom and IsSourceOf
* Correction of link errors in 3.0 documentation

## Version 3.0 Update

Version 3.0 of the DataCite Metadata Schema included these changes (NOTE:  Two additional schema code level changes are the allowance of keeping optional wrapper elements empty and the allowance of arbitrary ordering of elements (by removal of <xs:sequence>).):

* Correction of a problem with our way of depicting dates by
  * implementing RKMS-ISO8601 (NOTE:  The standard is documented here: http://www.ukoln.ac.uk/metadata/dcmi/collection-RKMS-ISO8601/ ) standard for depicting date ranges, so that a range is indicated as follows: 2004-03-02/2005-06-02
  * deleting startDate and endDate date types, and derogating these from earlier versions
* Addition of a new GeoLocation property, with the sub-properties geoLocationPoint, geoLocationBox, geoLocationPlace supporting a simple depiction of geospatial information, as well as a free text description.

* Addition of new values to controlled lists:
  * contributorType: ResearchGroup and Other
  * dateType:  Collected
  * resourceTypeGeneral :  Audiovisual,  Workflow,  and Other and derogation of Film
  * relatedIdentifierType: PMID
  * relationType: IsIdenticalTo (indicates that A is identical to B, for use when there is a need to register two separate instances of the same resource)
  * relationType: HasMetadata, (indicates resource A has additional metadata B and indicates), IsMetadataFor (indicates additional metadata A for resource B)
  * descriptionType: Methods

* Deletion of the derogated resourceType: film
* new sub-properties for relationType: relatedMetadataScheme, schemeURI and schemeType, to be used only for the new relationType pair of HasMetadata, IsMetadataFor
* Addition of schemeURI sub-property to the nameIdentifierScheme associated with CreatorName,  ContributorName and Subject
* Addition of the rightsURI sub-property to Rights; Rights is now repeatable (within wrapper element rightsList).
* Implementation of the xml:lang attribute (NOTE: Allowed values IETF BCP 47, ISO 639-1 language codes, e.g. en, de, fr) that can be used on the properties Title, Subject and Description.
* Removal of two system-generated administrative metadata fields: LastMetadataUpdate and MetadataVersionNumber because both values are tracked in another way now.

Version 3.0 of the DataCite Metadata Schema documentation included these changes:

* Updates to the introductory information
* Provision of greater detail, explanatory material and definitions for controlled lists
* Indication of recommended metadata, in addition to mandatory and optional
* Addition of more and more varied XML examples on the Metadata Schema website
* Removal from documentation of information about administrative metadata (which cannot be edited by contributors).

## Version 2.2 Update

Version 2.2 of the DataCite Metadata Schema introduced several changes, as noted below:

* Addition of "URL" to list of allowed values for relatedIdentifierType
* Addition of the following values to list of allowed values for contributorType: Producer, Distributor, RelatedPerson, Supervisor, Sponsor, Funder, RightsHolder
* Addition of "SeriesInformation" to list of allowed values for descriptionType
* Addition of "Model" to list of allowed values for resourceTypeGeneral

Version 2.2 of the DataCite Metadata Schema documentation included these changes:

* Provision of more examples of xml for different types of resources
* Explanation of the PublicationYear property in consideration of the requirements of citation. A change to the definition of the Publisher property, which now reads, "The name of the entity that holds, archives, publishes, prints, distributes, releases, issues, or produces the resource. This property will be used to formulate the citation, so consider the prominence of the role."

## Version 2.1 Update

Version 2.1 of the DataCite Metadata Schema introduced several changes, as noted below:

* Addition of a namespace ([http://schema.datacite.org/namespace ](http://schema.datacite.org/namespace) to the schema in order to support OAI PMH compatibility
* Enforcement of content for mandatory properties
* New type for the Date property to conform with the specification that it handles both YYYY and YYYY-MM-DD values

Version 2.1 of the DataCite Metadata Schema documentation included these changes:

* Addition of a column to the Mandatory and Optional Properties tables providing an indicator of whether the property being described is an attribute or a child of the corresponding property that has preceded it
* Revision of the allowed values description for the attribute 12.2 relationType. These have been reviewed and rewritten for increased clarity. In several cases, corrections to the definitions occurred.

## Appendix 3: Additional information

Table 11: Standard values for unknown information

<table>
  <tr>
    <td>Code</td>
    <td>Definition</td>
  </tr>
  <tr>
    <td>(:unac)</td>
    <td>temporarily inaccessible</td>
  </tr>
  <tr>
    <td>(:unal)</td>
    <td>unallowed, suppressed intentionally</td>
  </tr>
  <tr>
    <td>(:unap)</td>
    <td>not applicable, makes no sense</td>
  </tr>
  <tr>
    <td>(:unas)</td>
    <td>value unassigned (e.g., Untitled)</td>
  </tr>
  <tr>
    <td>(:unav)</td>
    <td>value unavailable, possibly unknown</td>
  </tr>
  <tr>
    <td>(:unkn)</td>
    <td>known to be unknown (e.g., Anonymous, Inconnue)</td>
  </tr>
  <tr>
    <td>(:none)</td>
    <td>never had a value, never will</td>
  </tr>
  <tr>
    <td>(:null)</td>
    <td>explicitly and meaningfully empty</td>
  </tr>
  <tr>
    <td>(:tba)</td>
    <td>to be assigned or announced later</td>
  </tr>
  <tr>
    <td>(:etal)</td>
    <td>too numerous to list (et alia)</td>
  </tr>
</table>
