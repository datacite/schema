---
layout: index
title: DataCite Metadata Schema
---

## Feedback

If you have any comments on

* any challenges you face with the current schema - i.e. what's not working for you?
* any ideas you have for additions that would make the schema work better for you, or
* questions you have about the schema,

please contact us via our [Google discussion group](https://groups.google.com/forum/?hl=en&#38;fromgroups#!forum/datacite-metadata). We will review the suggestions and comments on a monthly basis, and reply using this same discussion forum.

## Schema Versions

For our [Metadata store](https://mds.datacite.org) all these versions are valid, although only one version is considered *preferred* at any given moment of time. Starting with version 3.0 only major releases will have a new namespace.

The version number is formatted as: *Major*.*Minor*

* **Major Version** — A major release is for adding features that require breaking backward
  compatibility with previous versions or represent fundamental changes. For a major release, the MAJOR component is incremented by one and the MINOR component is set to zero, e.g. 3.1 to 4.0.
* **Minor Version** — A minor release is for adding features that do not break backward
  compatibility with previous versions and for fixing bugs that may or may not break backwards compatibility. For a minor release, the MINOR component is incremented by one, e.g. 3.0 to 3.1.

Each incoming [Metadata store](https://mds.datacite.org) XML document should indicate the schema location in the root element.

Each available version of a schema is a subdirectory containing a set of files. These files constitute a single metadata version. They include all the required xsd files, sample xml files and documentation. The files don't reference any other files outside of their version subdirectory.

## Obsolete Versions

These versions are no longer accepted by the DataCite MDS.

* [DataCite Metadata Schema 2.0](archive/kernel-2.0/index.html) (<%= Date.parse("2011-01-24").strftime("%-d %b %Y") %>)

## Help

If you have questions please use the [DataCite contact form](http://www.datacite.org/contact).

## Source Code

This project is hosted on [GitHub](https://github.com/datacite/schema).
