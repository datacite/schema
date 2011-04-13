package org.datacite.schema.test;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import javax.xml.XMLConstants;
import javax.xml.validation.Schema;
import javax.xml.validation.SchemaFactory;

import org.xml.sax.SAXException;

public class SchemaDirectory {

    public final static String SCHEMAS_BASE_DIR = "schema/";
    public final static String EXAMPLE_DIR = "example/";
    public final static String XSD_NAME = "metadata.xsd";

    File directory;

    public SchemaDirectory(File directory) throws FileNotFoundException {
        this.directory = directory;
    }

    public String getName() {
        return directory.getName();
    }
    
    private File getFile(String fileName) {
        return new File(directory, fileName);
    }

    private File getSchemaFile() {
        return getFile(XSD_NAME);
    }

    public Schema getSchema() throws SAXException {
        SchemaFactory schemaFactory = SchemaFactory.newInstance(XMLConstants.W3C_XML_SCHEMA_NS_URI);
        File schemaFile = getSchemaFile();
        Schema schema = schemaFactory.newSchema(schemaFile);
        return schema;
    }

    public List<File> getExamples() {
        File exampleDir = getFile(EXAMPLE_DIR);
        File[] files = exampleDir.listFiles();
        if (files == null)
            return Collections.EMPTY_LIST;
        List<File> list = Arrays.asList(files);
        return list;
    }

    public static List<SchemaDirectory> getAllSchemaDirectories() {
        File baseDir = new File(SCHEMAS_BASE_DIR);
        File[] dirs = baseDir.listFiles();
        List<SchemaDirectory> schemaDirectories = new ArrayList<SchemaDirectory>();
        for (File dir : dirs)
            try {
                schemaDirectories.add(new SchemaDirectory(dir));
            } catch (FileNotFoundException e) {
            }
        return schemaDirectories;
    }

    @Override
    public String toString() {
        return "SchemaDirectory [name=" + getName() + "]";
    }

}
