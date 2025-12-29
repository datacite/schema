require 'spec_helper'

describe "ancientdates example" do
  let(:root) { File.join(File.dirname(__FILE__), '../../source/meta/kernel-4') }
  let(:xsd) { Dir.chdir(root) { Nokogiri::XML::Schema(File.read("metadata.xsd")) }}
  let(:doc) { Dir.chdir(root) { Nokogiri::XML(File.read("example/datacite-example-ancientdates-v4.xml")) { |c| c.strict }}}

  it 'validates' do
    expect(doc).to pass_validation(xsd)
  end

  it 'has resourceTypeGeneral Dataset' do
    resource_type = doc.at("resourceType")
    expect(resource_type["resourceTypeGeneral"]).to eq("PhysicalObject")
    expect(resource_type.text).to eq("Coin")
  end

  it 'has dates' do
    dates = doc.search("dates")
    expect(dates.size).to eq(1)
    date = dates.first
    expect(date.text.strip).to eq("-0024/-0022")
  end

  it 'has givenName, familyName, and affiliations' do
    creators = doc.search("creator")
    expect(creators.size).to eq(1)
    creator = creators.first
    expect(creator.elements.size).to eq(2)

    creator_name = creator.elements[0]
    expect(creator_name.name).to eq("creatorName")
    expect(creator_name.text).to eq("Augustus")

    given_name = creator.elements[1]
    expect(given_name.name).to eq("nameIdentifier")
    expect(given_name.text).to eq("0000000121227317")
  end
end
