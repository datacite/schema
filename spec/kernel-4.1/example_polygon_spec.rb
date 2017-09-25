require 'spec_helper'

describe "full example" do
  let(:root) { File.join(File.dirname(__FILE__), '../../source/meta/kernel-4.1') }
  let(:xsd) { Dir.chdir(root) { Nokogiri::XML::Schema(File.read("metadata.xsd")) }}
  let(:doc) { Dir.chdir(root) { Nokogiri::XML(File.read("example/datacite-example-polygon-v4.1.xml")) { |c| c.strict }}}

  it 'validates' do
    expect(doc).to pass_validation(xsd)
  end

  it 'has resourceTypeGeneral Dataset' do
    resource_type = doc.at("resourceType")
    expect(resource_type["resourceTypeGeneral"]).to eq("Dataset")
    expect(resource_type.text).to eq("Dataset")
  end

  it 'has geoLocationPolygon' do
    polygon_points = doc.search("polygonPoint")
    expect(polygon_points.size).to eq(34)
    geo_location_point = polygon_points.first
    expect(geo_location_point.elements[0].name).to eq("pointLongitude")
    expect(geo_location_point.elements[0].text).to eq("4.1738852605822")
    expect(geo_location_point.elements[1].name).to eq("pointLatitude")
    expect(geo_location_point.elements[1].text).to eq("52.03913926329928")
  end
end
