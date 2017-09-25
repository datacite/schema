require 'spec_helper'

describe "full example" do
  let(:root) { File.join(File.dirname(__FILE__), '../../source/meta/kernel-4.1') }
  let(:xsd) { Dir.chdir(root) { Nokogiri::XML::Schema(File.read("metadata.xsd")) }}
  let(:doc) { Dir.chdir(root) { Nokogiri::XML(File.read("example/datacite-example-HasMetadata-v4.1.xml")) { |c| c.strict }}}

  it 'validates' do
    expect(doc).to pass_validation(xsd)
  end

  it 'has relationType HasMetadata' do
    related_identifiers = doc.search("relatedIdentifier")
    expect(related_identifiers.size).to eq(1)
    related_identifier = related_identifiers.first
    expect(related_identifier["relationType"]).to eq("HasMetadata")
    expect(related_identifier["relatedIdentifierType"]).to eq("URL")
    expect(related_identifier["relatedMetadataScheme"]).to eq("ISA-Tab")
    expect(related_identifier["schemeURI"]).to eq("http://isatab.sourceforge.net/docs/ISA-TAB_release-candidate-1_v1.0_24nov08.pdf")
    expect(related_identifier.text).to eq("http://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE18695")
  end
end
