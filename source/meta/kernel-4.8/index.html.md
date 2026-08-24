---
title: DataCite Metadata Schema 4.8
version: 4.8
date: 2026-12-31
layout: schema
schema_url: /meta/kernel-4.8/metadata.xsd
documentation_url: https://datacite-metadata-schema.readthedocs.io/en/4.8/
---

## Documentation
DataCite Metadata Working Group. (2026). DataCite Metadata Schema Documentation for the Publication and Citation of Research Data and Other Research Outputs. Version 4.8. DataCite e.V. [https://doi.org/10.14454/kwsj-rh55](https://doi.org/10.14454/kwsj-rh55)

<div class="text-center"><a href="https://datacite-metadata-schema.readthedocs.io/en/4.8/" class="btn">Access documentation</a></div>
<br>
<div class="text-center"><a href="https://datacite-metadata-schema.readthedocs.io/_/downloads/en/4.8/pdf/" class="btn">Download PDF</a></div>

## Schema
DataCite Metadata Working Group. (2026). DataCite Metadata Schema for the Publication and Citation of Research Data and Other Research Outputs. Version 4.8. DataCite e.V. [https://doi.org/10.14454/hdw9-et53](https://doi.org/10.14454/hdw9-et53)

<div class="text-center"><a href="metadata.xsd" class="btn">View XSD</a></div>

## Changes

### See [Version 4.8 Update](https://datacite-metadata-schema.readthedocs.io/en/4.8/introduction/version-update) for full details.


* Addition of a new Distribution property
* Addition of a new Access property
* Addition of new resourceTypeGeneral value: BlogPost
* Addition of new relatedIdentifierType value: PatentNUmber
* Addition of new relationType pair: IsOutputOf and HasOutput
* Addition of new contributorType value: Reviewer 


## Examples - FIXME

Demonstration Examples

* Full DataCite metadata example: [XML](example/datacite-example-full-v4.xml), [JSON](https://api.test.datacite.org/dois/10.82433/B09Z-4K37?publisher=true&affiliation=true)
* Example for Dataset resourceTypeGeneral: [XML](example/datacite-example-dataset-v4.xml), [JSON](https://api.test.datacite.org/dois/10.82433/9184-DY35?publisher=true&affiliation=true)
* Example for Poster resourceTypeGeneral: [XML](example/datacite-example-poster-v4.xml), [JSON](https://api.test.datacite.org/dois/10.82433/q80x-4z58?publisher=true&affiliation=true)
* Example for Presentation resourceTypeGeneral: [XML](example/datacite-example-presentation-v4.xml), [JSON](https://api.test.datacite.org/dois/10.82433/v14f-gk24?publisher=true&affiliation=true)
* Example for Audiovisual resourceTypeGeneral: [XML](example/datacite-example-audiovisual-v4.xml), [JSON](https://api.test.datacite.org/dois/10.82433/9jbk-4c28?publisher=true&affiliation=true)
* Example for Award resourceTypeGeneral: [XML](example/datacite-example-award-v4.xml), [JSON](https://api.test.datacite.org/dois/10.82433/p1zt-4c67?publisher=true&affiliation=true)
* Example for Project resourceTypeGeneral: [XML](example/datacite-example-project-v4.xml), [JSON](https://api.test.datacite.org/dois/10.82433/84dj-am41?publisher=true&affiliation=true)
* Example for relationTypeInformation attribute with relationType "Other": [XML](example/datacite-example-relationtypeinformation-v4.xml), [JSON](https://api.test.datacite.org/dois/10.82433/0320-9g16?publisher=true&affiliation=true)
* Example for Coverage dateType: [XML](example/datacite-example-coverage-v4.xml), [JSON](https://api.test.datacite.org/dois/10.82433/pgk2-ar97?publisher=true&affiliation=true)
* Example connecting a translation to the original work:
    * Example of a translation: [XML](example/datacite-example-translation-translated-v4.xml), [JSON](https://api.test.datacite.org/dois/10.82433/45e5-xy14?publisher=true&affiliation=true)
    * Example of the original (translated) work: [XML](example/datacite-example-translation-original-v4.xml), [JSON](https://api.test.datacite.org/dois/10.82433/pma6-nf93?publisher=true&affiliation=true)
* Example of a document containing two languages in parallel: [XML](example/datacite-example-parallel-languages-v4.xml), [JSON](https://api.test.datacite.org/dois/10.82433/4r08-sa38?publisher=true&affiliation=true)
* Example showing multilingual metadata: [XML](example/datacite-example-multilingual-v4.xml), [JSON](https://api.test.datacite.org/dois/10.82433/byt7-2g42?publisher=true&affiliation=true)
* Example with embargo date: [XML](example/datacite-example-embargo-v4.xml), [JSON](https://api.test.datacite.org/dois/10.82433/13mc-zr18?publisher=true&affiliation=true)
* Examples with RelatedItem:
    * Journal article in a journal (with an ISSN): [XML](example/datacite-example-relateditem1-v4.xml), [JSON](https://api.test.datacite.org/dois/10.82433/q54d-pf76?publisher=true&affiliation=true)
    * Digitized book chapter in a book (with no identifier): [XML](example/datacite-example-relateditem2-v4.xml), [JSON](https://api.test.datacite.org/dois/10.82433/eck0-f231?publisher=true&affiliation=true)
    * Digitized book chapter in a book (with an ISBN): [XML](example/datacite-example-relateditem3-v4.xml), [JSON](https://api.test.datacite.org/dois/10.82433/4fdh-rh04?publisher=true&affiliation=true)
* Example with Distribution and Access: [XML](example/datacite-example-distribution-access-v4.xml), [JSON](https://api.test.datacite.org/dois/10.82433/gn9x-q865?publisher=true&affiliation=true)

Live Examples (real DOIs - metadata may change)

* Example for Software resourceTypeGeneral: [XML](https://api.datacite.org/dois/application/vnd.datacite.datacite+xml/10.5281/zenodo.7635478), [JSON](https://api.datacite.org/dois/10.5281/zenodo.7635478?publisher=true&affiliation=true)
* Example for BlogPost resourceTypeGeneral: [XML](https://api.datacite.org/dois/application/vnd.datacite.datacite+xml/10.5438/6qc3-bz91), [JSON](https://api.datacite.org/dois/10.5438/6qc3-bz91?affiliation=true&publisher=true)
* Example with GeoLocation: [XML](https://api.datacite.org/dois/application/vnd.datacite.datacite+xml/10.1594/PANGAEA.770250), [JSON](https://api.datacite.org/dois/10.1594/PANGAEA.770250?publisher=true&affiliation=true)
* Example with (GeoLocation) Polygon: [XML](https://api.datacite.org/dois/application/vnd.datacite.datacite+xml/10.15129/3da7087a-91a3-40be-9a83-7e412156db59), [JSON](https://api.datacite.org/dois/10.15129/3da7087a-91a3-40be-9a83-7e412156db59?publisher=true&affiliation=true)
* Example with HasMetadata as related resource: [XML](https://api.datacite.org/dois/application/vnd.datacite.datacite+xml/10.26164/leopoldina_10_00390), [JSON](https://api.datacite.org/dois/10.26164/leopoldina_10_00390?publisher=true&affiliation=true)
* Example with IsIdenticalTo as related resource: [XML](https://api.datacite.org/dois/application/vnd.datacite.datacite+xml/10.5282/oph.2), [JSON](https://api.datacite.org/dois/10.5282/oph.2?publisher=true&affiliation=true)
* Example with Contributor: [XML](https://api.datacite.org/dois/application/vnd.datacite.datacite+xml/10.4228/zalf.sy6a-xt12), [JSON](https://api.datacite.org/dois/10.4228/zalf.sy6a-xt12?publisher=true&affiliation=true)
* Example for Workflow resourceTypeGeneral : [XML](https://api.datacite.org/dois/application/vnd.datacite.datacite+xml/10.48546/WORKFLOWHUB.WORKFLOW.412.1), [JSON](https://api.datacite.org/dois/10.48546/WORKFLOWHUB.WORKFLOW.412.1?publisher=true&affiliation=true)
* Example with FundingReference: [XML](https://api.datacite.org/dois/application/vnd.datacite.datacite+xml/10.5281/zenodo.47394), [JSON](https://api.datacite.org/dois/10.5281/zenodo.47394?publisher=true&affiliation=true)
* Example of a blog post published simultaneously in two languages:
    * Blog post in Spanish: [XML](https://api.datacite.org/dois/application/vnd.datacite.datacite+xml/10.5438/S7C0-Y897), [JSON](https://api.datacite.org/dois/10.5438/S7C0-Y897?publisher=true&affiliation=true)
    * Blog post in English: [XML](https://api.datacite.org/dois/application/vnd.datacite.datacite+xml/10.5438/1HG2-BF13), [JSON](https://api.datacite.org/dois/10.5438/1HG2-BF13?publisher=true&affiliation=true)
