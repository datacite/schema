package org.datacite.schema;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FilenameFilter;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.List;

import javax.xml.XMLConstants;
import javax.xml.validation.Schema;
import javax.xml.validation.SchemaFactory;

import org.apache.commons.io.filefilter.SuffixFileFilter;
import org.xml.sax.SAXException;

public class SchemaDirectory {

    public final static String SCHEMAS_BASE_DIR = "source/meta/";
    public final static String EXAMPLE_DIR = "example/";
    public final static String DOC_DIR = "doc/";
    public final static String INDEX_HTML = "index.html";

    public final static String SCHEMA_SERVER_BASE_URL = "http://schema.datacite.org";
    public final static String SCHEMA_NAMESPACE_BASE = "http://datacite.org/schema/";

    public final static String SCHEMA_WITHOUT_NAMESPACE = "kernel-2.0";

    File directory;

    public SchemaDirectory(File directory) throws FileNotFoundException {
        this.directory = directory;
        if (!directory.exists())
            throw new FileNotFoundException(directory.getPath());
    }

    public SchemaDirectory(String name) throws FileNotFoundException {
        this(new File(SCHEMAS_BASE_DIR + name));
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

    private List<File> getFiles(String directory) {
        return Utils.getFiles(getFile(directory));
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

    public String getExpectedSchemaLocation() {
        String path;
        path = getMajorSchema().getSchemaFile().getPath();
        String url = path.replaceFirst("build", SCHEMA_SERVER_BASE_URL);
        return url;
    }

    public String getExpectedSchemaNamespace() {
        if (getName().equals(SCHEMA_WITHOUT_NAMESPACE))
            return null;
        else
            return SCHEMA_NAMESPACE_BASE + getMajorSchema().getName();
    }

    /*
     * retrieves the corresponding major schema directory
     * if it exists explicitly
     *
     * example:
     *
     * if major schema version 3 exists, then root of 3.1 is 3
     * if major schema version 2 does not exists, then root of 2.1 is 2
     */
    public SchemaDirectory getMajorSchema() {
        String majorName = getName().replaceFirst("\\.[0-9]+$", "");
        try {
            return new SchemaDirectory(majorName);
        } catch (FileNotFoundException e) {
            return this;
        }
    }

    public List<File> getExamples() {
        return getFiles(EXAMPLE_DIR);
    }

    public List<File> getDocs() {
        return getFiles(DOC_DIR);
    }

    public File getIndexHtml() {
        return getFile(INDEX_HTML);
    }

    public static List<SchemaDirectory> getAllSchemaDirectories() {
        File baseDir = new File(SCHEMAS_BASE_DIR);
        File[] dirs = baseDir.listFiles();
        List<SchemaDirectory> schemaDirectories = new ArrayList<SchemaDirectory>();
        for (File dir : dirs)
            try {
                if (!Files.isSymbolicLink(dir.toPath()))
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
