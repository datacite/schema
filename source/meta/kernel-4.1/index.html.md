---
title: DataCite Metadata Schema 4.1
version: 4.1
date: 2016-09-14
layout: schema
schema_url: /meta/kernel-4.1/metadata.xsd
documentation_url: /meta/kernel-4.0/doc/DataCite-MetadataKernel_v4.0.pdf
---

## Documentation
DataCite Metadata Working Group. (2017). DataCite Metadata Schema Documentation for the Publication and Citation of Research Data. Version 4.1. DataCite e.V.

## Schema
DataCite Metadata Working Group. (2017). DataCite Metadata Schema for the Publication and Citation of Research Data. Version 4.1. DataCite e.V.

<a href="metadata.xsd" class="btn">View XSD</a>

## Changes

* Allowing multiple polygons per GeoLocation
* Addition of new optional "inPolygonPoint" subproperties for polygon
* Addition of new dateType “Other”
*	Addition of new "dateInformation" subproperty for dateType
*	Addition of a new resourceType "DataPaper"
*	Addition of three new relationType pairs: IsDescribedBy and Describes, HasVersion and IsVersionOf, IsRequiredBy and Requires
* Addition of a new optional "nameType" attribute for Creator and Contributor. Controlled list: personal, organizational
* Addition of a new optional "resourceTypeGeneral" attribute for relatedIdentifier. Controlled list is identical to existing resourceTypeGeneral attribute
* Addition of optional lang attribute to Rights property

## Examples

* [Example with complicated values](example/datacite-example-complicated-v4.1.xml)
