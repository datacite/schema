package org.datacite.schema.test;

import static org.junit.Assert.assertEquals;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.apache.commons.exec.CommandLine;
import org.apache.commons.exec.DefaultExecutor;
import org.apache.commons.exec.ExecuteException;
import org.apache.commons.io.FileUtils;
import org.datacite.schema.Utils;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.Parameterized;
import org.junit.runners.Parameterized.Parameters;

/**
 * Html Validator. Requires external program "tidy" (http://tidy.sourceforge.net/).
 *
 * @author peterss
 *
 */
@RunWith(Parameterized.class)
public class HtmlTest {

    private File file;

    public HtmlTest(File file) {
        this.file = file;
    }

    @Test
    public void testIndexHtmlIsValid() throws ExecuteException, IOException {
        CommandLine cmdLine = CommandLine.parse("tidy");
        cmdLine.addArguments(new String[] {"-output", "/dev/null", "-quiet"});
        cmdLine.addArgument(file.getAbsolutePath());
        DefaultExecutor executor = new DefaultExecutor();
        int exitValue = executor.execute(cmdLine);
        assertEquals(0, exitValue);
    }


    @Parameters(name="{0}")
    public static Collection<Object[]> data() {
        File directory = new File("_site/");
        Collection<Object[]> data = new ArrayList<Object[]>();
        List<File> files = (List<File>) FileUtils.listFiles(directory, new String[] { "html" }, true);
        Utils.sortFileList(files);
        for (File file : files)
            data.add(new Object[] { file });
        return data;
    }

}
