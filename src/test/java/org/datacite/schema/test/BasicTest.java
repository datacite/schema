package org.datacite.schema.test;

import static org.datacite.schema.test.Utils.pr;
import static org.junit.Assert.*;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.datacite.schema.test.junit.LabeledParameterized;
import org.datacite.schema.test.junit.LabeledParameterized.Parameters;
import org.junit.Test;
import org.junit.runner.RunWith;

@RunWith(LabeledParameterized.class)
public class BasicTest {

    private SchemaDirectory schemaDir;

    public BasicTest(SchemaDirectory schemaDir) {
        this.schemaDir = schemaDir;
    }

    @Test
    public void showName() {
        pr(schemaDir);
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
}
