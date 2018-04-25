---
title: DataCite Metadata Schema 4.1
version: 4.1
date: 2017-10-23
layout: schema
schema_url: /meta/kernel-4.1/metadata.xsd
documentation_url: /meta/kernel-4.0/doc/DataCite-MetadataKernel_v4.0.pdf
---

## Documentation
DataCite Metadata Working Group. (2017). DataCite Metadata Schema Documentation for the Publication and Citation of Research Data. Version 4.1. DataCite e.V. http://doi.org/10.5438/0014.

<a href="doc/DataCite-MetadataKernel_v4.1.pdf" class="btn">Download PDF</a>

## Schema
DataCite Metadata Working Group. (2017). DataCite Metadata Schema for the Publication and Citation of Research Data. Version 4.1. DataCite e.V. http://doi.org/10.5438/0015

<a href="metadata.xsd" class="btn">View XSD</a>

## Changes

* Allowing multiple polygons per GeoLocation
* Addition of new optional "inPolygonPoint" subproperties for polygon
* Addition of new dateType “Other”
*	Addition of a new resourceType "DataPaper"
*	Addition of three new relationType pairs: IsDescribedBy and Describes, HasVersion and IsVersionOf, IsRequiredBy and Requires
* Addition of new subproperty for Date: dateInformation
* Addition of a new optional attribute for creatorName and ContributorName: nameType. Controlled list: personal, organizational
* Addition of a new optional "resourceTypeGeneral" attribute for relatedIdentifier. Controlled list is identical to existing resourceTypeGeneral attribute
* Addition of optional lang attribute to Rights property

## Examples

* [Full DataCite XML example](example/datacite-example-full-v4.1.xml)
* [Example for software](example/datacite-example-software-v4.1.xml)
* [Example for a data paper](example/datacite-example-datapaper-v4.1.xml)
* [Example for a simple dataset](example/datacite-example-dataset-v4.1.xml)
* [Example with complicated values](example/datacite-example-complicated-v4.1.xml)
* [Example with DataCollector as Contributor and a geoLocation box](example/datacite-example-Box_dateCollected_DataCollector-v4.1.xml)
* [Example with GeoLocation](example/datacite-example-GeoLocation-v4.1.xml)
* [Example with Polygon](example/datacite-example-polygon-v4.1.xml)
* [Example with HasMetadata as related resource](example/datacite-example-HasMetadata-v4.1.xml)
* [Example with IsIdenticalTo as related resource](example/datacite-example-relationTypeIsIdenticalTo-v4.1.xml)
* [Example with ResearchGroup as Contributor and Methods as Description](example/datacite-example-ResearchGroup_Methods-v4.1.xml)
* [Example with Collection as ResourceType](example/datacite-example-ResourceTypeGeneral_Collection-v4.1.xml)
* [Example with Video as ResourceType](example/datacite-example-video-v4.1.xml)
* [Example for a workflow ResourceType](example/datacite-example-workflow-v4.1.xml)
* [Example with fundingReference](example/datacite-example-fundingReference-v.4.1.xml)
