require 'spec_helper'

describe "full example" do
  let(:root) { File.join(File.dirname(__FILE__), '../../source/meta/kernel-4') }
  let(:xsd) { Dir.chdir(root) { Nokogiri::XML::Schema(File.read("metadata.xsd")) }}
  let(:doc) { Dir.chdir(root) { Nokogiri::XML(File.read("../../../spec/fixtures/example-schema-documentation.xml")) { |c| c.strict }}}

  it 'validates' do
    expect(doc).to pass_validation(xsd)
  end

  it 'has one creator' do
    creators = doc.search("creator")
    expect(creators.size).to eq(1)
    creator = creators.first
    expect(creator.elements.size).to eq(1)

    creator_name = creator.elements[0]
    expect(creator_name.name).to eq("creatorName")
    expect(creator_name.text).to eq("DataCite Metadata Working Group")
  end
end
