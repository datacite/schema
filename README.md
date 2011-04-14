DataCite Schema Repository
==========================

This repository holds the official metadata schemas from DataCite as 
required by the DataCite Metadata Store.

It contains the schemas itself along with examples and documentation.
There is also a small maven project to test the schemas for consistency.

Schemas
-------

Each schema has its own folder under `/schema` e.g. `/schema/kernel-2.0/`. 
This directory is allowed to contain only one xsd.
The directory structure is as follow:

    /schema/{schema-name}/{filename}.xsd   root xsd
    /schema/{schema-name}/include/         referenced xsd's
    /schema/{schema-name}/example/         example xml files
    /schema/{schema-name}/doc/             documentation (pdf's)
    
The `/schema` directory will be published (as root) at http://schema.datacite.org, e.g.

    http://schema.datacite.org/kernel-2.0/metadata.xsd

Tests
-----

There a tests to check the directory structure, existence of examples,
validity of the schemas, and validity of the examples.  

You can execute the tests via

    mvn test




   