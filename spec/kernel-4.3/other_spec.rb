require 'spec_helper'

describe "validate other elements" do
  let(:root) { File.join(File.dirname(__FILE__), '../../source/meta/kernel-4.3') }
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
      expect(errors.last).to eq("47:0: ERROR: Element '{http://datacite.org/schema/kernel-4}resourceType', attribute 'resourceTypeGeneral': [facet 'enumeration'] The value '' is not an element of the set {'Audiovisual', 'Collection', 'DataPaper', 'Dataset', 'Event', 'Image', 'InteractiveResource', 'Model', 'PhysicalObject', 'Service', 'Software', 'Sound', 'Text', 'Workflow', 'Other'}.")
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
      expect(errors.first).to include("The value 'Conference' is not an element of the set {'Audiovisual', 'Collection', 'DataPaper', 'Dataset', 'Event', 'Image', 'InteractiveResource', 'Model', 'PhysicalObject', 'Service', 'Software', 'Sound', 'Text', 'Workflow', 'Other'}.")
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
end
