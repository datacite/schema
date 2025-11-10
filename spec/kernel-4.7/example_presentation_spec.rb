require 'spec_helper'

describe "presentation example" do
  let(:root) { File.join(File.dirname(__FILE__), '../../source/meta/kernel-4') }
  let(:xsd) { Dir.chdir(root) { Nokogiri::XML::Schema(File.read("metadata.xsd")) }}
  let(:doc) { Dir.chdir(root) { Nokogiri::XML(File.read("example/datacite-example-presentation-v4.xml")) { |c| c.strict }}}

  it 'validates' do
    expect(doc).to pass_validation(xsd)
  end

  it 'has resourceTypeGeneral Poster' do
    resource_type = doc.at("resourceType")
    expect(resource_type["resourceTypeGeneral"]).to eq("Presentation")
    expect(resource_type.text).to eq("Conference presentation")
  end

  it 'has relatedIdentifier with relationType Other and relationTypeInformation' do
    related_identifier = doc.search("relatedIdentifiers/relatedIdentifier").first
    expect(related_identifier['relationType']).to eq('Other')
    expect(related_identifier['relationTypeInformation']).to eq('is output of')
  end
end
