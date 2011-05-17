package org.datacite.schema.test;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.datacite.schema.SchemaDirectory;
import org.datacite.schema.SchemaUtils;
import org.datacite.schema.test.junit.LabeledParameterized;
import org.datacite.schema.test.junit.LabeledParameterized.Parameters;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.w3c.dom.Document;
import org.w3c.dom.Element;

@RunWith(LabeledParameterized.class)
public class BasicTest {

    private SchemaDirectory schemaDir;

    public BasicTest(SchemaDirectory schemaDir) {
        this.schemaDir = schemaDir;
    }

    @Test
    public void testHasSchema() throws Exception {
        schemaDir.getSchemaFile();
    }

    @Test
    public void testHasValidSchema() throws Exception {
        schemaDir.getSchema();
    }
    
    @Test
    public void testSchemaNamespace() throws Exception {
        Document doc = SchemaUtils.getDocument(schemaDir.getSchemaFile());
        Element root = doc.getDocumentElement();
        String expectedNamespace = schemaDir.getExpectedSchemaNamespace();
        if (root.hasAttribute("targetNamespace")) {
            String namespace = root.getAttribute("targetNamespace");
            assertEquals(expectedNamespace, namespace);
        } else
            assertNull(expectedNamespace);
    }

    @Test
    public void testHasExamples() {
        assertFalse(schemaDir.getExamples().isEmpty());
    }
    
    @Parameters
    public static Collection<Object[]> data() {
        Collection<Object[]> data = new ArrayList<Object[]>();
        List<SchemaDirectory> schemaDirs = SchemaDirectory.getAllSchemaDirectories();
        for (SchemaDirectory schemaDir : schemaDirs)
            data.add(new Object[] { schemaDir });
        return data;
    }
    
    @Override
    public String toString() {
        return schemaDir.getDirectory().toString();
    }
}
