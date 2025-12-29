require 'spec_helper'

describe "pure example" do
  let(:root) { File.join(File.dirname(__FILE__), '../../source/meta/kernel-4') }
  let(:xsd) { Dir.chdir(root) { Nokogiri::XML::Schema(File.read("metadata.xsd")) }}
  let(:doc) { Dir.chdir(RSPEC_ROOT) {Nokogiri::XML(File.read("fixtures/pure-example.xml")) { |c| c.strict }}}

  it 'validates' do
    expect(doc).to pass_validation(xsd)
  end

  it 'has resourceTypeGeneral Dataset' do
    resource_type = doc.at("resourceType")
    expect(resource_type["resourceTypeGeneral"]).to eq("Dataset")
    expect(resource_type.text).to eq("Dataset")
  end

  it 'has givenName, familyName, and affiliations' do
    creators = doc.search("creator")
    expect(creators.size).to eq(1)
    creator = creators.first
    expect(creator.elements.size).to eq(4)

    creator_name = creator.elements[0]
    expect(creator_name.name).to eq("creatorName")
    expect(creator_name.text).to eq("Barbosa, Miguel")

    given_name = creator.elements[1]
    expect(given_name.name).to eq("givenName")
    expect(given_name.text).to eq("Miguel")

    family_name = creator.elements[2]
    expect(family_name.name).to eq("familyName")
    expect(family_name.text).to eq("Barbosa")

    affiliation = creator.elements[3]
    expect(affiliation.name).to eq("affiliation")
    expect(affiliation.text).to eq("School of Biology")
  end
end
