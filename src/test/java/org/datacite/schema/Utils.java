package org.datacite.schema;

import java.io.File;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

public class Utils {

    public static List<File> getFiles(File directory) {
        File[] files = directory.listFiles();
        if (files == null)
            return Collections.EMPTY_LIST;
        List<File> list = Arrays.asList(files);
        return list;
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
