---
title: DataCite Metadata Schema 4.2
version: 4.2
date: 2019-03-20
layout: schema
schema_url: /meta/kernel-4.2/metadata.xsd
documentation_url: /meta/kernel-4.2/doc/DataCite-MetadataKernel_v4.2.pdf
---

## Documentation
DataCite Metadata Working Group. (2018). DataCite Metadata Schema Documentation for the Publication and Citation of Research Data. Version 4.2. DataCite e.V. https://doi.org/10.5438/bmjt-bx77

<a href="doc/DataCite-MetadataKernel_v4.2.pdf" class="btn">Download PDF</a>

## Schema
DataCite Metadata Working Group. (2017). DataCite Metadata Schema for the Publication and Citation of Research Data. Version 4.2. DataCite e.V. http://doi.org/10.5438/rv0g-av03

<a href="metadata.xsd" class="btn">View XSD</a>

## Changes

*	Addition of new dateType “Withdrawn”
*	Addition of new relationType pair: IsObsoletedBy and Obsoletes
*	Addition of new relatedIdentifierType “w3id”
*	Addition of new subproperties for Rights:
  *	rightsIdentifier
  *	rightsIdentifierScheme
  *	schemeURI
*	Addition of the XML language attribute to the properties Creator, Contributor and Publisher for organizational names.


## Examples

* [Full DataCite XML example](example/datacite-example-full-v4.xml)
* [Example for software](example/datacite-example-software-v4.xml)
* [Example for a data paper](example/datacite-example-datapaper-v4.xml)
* [Example for a simple dataset](example/datacite-example-dataset-v4.xml)
* [Example with complicated values](example/datacite-example-complicated-v4.xml)
* [Example with DataCollector as Contributor and a geoLocation box](example/datacite-example-Box_dateCollected_DataCollector-v4.xml)
* [Example with GeoLocation](example/datacite-example-GeoLocation-v4.xml)
* [Example with Polygon](example/datacite-example-polygon-v4.xml)
* [Example with HasMetadata as related resource](example/datacite-example-HasMetadata-v4.xml)
* [Example with IsIdenticalTo as related resource](example/datacite-example-relationTypeIsIdenticalTo-v4.xml)
* [Example with ResearchGroup as Contributor and Methods as Description](example/datacite-example-ResearchGroup_Methods-v4.xml)
* [Example with Collection as ResourceType](example/datacite-example-ResourceTypeGeneral_Collection-v4.xml)
* [Example with Video as ResourceType](example/datacite-example-video-v4.xml)
* [Example for a workflow ResourceType](example/datacite-example-workflow-v4.xml)
* [Example with fundingReference](example/datacite-example-fundingReference-v.4.xml)
