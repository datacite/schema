---
title: DataCite Metadata Schema 4.4
version: 4.4
date: 2021-03-30
layout: schema
schema_url: /meta/kernel-4.4/metadata.xsd
documentation_url: /meta/kernel-4.4/doc/DataCite-MetadataKernel_v4.4.pdf
---

## Documentation
DataCite Metadata Working Group. (2021). DataCite Metadata Schema Documentation for the Publication and Citation of Research Data and Other Research Outputs. Version 4.4. DataCite e.V. https://doi.org/10.14454/3w3z-sa82

<a href="doc/DataCite-MetadataKernel_v4.4.pdf" class="btn">Download PDF</a>


<a href="doc/DataCite-MetadataKernel_v4.4.pdf" class="btn">Download PDF</a>


## Schema
DataCite Metadata Working Group. (2021). DataCite Metadata Schema for the Publication and Citation of Research Data and Other Research Outputs. Version 4.4. DataCite e.V. https://doi.org/10.14454/fxws-0523

<a href="metadata.xsd" class="btn">View XSD</a>

## Changes

### Addition of the new subproperty “classificationCode” in the Subject property.
### Addition of new values to the resourceTypeGeneral property:
  * Book
  * BookChapter
  * ComputationalNotebook
  * ConferencePaper
  * ConferenceProceeding
  * Dissertation
  * Journal
  * JournalArticle
  * OutputsManagementPlan
  * PeerReview
  * Preprint
  * Report
  * Standard

### Addition of a new relationType: “isPublishedIn” (indicates that A is published in B)

### Addition of a new relatedItem property, with subproperties to contain specific details for containing publication information previously encoded in a description field with descriptionType=”SeriesInformation” (for example, to define the journal name, volume, and page number for an article resource). Subproperties:
  * relationType
  * relatedItemType
  * relatedItemIdentifier
  * relatedItemIdentifierType ○ creator
  * title
  * publicationYear
  * volume
  * issue
  * number
  * firstPage
  * lastPage
  * publisher
  * edition
  * contributor

### Major Documentation changes:
  * The title of this document has changed to: DataCite Metadata Schema Documentation for the Publication and Citation for Research Data and Other Research Outputs.
  * Following community feedback and suggestions, this version includes further clarification as regards the following contributorTypes: DataManager, DataCurator, ResearchGroup, and HostingInstitution.

## Examples

* [Full DataCite XML example](example/datacite-example-full-v4.xml)
* [Example for affiliation](example/datacite-example-affiliation-v4.xml)
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
* [Example with fundingReference](example/datacite-example-fundingReference-v4.xml)
