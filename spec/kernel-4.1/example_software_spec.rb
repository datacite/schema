require 'spec_helper'

describe "full example" do
  let(:root) { File.join(File.dirname(__FILE__), '../../source/meta/kernel-4.1') }
  let(:xsd) { Dir.chdir(root) { Nokogiri::XML::Schema(File.read("metadata.xsd")) }}
  let(:doc) { Dir.chdir(root) { Nokogiri::XML(File.read("example/datacite-example-software-v4.1.xml")) { |c| c.strict }}}

  it 'validates' do
    expect(doc).to pass_validation(xsd)
  end

  it 'has resourceTypeGeneral Software' do
    resource_type = doc.at("resourceType")
    expect(resource_type["resourceTypeGeneral"]).to eq("Software")
    expect(resource_type.text).to eq("Software")
  end

  it 'has relationType IsVersionOf' do
    related_identifiers = doc.search("relatedIdentifier")
    expect(related_identifiers.size).to eq(2)
    related_identifier = related_identifiers.last
    expect(related_identifier["relationType"]).to eq("IsVersionOf")
    expect(related_identifier["relatedIdentifierType"]).to eq("DOI")
    expect(related_identifier.text).to eq("doi:10.5072/example-software-repository")
  end

  it 'has rights GNU Public License' do
    rights = doc.at("rights")
    expect(rights["rightsURI"]).to eq("https://opensource.org/licenses/GPL-3.0")
    expect(rights.text).to eq("GNU General Public License version 3")
  end
end
