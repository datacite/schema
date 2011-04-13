package org.datacite.schema;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FilenameFilter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import javax.xml.XMLConstants;
import javax.xml.validation.Schema;
import javax.xml.validation.SchemaFactory;

import org.apache.commons.io.filefilter.SuffixFileFilter;
import org.xml.sax.SAXException;

public class SchemaDirectory {

    public final static String SCHEMAS_BASE_DIR = "schema/";
    public final static String EXAMPLE_DIR = "example/";

    File directory;

    public SchemaDirectory(File directory) throws FileNotFoundException {
        this.directory = directory;
    }
    
    public File getDirectory() {
        return directory;
    }

    public String getName() {
        return directory.getName();
    }

    private File getFile(String fileName) {
        return new File(directory, fileName);
    }

    public File getSchemaFile() {
        FilenameFilter xsdFilter = new SuffixFileFilter(".xsd");
        File[] files = directory.listFiles(xsdFilter);
        if (files.length == 0)
            throw new RuntimeException("no xsd found for " + getName());
        else if (files.length > 1)
            throw new RuntimeException("more than one xsd found for " + getName());
        else
            return files[0];
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
