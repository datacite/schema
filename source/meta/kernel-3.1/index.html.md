---
title: DataCite Metadata Schema 3.1
date: 2014-10-16
layout: schema
version: 3.1
schema_url: http://doi.org/10.5438/0011
documentation_url: http://doi.org/10.5438/0010
---

## Documentation
DataCite Metadata Working Group. (2014). DataCite Metadata Schema Documentation for the Publication and Citation of Research Data. Version 3.1. DataCite e.V. http://doi.org/10.5438/0010

<a href="doc/DataCite-MetadataKernel_v3.1.pdf" class="btn">Download PDF</a>

## Schema
DataCite Metadata Working Group. (2014). DataCite Metadata Schema for the Publication and Citation of Research Data. Version 3.1. DataCite e.V. http://doi.org/10.5438/0011

<a href="metadata.xsd" class="btn">View XSD</a>

## Changes

Changes in this version include:

* New affiliation attribute for Creator and Contributor
* New relationType pairs IsReviewedBy/Reviews and IsDerivedFrom/IsSourceOf
* New contributorType: DataCurator
* New relatedIdentifier types: arXiv and bibcode

## Examples

* [Full DataCite XML example](example/datacite-example-full-v3.1.xml)
* [Example for a simple dataset](example/datacite-example-dataset-v3.0.xml)
* [Example with complicated values](example/datacite-example-complicated-v3.0.xml)
* [Example with DataCollector as Contributor and a geoLocation box](example/datacite-example-Box_dateCollected_DataCollector-v3.0.xml)
* [Example with GeoLocation](example/datacite-example-GeoLocation-v3.0.xml)
* [Example with HasMetadata as related resource](example/datacite-example-HasMetadata-v3.0.xml)
* [Example with IsIdenticalTo as related resource](example/datacite-example-relationTypeIsIdenticalTo-v3.0.xml)
* [Example with ResearchGroup as Contributor and Methods as Description](example/datacite-example-ResearchGroup_Methods-v3.0.xml)
* [Example with Collection as ResourceType](example/datacite-example-ResourceTypeGeneral_Collection-v3.0.xml)
* [Example with Video as ResourceType](example/datacite-example-video-v3.0.xml)
* [Example for a workflow ResourceType](example/datacite-example-workflow-v3.0.xml)
