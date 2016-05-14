require 'spec_helper'

describe "full example" do
  let(:root) { File.join(File.dirname(__FILE__), '../../meta/kernel-4') }
  let(:xsd) { Dir.chdir(root) { Nokogiri::XML::Schema(File.read("metadata.xsd")) }}
  let(:doc) { Dir.chdir(root) { Nokogiri::XML(File.read("example/datacite-example-full-v4.0.xml")) { |c| c.strict }}}

  it 'validates' do
    expect(doc).to pass_validation(xsd)
  end

  it 'has givenName and familyName' do
    creators = doc.search("creator")
    expect(creators.size).to eq(1)
    creator = creators.first
    expect(creator.elements.size).to eq(5)

    creator_name = creator.elements[0]
    expect(creator_name.name).to eq("creatorName")
    expect(creator_name.text).to eq("Miller, Elizabeth")

    given_name = creator.elements[1]
    expect(given_name.name).to eq("givenName")
    expect(given_name.text).to eq("Elizabeth")

    family_name = creator.elements[2]
    expect(family_name.name).to eq("familyName")
    expect(family_name.text).to eq("Miller")

    name_identifier = creator.elements[3]
    expect(name_identifier.name).to eq("nameIdentifier")
    expect(name_identifier["schemeURI"]).to eq("http://orcid.org/")
    expect(name_identifier["nameIdentifierScheme"]).to eq("ORCID")
    expect(name_identifier.text).to eq("0000-0001-5000-0007")
  end
end
