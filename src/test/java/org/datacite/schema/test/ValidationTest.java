package org.datacite.schema.test;

import static org.datacite.schema.test.Utils.pr;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.xml.transform.Source;
import javax.xml.transform.stream.StreamSource;
import javax.xml.validation.Schema;
import javax.xml.validation.Validator;

import org.datacite.schema.test.junit.LabeledParameterized;
import org.datacite.schema.test.junit.LabeledParameterized.Parameters;
import org.junit.Test;
import org.junit.runner.RunWith;

@RunWith(LabeledParameterized.class)
public class ValidationTest {

    private SchemaDirectory schemaDir;
    private File example;

    public ValidationTest(SchemaDirectory schemaDir, File example) {
        this.schemaDir = schemaDir;
        this.example = example;
    }

    @Test
    public void showName() throws Exception {
        pr(example);
    }

    @Test
    public void testExample() throws Exception {
        Schema schema = schemaDir.getSchema();
        Validator validator = schema.newValidator();
        Source source = new StreamSource(example);
        validator.validate(source);
    }


    @Parameters
    public static Collection<Object[]> data() {
        Collection<Object[]> data = new ArrayList<Object[]>();
        List<SchemaDirectory> schemaDirs = SchemaDirectory.getAllSchemaDirectories();
        for (SchemaDirectory schemaDir : schemaDirs)
            for (File example : schemaDir.getExamples()) 
                data.add(new Object[] { schemaDir, example });
        return data;
    }
}
