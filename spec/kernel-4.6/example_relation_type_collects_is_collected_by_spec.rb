require 'spec_helper'

describe "full example" do
  let(:root) { File.join(File.dirname(__FILE__), '../../source/meta/kernel-4.6') }
  let(:xsd) { Dir.chdir(root) { Nokogiri::XML::Schema(File.read("metadata.xsd")) }}
  let(:doc) { Dir.chdir(root) { Nokogiri::XML(File.read("example/datacite-example-full-v4.xml")) { |c| c.strict }}}

  it 'validates' do
    expect(doc).to pass_validation(xsd)
  end

  describe "relatedIdentifier" do
    it 'has relationType Collects' do
      related_identifiers = doc.search("relatedIdentifier[@relationType='Collects']")
      expect(related_identifiers.size).to eq(1)
      related_identifier = related_identifiers.first
      expect(related_identifier["relationType"]).to eq("Collects")
      expect(related_identifier["relatedIdentifierType"]).to eq("DOI")
      expect(related_identifier["resourceTypeGeneral"]).to eq("Other")
      expect(related_identifier.text).to eq("10.1016/j.epsl.2011.11.037")
    end

    it 'has relationType IsPublishedIn' do
      related_identifiers = doc.search("relatedIdentifier[@relationType='IsPublishedIn']")
      expect(related_identifiers.size).to eq(1)
      related_identifier = related_identifiers.first
      expect(related_identifier["relationType"]).to eq("IsPublishedIn")
      expect(related_identifier["relatedIdentifierType"]).to eq("RRID")
      expect(related_identifier["resourceTypeGeneral"]).to eq("Model")
      expect(related_identifier.text).to eq("RRID:SCR_014641")  
    end

    it 'has relationType IsSupplementedBy' do
      related_identifiers = doc.search("relatedIdentifier[@relationType='IsSupplementedBy']")
      expect(related_identifiers.size).to eq(1)
      related_identifier = related_identifiers.first
      expect(related_identifier["relationType"]).to eq("IsSupplementedBy")
      expect(related_identifier["relatedIdentifierType"]).to eq("CSTR")
      expect(related_identifier["resourceTypeGeneral"]).to eq("BookChapter")
      expect(related_identifier.text).to eq("31253.11.sciencedb.13238")  
    end

    it 'has relationType IsCollectedBy' do
      related_identifiers = doc.search("relatedIdentifier[@relationType='IsCollectedBy']")
      expect(related_identifiers.size).to eq(1)
      related_identifier = related_identifiers.first
      expect(related_identifier["relationType"]).to eq("IsCollectedBy")
      expect(related_identifier["relatedIdentifierType"]).to eq("DOI")
      expect(related_identifier["resourceTypeGeneral"]).to eq("Other")
      expect(related_identifier.text).to eq("10.1016/j.epsl.2011.11.037")  
    end
  end

  describe "relatedItem" do
    it 'has relationType Collects' do
      related_item = doc.search("relatedItems/relatedItem").first
      related_item["relationType"] = "Collects"
      element = doc.at("relatedItems/relatedItem")
      element.replace related_item.to_s
      errors = xsd.validate(Nokogiri::XML(doc.to_xml)).map { |error| error.to_s }
      expect(errors.length).to eq(0)
    end

    it 'has relationType IsCollectedBy' do
      related_item = doc.search("relatedItems/relatedItem").first
      related_item["relationType"] = "IsCollectedBy"
      element = doc.at("relatedItems/relatedItem")
      element.replace related_item.to_s
      errors = xsd.validate(Nokogiri::XML(doc.to_xml)).map { |error| error.to_s }
      expect(errors.length).to eq(0)
    end
  end
end
