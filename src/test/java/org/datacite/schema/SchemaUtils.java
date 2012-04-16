package org.datacite.schema;

import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import javax.xml.XMLConstants;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.apache.commons.lang.StringUtils;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.xml.sax.SAXException;

public class SchemaUtils {
    
    public static Document getDocument(File file) throws ParserConfigurationException, SAXException, IOException {
        DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
        dbf.setNamespaceAware(true);
        DocumentBuilder db = dbf.newDocumentBuilder();
        Document doc = db.parse(file);
        return doc;
    }
    
    public static String getNamespace(Document doc) {
        return doc.getDocumentElement().getNamespaceURI();
    }
    
    public static String getSchemaLocation(Document doc) {
        String location = null;
        Element root = doc.getDocumentElement();
        String rootNamespace = root.getNamespaceURI();

        if (StringUtils.isEmpty(rootNamespace)) {
            location = root.getAttributeNS(XMLConstants.W3C_XML_SCHEMA_INSTANCE_NS_URI, "noNamespaceSchemaLocation");
        } else {
            String locations = root.getAttributeNS(XMLConstants.W3C_XML_SCHEMA_INSTANCE_NS_URI, "schemaLocation");
            location = getLocationForNamespace(rootNamespace, locations);
        }

        if (location == null)
            throw new RuntimeException("cannot find schema location");
        else
            return location;
    }

    private static String getLocationForNamespace(String rootNamespace, String locationAttr) {
        String[] locations = StringUtils.split(locationAttr);
        int maxIndex = locations.length - 1;
        for (int i = 0; i < maxIndex; i += 2) {
            String ns = locations[i];
            String uri = locations[i + 1];
            if (StringUtils.equals(rootNamespace, ns))
                return uri;
        }
        return null;
    }
    
    public static List<File> getFiles(File directory) {
        File[] files = directory.listFiles();
        if (files == null)
            return Collections.EMPTY_LIST;
        List<File> list = Arrays.asList(files);
        return list;
    }

}
