package controller;

import javax.xml.transform.Templates;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;
import java.io.File;

public class Translator {

    private final File inputFile;
    private final File outputFile;
    private final File xmlStylesheet = new File("src/main/resources/jpkTransformation.xsl");

    public Translator(String inputUrl, String outputUrl) {
        this.inputFile = new File(inputUrl);
        this.outputFile = new File(outputUrl);
    }

    public void transform() {
        try {

            TransformerFactory factory = TransformerFactory.newInstance();
            Templates template = factory.newTemplates(new StreamSource(xmlStylesheet));
            template.newTransformer().transform(new StreamSource(inputFile),
                    new StreamResult(outputFile));
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
}
