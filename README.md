# DataCite Schema Repository

![Release](https://github.com/datacite/schema/workflows/Release/badge.svg)

This repository holds the official metadata schemas from DataCite as required
by the DataCite Metadata Store.

It contains the schemas itself along with examples and documentation.

## Schemas

Each schema has its own folder under `/source/meta`
e.g. `/source/meta/kernel-2.0/`. This directory is allowed to contain
only one xsd. The directory structure is as follow:

    /source/meta/{schema-name}/{filename}.xsd   root xsd
    /source/meta/{schema-name}/include/         referenced xsd files
    /source/meta/{schema-name}/example/         example xml files
    /source/meta/{schema-name}/doc/             documentation

The `/source/meta` directory will be published at http://schema.datacite.org, e.g.

    http://schema.datacite.org/meta/kernel-2.0/metadata.xsd

## Feedback

If you have any questions about the metadata schema, please contact support@datacite.org.

If you have an idea for a change to the DataCite Metadata Schema, let us know through this form: [DataCite Metadata Schema Suggestions](https://forms.gle/jeLP7AnzW5RGvuz58).

We recommend first reviewing the ideas on the [DataCite Metadata Schema Trello board](https://trello.com/b/mDWDeh20/datacite-metadata-schema) to see if a similar idea has already been proposed. If it has, you can contribute to the discussion by following the instructions on the card.

Learn more about contributing to the DataCite Metadata Schema here: [DataCite Schema - Contribute](https://schema.datacite.org/contribute.html).

## Tests

There are tests to check the directory structure, existence of examples,
validity of the schemas, and validity of the examples.

You can execute the tests via

```shell
rspec
```
