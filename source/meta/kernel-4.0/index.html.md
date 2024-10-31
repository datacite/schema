---
title: DataCite Metadata Schema 4.0
version: 4.0
date: 2016-09-19
layout: schema
schema_url: /meta/kernel-4.0/metadata.xsd
documentation_url: /meta/kernel-4.0/doc/DataCite-MetadataKernel_v4.0.pdf
---

## Documentation
DataCite Metadata Working Group. (2016). DataCite Metadata Schema Documentation for the Publication and Citation of Research Data. Version 4.0. DataCite e.V. [https://doi.org/10.5438/0012](https://doi.org/10.5438/0012)

<a href="doc/DataCite-MetadataKernel_v4.0.pdf" class="btn">Download PDF</a>

## Schema
DataCite Metadata Working Group. (2016). DataCite Metadata Schema for the Publication and Citation of Research Data. Version 4.0. DataCite e.V. [https://doi.org/10.5438/0013](https://doi.org/10.5438/0013)

<a href="metadata.xsd" class="btn">View XSD</a>

## Changes

* Changing resourceTypeGeneral from optional to mandatory
* Addition of a new property: FundingReference, with subproperties funderName, funderIdentifier, awardNumber, awardURI and awardTitle. Deprecation of contributorType "funder"
* Addition of new optional subproperties for creatorName and contributorName: familyName and givenName
* Addition of a new relatedIdentifierType option "IGSN"
* Addition of a new subproperty for GeoLocation "geoLocationPolygon", and changing the definition of the existing GeoLocation subproperties (geoLocationPoint and
geoLocationBox)

## Examples

* [Full DataCite XML example](example/datacite-example-full-v4.0.xml)
* [Example for a simple dataset](example/datacite-example-dataset-v4.0.xml)
* [Example with complicated values](example/datacite-example-complicated-v4.0.xml)
* [Example with DataCollector as Contributor and a geoLocation box](example/datacite-example-Box_dateCollected_DataCollector-v4.0.xml)
* [Example with GeoLocation](example/datacite-example-GeoLocation-v4.0.xml)
* [Example with HasMetadata as related resource](example/datacite-example-HasMetadata-v4.0.xml)
* [Example with IsIdenticalTo as related resource](example/datacite-example-relationTypeIsIdenticalTo-v4.0.xml)
* [Example with ResearchGroup as Contributor and Methods as Description](example/datacite-example-ResearchGroup_Methods-v4.0.xml)
* [Example with Collection as ResourceType](example/datacite-example-ResourceTypeGeneral_Collection-v4.0.xml)
* [Example with Video as ResourceType](example/datacite-example-video-v4.0.xml)
* [Example for a workflow ResourceType](example/datacite-example-workflow-v4.0.xml)
* [Example with fundingReference](example/datacite-example-fundingReference-v.4.0.xml)
