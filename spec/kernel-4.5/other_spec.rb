require 'spec_helper'

describe "validate other elements" do
  let(:root) { File.join(File.dirname(__FILE__), '../../source/meta/kernel-4') }
  let(:xsd) { Dir.chdir(root) { Nokogiri::XML::Schema(File.read("metadata.xsd")) }}
  let(:doc) { Dir.chdir(root) { Nokogiri::XML(File.read("example/datacite-example-full-v4.xml")) { |c| c.strict }}}

  describe "resourceType" do
    it 'missing resourceType' do
      element = doc.at("resourceType")
      element.replace ""
      errors = xsd.validate(Nokogiri::XML(doc.to_xml)).map { |error| error.to_s }
      expect(errors.length).to eq(1)
      expect(errors.first).to include("Missing child element(s). Expected is ( {http://datacite.org/schema/kernel-4}resourceType ).")
    end

    it 'missing resourceTypeGeneral' do
      element = doc.at("resourceType")
      element.replace "<resourceType/>"
      errors = xsd.validate(Nokogiri::XML(doc.to_xml)).map { |error| error.to_s }
      expect(errors.length).to eq(1)
      expect(errors.first).to include("Element '{http://datacite.org/schema/kernel-4}resourceType': The attribute 'resourceTypeGeneral' is required but missing.")
    end

    it 'missing resourceTypeGeneral with resourceType' do
      element = doc.at("resourceType")
      element.replace '<resourceType>Dataset</resourceType>'
      errors = xsd.validate(Nokogiri::XML(doc.to_xml)).map { |error| error.to_s }
      expect(errors.length).to eq(1)
      expect(errors.first).to include("Element '{http://datacite.org/schema/kernel-4}resourceType': The attribute 'resourceTypeGeneral' is required but missing.")
    end

    it 'empty resourceTypeGeneral with resourceType' do
      element = doc.at("resourceType")
      element.replace '<resourceType resourceTypeGeneral="">Dataset</resourceType>'
      errors = xsd.validate(Nokogiri::XML(doc.to_xml)).map { |error| error.to_s }
      expect(errors.length).to eq(1)
      expect(errors.last).to include("26:0: ERROR: Element '{http://datacite.org/schema/kernel-4}resourceType', attribute 'resourceTypeGeneral': [facet 'enumeration'] The value '' is not an element of the set {'Audiovisual', 'Award', 'Book', 'BookChapter', 'Collection', 'ComputationalNotebook', 'ConferencePaper', 'ConferenceProceeding', 'DataPaper', 'Dataset', 'Dissertation', 'Event', 'Image', 'Instrument', 'InteractiveResource', 'Journal', 'JournalArticle', 'Model', 'OutputManagementPlan', 'PeerReview', 'PhysicalObject', 'Preprint', 'Project', 'Report', 'Service', 'Software', 'Sound', 'Standard', 'StudyRegistration', 'Text', 'Workflow', 'Other'}.")
    end

    it 'empty resourceType' do
      element = doc.at("resourceType")
      element.replace '<resourceType resourceTypeGeneral="Dataset"></resourceType>'
      errors = xsd.validate(Nokogiri::XML(doc.to_xml)).map { |error| error.to_s }
      expect(errors).to be_empty
    end

    it 'unknown resourceTypeGeneral' do
      element = doc.at("resourceType")
      element.replace '<resourceType resourceTypeGeneral="Conference">Dataset</resourceType>'
      errors = xsd.validate(Nokogiri::XML(doc.to_xml)).map { |error| error.to_s }
      expect(errors.length).to eq(1)
      expect(errors.first).to include("26:0: ERROR: Element '{http://datacite.org/schema/kernel-4}resourceType', attribute 'resourceTypeGeneral': [facet 'enumeration'] The value 'Conference' is not an element of the set {'Audiovisual', 'Award', 'Book', 'BookChapter', 'Collection', 'ComputationalNotebook', 'ConferencePaper', 'ConferenceProceeding', 'DataPaper', 'Dataset', 'Dissertation', 'Event', 'Image', 'Instrument', 'InteractiveResource', 'Journal', 'JournalArticle', 'Model', 'OutputManagementPlan', 'PeerReview', 'PhysicalObject', 'Preprint', 'Project', 'Report', 'Service', 'Software', 'Sound', 'Standard', 'StudyRegistration', 'Text', 'Workflow', 'Other'}.")
    end

    it 'resourceTypeGeneral Book' do
      element = doc.at("resourceType")
      element.replace '<resourceType resourceTypeGeneral="Book"></resourceType>'
      errors = xsd.validate(Nokogiri::XML(doc.to_xml)).map { |error| error.to_s }
      expect(errors.length).to eq(0)
    end

    it 'resourceTypeGeneral BookChapter' do
      element = doc.at("resourceType")
      element.replace '<resourceType resourceTypeGeneral="BookChapter"></resourceType>'
      errors = xsd.validate(Nokogiri::XML(doc.to_xml)).map { |error| error.to_s }
      expect(errors.length).to eq(0)
    end

    it 'resourceTypeGeneral ComputationalNotebook' do
      element = doc.at("resourceType")
      element.replace '<resourceType resourceTypeGeneral="ComputationalNotebook"></resourceType>'
      errors = xsd.validate(Nokogiri::XML(doc.to_xml)).map { |error| error.to_s }
      expect(errors.length).to eq(0)
    end

    it 'resourceTypeGeneral ConferencePaper' do
      element = doc.at("resourceType")
      element.replace '<resourceType resourceTypeGeneral="ConferencePaper"></resourceType>'
      errors = xsd.validate(Nokogiri::XML(doc.to_xml)).map { |error| error.to_s }
      expect(errors.length).to eq(0)
    end

    it 'resourceTypeGeneral ConferenceProceeding' do
      element = doc.at("resourceType")
      element.replace '<resourceType resourceTypeGeneral="ConferenceProceeding"></resourceType>'
      errors = xsd.validate(Nokogiri::XML(doc.to_xml)).map { |error| error.to_s }
      expect(errors.length).to eq(0)
    end

    it 'resourceTypeGeneral Dissertation' do
      element = doc.at("resourceType")
      element.replace '<resourceType resourceTypeGeneral="Dissertation"></resourceType>'
      errors = xsd.validate(Nokogiri::XML(doc.to_xml)).map { |error| error.to_s }
      expect(errors.length).to eq(0)
    end

    it 'resourceTypeGeneral Journal' do
      element = doc.at("resourceType")
      element.replace '<resourceType resourceTypeGeneral="Journal"></resourceType>'
      errors = xsd.validate(Nokogiri::XML(doc.to_xml)).map { |error| error.to_s }
      expect(errors.length).to eq(0)
    end

    it 'resourceTypeGeneral JournalArticle' do
      element = doc.at("resourceType")
      element.replace '<resourceType resourceTypeGeneral="JournalArticle"></resourceType>'
      errors = xsd.validate(Nokogiri::XML(doc.to_xml)).map { |error| error.to_s }
      expect(errors.length).to eq(0)
    end

    it 'resourceTypeGeneral OutputManagementPlan' do
      element = doc.at("resourceType")
      element.replace '<resourceType resourceTypeGeneral="OutputManagementPlan"></resourceType>'
      errors = xsd.validate(Nokogiri::XML(doc.to_xml)).map { |error| error.to_s }
      expect(errors.length).to eq(0)
    end

    it 'resourceTypeGeneral PeerReview' do
      element = doc.at("resourceType")
      element.replace '<resourceType resourceTypeGeneral="PeerReview"></resourceType>'
      errors = xsd.validate(Nokogiri::XML(doc.to_xml)).map { |error| error.to_s }
      expect(errors.length).to eq(0)
    end

    it 'resourceTypeGeneral Preprint' do
      element = doc.at("resourceType")
      element.replace '<resourceType resourceTypeGeneral="Preprint"></resourceType>'
      errors = xsd.validate(Nokogiri::XML(doc.to_xml)).map { |error| error.to_s }
      expect(errors.length).to eq(0)
    end

    it 'resourceTypeGeneral Report' do
      element = doc.at("resourceType")
      element.replace '<resourceType resourceTypeGeneral="Report"></resourceType>'
      errors = xsd.validate(Nokogiri::XML(doc.to_xml)).map { |error| error.to_s }
      expect(errors.length).to eq(0)
    end

    it 'resourceTypeGeneral Standard' do
      element = doc.at("resourceType")
      element.replace '<resourceType resourceTypeGeneral="Standard"></resourceType>'
      errors = xsd.validate(Nokogiri::XML(doc.to_xml)).map { |error| error.to_s }
      expect(errors.length).to eq(0)
    end

    it 'resourceTypeGeneral Instrument' do
      element = doc.at("resourceType")
      element.replace '<resourceType resourceTypeGeneral="Instrument"></resourceType>'
      errors = xsd.validate(Nokogiri::XML(doc.to_xml)).map { |error| error.to_s }
      expect(errors.length).to eq(0)
    end

    it 'resourceTypeGeneral StudyRegistration' do
      element = doc.at("resourceType")
      element.replace '<resourceType resourceTypeGeneral="StudyRegistration"></resourceType>'
      errors = xsd.validate(Nokogiri::XML(doc.to_xml)).map { |error| error.to_s }
      expect(errors.length).to eq(0)
    end
  end

  describe "relatedItemType" do
    it 'relatedItemType Instrument' do
      related_item = doc.search("relatedItems/relatedItem").first
      related_item["relatedItemType"] = "Instrument"
      element = doc.at("relatedItems/relatedItem")
      element.replace related_item.to_s
      errors = xsd.validate(Nokogiri::XML(doc.to_xml)).map { |error| error.to_s }
      expect(errors.length).to eq(0)
    end

    it 'relatedItemType StudyRegistration' do
      related_item = doc.search("relatedItems/relatedItem").first
      related_item["relatedItemType"] = "StudyRegistration"
      element = doc.at("relatedItems/relatedItem")
      element.replace related_item.to_s
      errors = xsd.validate(Nokogiri::XML(doc.to_xml)).map { |error| error.to_s }
      expect(errors.length).to eq(0)
    end
  end

  describe "relatedIdentifier resourceTypeGeneral" do
    it 'relatedIdentifier resourceTypeGeneral Instrument' do
      related_item = doc.search("relatedIdentifiers/relatedIdentifier").first
      related_item["resourceTypeGeneral"] = "Instrument"
      element = doc.at("relatedIdentifiers/relatedIdentifier")
      element.replace related_item.to_s
      errors = xsd.validate(Nokogiri::XML(doc.to_xml)).map { |error| error.to_s }
      expect(errors.length).to eq(0)
    end

    it 'relatedIdentifier resourceTypeGeneral StudyRegistration' do
      related_item = doc.search("relatedIdentifiers/relatedIdentifier").first
      related_item["resourceTypeGeneral"] = "StudyRegistration"
      element = doc.at("relatedIdentifiers/relatedIdentifier")
      element.replace related_item.to_s
      errors = xsd.validate(Nokogiri::XML(doc.to_xml)).map { |error| error.to_s }
      expect(errors.length).to eq(0)
    end
  end

  describe "description" do
    it 'empty descriptions tag' do
      element = doc.at("descriptions")
      element.replace "<descriptions/>"
      errors = xsd.validate(Nokogiri::XML(doc.to_xml)).map { |error| error.to_s }
      expect(errors).to be_empty
    end
  end

  describe "publisher with attributes" do
    it 'publisher with attributes' do
      element = doc.at("publisher")
      expect(element.name).to eq("publisher")
      expect(element.text).to eq("Example Publisher")
      expect(element["xml:lang"]).to eq("en")
      expect(element["publisherIdentifier"]).to eq("https://ror.org/04z8jg394")
      expect(element["publisherIdentifierScheme"]).to eq("ROR")
      expect(element["schemeURI"]).to eq("https://ror.org/")
    end

    it 'publisher without attributes' do
      element = doc.at("publisher")
      element.replace '<publisher>Example Publisher</publisher>'
      errors = xsd.validate(Nokogiri::XML(doc.to_xml)).map { |error| error.to_s }
      expect(errors).to be_empty
    end
  end
end
