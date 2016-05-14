---
layout: default
---

## Feedback {-}

If you have any comments on

* any challenges you face with the current schema - i.e. what's not working for you?
* any ideas you have for additions that would make the schema work better for you, or
* questions you have about the schema,

please contact us via our [Google discussion group](https://groups.google.com/forum/?hl=en&#38;fromgroups#!forum/datacite-metadata). We will review the suggestions and comments on a monthly basis, and reply using this same discussion forum.

## Available Versions {-}

For our [Metadata store](https://mds.datacite.org) all these versions are valid, although only one version is considered <em>preferred</em> at any given moment of time. Starting with version 3.0 only major releases will have a new namespace.

Each incoming [Metadata store](https://mds.datacite.org) XML document should indicate the schema location in the root element.

* [DataCite Metadata Schema 4.0](meta/kernel-4/index.html) (unreleased)

* [DataCite Metadata Schema 3.1](meta/kernel-3.1/index.html) (released {{ "2014-10-16" | date: "%B %-d, %Y" }})
* [DataCite Metadata Schema 3.0](meta/kernel-3.0/index.html) (released {{ "2013-07-24" | date: "%B %-d, %Y" }})
* [DataCite Metadata Schema 2.2](meta/kernel-2.2/index.html) (released {{ "2011-07-01" | date: "%B %-d, %Y" }})
* [DataCite Metadata Schema 2.1](meta/kernel-2.1/index.html) (released {{ "2011-03-28" | date: "%B %-d, %Y" }})

## Versioning {-}

Each available version of a schema is a subdirectory containing a set of files. Those files constitute single metadata version. There are all the required xsd files, a sample xml file and a pdf documentation. The files don't reference any other files outside of their version subdirectory.

## Old Versions {-}

These versions are no longer accepted by the DataCite MDS.

* [DataCite Metadata Schema 2.0](archive/kernel-2.0/index.html) {{ "2011-01-24" | date: "%B %-d, %Y" }})

## Help {-}

If you have questions please use the [DataCite contact form](http://www.datacite.org/contact).

## Source Code {-}

This project is hosted on [GitHub](https://github.com/datacite/schema).
