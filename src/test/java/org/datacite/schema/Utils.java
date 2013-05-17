package org.datacite.schema;

import java.io.File;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import org.apache.commons.io.FileUtils;

public class Utils {

    public static List<File> getFiles(File directory) {
        return (List<File>) FileUtils.listFiles(directory, null, true);
    }

    public static void sortFileList(List<File> files) {
        Collections.sort(files, new Comparator<File>() {
            @Override
            public int compare(File file1, File file2) {
                return file1.compareTo(file2);
            }
        });
    }
}
