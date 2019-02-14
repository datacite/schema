require 'spec_helper'

describe "full example" do
  let(:root) { File.join(File.dirname(__FILE__), '../../source/meta/kernel-4.2') }
  let(:xsd) { Dir.chdir(root) { Nokogiri::XML::Schema(File.read("metadata.xsd")) }}
  let(:doc) { Dir.chdir(root) { Nokogiri::XML(File.read("example/datacite-example-Box_dateCollected_DataCollector-v4.xml")) { |c| c.strict }}}

  it 'validates' do
    expect(doc).to pass_validation(xsd)
  end

  it 'has dateType Collected' do
    dates = doc.search("date")
    expect(dates.size).to eq(1)
    date = dates.first
    expect(date["dateType"]).to eq("Collected")
    expect(date.text).to eq("1961-06-01/1962-10-12")
  end

  it 'has contributor DataCollector' do
    contributors = doc.search("contributor")
    expect(contributors.size).to eq(1)
    contributor = contributors.first
    expect(contributor["contributorType"]).to eq("DataCollector")
    contributor_name = contributor.first_element_child
    expect(contributor_name.name).to eq("contributorName")
    expect(contributor_name.text).to eq("Pomegranate, B.")
  end

  it 'has geoLocationBox' do
    geo_locations = doc.search("geoLocation")
    expect(geo_locations.size).to eq(1)
    geo_location = geo_locations.first
    expect(geo_location.elements.size).to eq(2)
    geo_location_place = geo_location.first_element_child
    expect(geo_location_place.name).to eq("geoLocationPlace")
    expect(geo_location_place.text).to eq("Ponhook Lake, Nova Scotia")
    geo_location_box = geo_location.last_element_child
    expect(geo_location_box.name).to eq("geoLocationBox")
    expect(geo_location_box.elements[0].name).to eq("westBoundLongitude")
    expect(geo_location_box.elements[0].text).to eq("-64.2")
    expect(geo_location_box.elements[1].name).to eq("eastBoundLongitude")
    expect(geo_location_box.elements[1].text).to eq("-63.8")
    expect(geo_location_box.elements[2].name).to eq("southBoundLatitude")
    expect(geo_location_box.elements[2].text).to eq("44.7167")
    expect(geo_location_box.elements[3].name).to eq("northBoundLatitude")
    expect(geo_location_box.elements[3].text).to eq("44.9667")
  end
end
