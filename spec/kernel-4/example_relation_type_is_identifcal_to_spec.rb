require 'spec_helper'

describe "full example" do
  let(:root) { File.join(File.dirname(__FILE__), '../../source/meta/kernel-4') }
  let(:xsd) { Dir.chdir(root) { Nokogiri::XML::Schema(File.read("metadata.xsd")) }}
  let(:doc) { Dir.chdir(root) { Nokogiri::XML(File.read("example/datacite-example-relationTypeIsIdenticalTo-v4.0.xml")) { |c| c.strict }}}

  it 'validates' do
    expect(doc).to pass_validation(xsd)
  end

  it 'has relationType IsIdenticalTo' do
    related_identifiers = doc.search("relatedIdentifier")
    expect(related_identifiers.size).to eq(2)
    related_identifier = related_identifiers.first
    expect(related_identifier["relationType"]).to eq("IsIdenticalTo")
    expect(related_identifier["relatedIdentifierType"]).to eq("URN")
    expect(related_identifier.text).to eq("urn:nbn:de:bib-cpos-2013-02en8")
  end
end
