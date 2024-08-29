---
title: DataCite Metadata Schema 4.5
version: 4.5
date: 2024-01-22
layout: schema
schema_url: /meta/kernel-4.5/metadata.xsd
documentation_url: https://datacite-metadata-schema.readthedocs.io/en/4.5/
---

## Documentation
DataCite Metadata Working Group. (2024). DataCite Metadata Schema Documentation for the Publication and Citation of Research Data and Other Research Outputs. Version 4.5. DataCite e.V. [https://doi.org/10.14454/g8e5-6293](https://doi.org/10.14454/g8e5-6293)

<div class="text-center"><a href="https://datacite-metadata-schema.readthedocs.io/en/4.5/" class="btn">Access documentation</a></div>
<br>
<div class="text-center"><a href="https://datacite-metadata-schema.readthedocs.io/_/downloads/en/4.5/pdf/" class="btn">Download PDF</a></div>

## Schema
DataCite Metadata Working Group. (2024). DataCite Metadata Schema for the Publication and Citation of Research Data and Other Research Outputs. Version 4.5. DataCite e.V. [https://doi.org/10.14454/znvd-6q68](https://doi.org/10.14454/znvd-6q68)

<div class="text-center"><a href="metadata.xsd" class="btn">View XSD</a></div>

## Changes

#### See [Version 4.5 Update](https://datacite-metadata-schema.readthedocs.io/en/4.5/introduction/version-update) for full details.


* Addition of new values to the resourceTypeGeneral property: 
   * Instrument
   * StudyRegistration
* Addition of new relationType pair: IsCollectedBy and Collects
* Addition of new sub-properties in the Publisher property:
    * publisherIdentifier
    * publisherIdentifierScheme
    * schemeURI
* Documentation changes:
  * Changes and additions to definitions support of instruments, and addition of a new mapping
  * Change to the definition of PhysicalObject in support of samples
  * Changes and additions to the sub-property definitions of RelatedItem
  * Other changes and corrections: see [Version 4.5 Update](https://datacite-metadata-schema.readthedocs.io/en/4.5/introduction/version-update/#other-changes-and-corrections)


## Examples

Demonstration Examples

* Full DataCite metadata example: [XML](example/datacite-example-full-v4.xml), [JSON](https://api.test.datacite.org/dois/10.82433/B09Z-4K37?publisher=true&affiliation=true)
* Example for Dataset resourceTypeGeneral: [XML](example/datacite-example-dataset-v4.xml), [JSON](https://api.test.datacite.org/dois/10.82433/9184-DY35?publisher=true&affiliation=true)
* Example for Instrument resourceTypeGeneral: [XML](example/datacite-example-instrument-v4.xml), [JSON](https://api.test.datacite.org/dois/10.82433/08qf-ee96?publisher=true&affiliation=true)
* Example showing multilingual metadata: [XML](example/datacite-example-multilingual-v4.xml), [JSON](https://api.test.datacite.org/dois/10.82433/byt7-2g42?publisher=true&affiliation=true)
* Examples with RelatedItem:
  * Journal article in a journal (with an ISSN): [XML](example/datacite-example-relateditem1-v4.xml), [JSON](https://api.test.datacite.org/dois/10.82433/q54d-pf76?publisher=true&affiliation=true)
  * Digitized book chapter in a book (with no identifier): [XML](example/datacite-example-relateditem2-v4.xml), [JSON](https://api.test.datacite.org/dois/10.82433/eck0-f231?publisher=true&affiliation=true)
  * Digitized book chapter in a book (with an ISBN): [XML](example/datacite-example-relateditem3-v4.xml), [JSON](https://api.test.datacite.org/dois/10.82433/4fdh-rh04?publisher=true&affiliation=true)

Live Examples (real DOIs - metadata may change)

* Example for Software resourceTypeGeneral: [XML](https://api.datacite.org/dois/application/vnd.datacite.datacite+xml/10.5281/zenodo.7635478), [JSON](https://api.datacite.org/dois/10.5281/zenodo.7635478?publisher=true&affiliation=true)
* Example with GeoLocation: [XML](https://api.datacite.org/dois/application/vnd.datacite.datacite+xml/10.1594/PANGAEA.770250), [JSON](https://api.datacite.org/dois/10.1594/PANGAEA.770250?publisher=true&affiliation=true)
* Example with (GeoLocation) Polygon: [XML](https://api.datacite.org/dois/application/vnd.datacite.datacite+xml/10.15129/3da7087a-91a3-40be-9a83-7e412156db59), [JSON](https://api.datacite.org/dois/10.15129/3da7087a-91a3-40be-9a83-7e412156db59?publisher=true&affiliation=true)
* Example with HasMetadata as related resource: [XML](https://api.datacite.org/dois/application/vnd.datacite.datacite+xml/10.26164/leopoldina_10_00390), [JSON](https://api.datacite.org/dois/10.26164/leopoldina_10_00390?publisher=true&affiliation=true)
* Example with IsIdenticalTo as related resource: [XML](https://api.datacite.org/dois/application/vnd.datacite.datacite+xml/10.5282/oph.2), [JSON](https://api.datacite.org/dois/10.5282/oph.2?publisher=true&affiliation=true)
* Example with Contributor: [XML](https://api.datacite.org/dois/application/vnd.datacite.datacite+xml/10.4228/zalf.sy6a-xt12), [JSON](https://api.datacite.org/dois/10.4228/zalf.sy6a-xt12?publisher=true&affiliation=true)
* Example for Workflow resourceTypeGeneral : [XML](https://api.datacite.org/dois/application/vnd.datacite.datacite+xml/10.48546/WORKFLOWHUB.WORKFLOW.412.1), [JSON](https://api.datacite.org/dois/10.48546/WORKFLOWHUB.WORKFLOW.412.1?publisher=true&affiliation=true)
* Example with FundingReference: [XML](https://api.datacite.org/dois/application/vnd.datacite.datacite+xml/10.5281/zenodo.47394), [JSON](https://api.datacite.org/dois/10.5281/zenodo.47394?publisher=true&affiliation=true)

