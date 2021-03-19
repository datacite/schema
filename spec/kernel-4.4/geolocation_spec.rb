require 'spec_helper'

describe "validate geoLocation" do
  let(:root) { File.join(File.dirname(__FILE__), '../../source/meta/kernel-4') }
  let(:xsd) { Dir.chdir(root) { Nokogiri::XML::Schema(File.read("metadata.xsd")) }}
  let(:doc) { Dir.chdir(root) { Nokogiri::XML(File.read("example/datacite-example-GeoLocation-v4.xml")) { |c| c.strict }}}

  it 'empty geoLocations tag' do
    element = doc.at("geoLocations")
    element.replace "<geoLocations/>"
    errors = xsd.validate(Nokogiri::XML(doc.to_xml)).map { |error| error.to_s }
    expect(errors).to be_empty
  end

  it 'geoLocationPoint' do
    element = doc.at("geoLocations")
    element.replace (<<-EOT)
      <geoLocations>
        <geoLocation>
          <geoLocationPoint>
            <pointLongitude>-52.000000</pointLongitude>
            <pointLatitude>69.000000</pointLatitude>
          </geoLocationPoint>
        </geoLocation>
      </geoLocations>
    EOT
    errors = xsd.validate(Nokogiri::XML(doc.to_xml)).map { |error| error.to_s }
    expect(errors).to be_empty
  end

  it 'multiple geoLocationPoint' do
    element = doc.at("geoLocations")
    element.replace (<<-EOT)
      <geoLocations>
        <geoLocation>
          <geoLocationPoint>
            <pointLongitude>-52.000000</pointLongitude>
            <pointLatitude>69.000000</pointLatitude>
          </geoLocationPoint>
          <geoLocationPoint>
            <pointLongitude>-43.000000</pointLongitude>
            <pointLatitude>78.000000</pointLatitude>
          </geoLocationPoint>
        </geoLocation>
      </geoLocations>
    EOT
    errors = xsd.validate(Nokogiri::XML(doc.to_xml)).map { |error| error.to_s }
    expect(errors).to be_empty
  end

  it 'geoLocationPoint missing latitude' do
    element = doc.at("geoLocations")
    element.replace (<<-EOT)
      <geoLocations>
        <geoLocation>
          <geoLocationPoint>
            <pointLongitude>-52.000000</pointLongitude>
          </geoLocationPoint>
        </geoLocation>
      </geoLocations>
    EOT
    errors = xsd.validate(Nokogiri::XML(doc.to_xml)).map { |error| error.to_s }
    expect(errors.length).to eq(1)
    expect(errors.first).to include("Element '{https://datacite.org/schema/kernel-4}geoLocationPoint': Missing child element(s). Expected is ( {https://datacite.org/schema/kernel-4}pointLatitude ).")
  end

  it 'geoLocationPoint out of range' do
    element = doc.at("geoLocations")
    element.replace (<<-EOT)
      <geoLocations>
        <geoLocation>
          <geoLocationPoint>
            <pointLongitude>-52.000000</pointLongitude>
            <pointLatitude>110.000000</pointLatitude>
          </geoLocationPoint>
        </geoLocation>
      </geoLocations>
    EOT
    errors = xsd.validate(Nokogiri::XML(doc.to_xml)).map { |error| error.to_s }
    expect(errors.length).to eq(1)
    expect(errors.first).to include("Element '{https://datacite.org/schema/kernel-4}pointLatitude': [facet 'maxInclusive'] The value '110.000000' is greater than the maximum value allowed ('90').")
  end

  it 'pointLatitude out of range' do
    element = doc.at("geoLocations")
    element.replace (<<-EOT)
      <geoLocations>
        <geoLocation>
          <geoLocationPoint>
            <pointLongitude>-52.000000</pointLongitude>
            <pointLatitude>Disko Bay</pointLatitude>
          </geoLocationPoint>
        </geoLocation>
      </geoLocations>
    EOT
    errors = xsd.validate(Nokogiri::XML(doc.to_xml)).map { |error| error.to_s }
    expect(errors.length).to eq(1)
    expect(errors.first).to include("Element '{https://datacite.org/schema/kernel-4}pointLatitude': 'Disko Bay' is not a valid value of the atomic type '{https://datacite.org/schema/kernel-4}latitudeType'.")
  end

  it 'geoLocationPolygon' do
    element = doc.at("geoLocations")
    element.replace (<<-EOT)
      <geoLocations>
        <geoLocation>
          <geoLocationPolygon>
            <polygonPoint>
              <pointLongitude>-52</pointLongitude>
              <pointLatitude>69</pointLatitude>
            </polygonPoint>
            <polygonPoint>
              <pointLongitude>-52</pointLongitude>
              <pointLatitude>67</pointLatitude>
            </polygonPoint>
            <polygonPoint>
              <pointLongitude>-54</pointLongitude>
              <pointLatitude>67</pointLatitude>
            </polygonPoint>
            <polygonPoint>
              <pointLongitude>-54</pointLongitude>
              <pointLatitude>69</pointLatitude>
            </polygonPoint>
          </geoLocationPolygon>
        </geoLocation>
      </geoLocations>
    EOT
    errors = xsd.validate(Nokogiri::XML(doc.to_xml)).map { |error| error.to_s }
    expect(errors).to be_empty
  end

  it 'geoLocationPolygon not enough points' do
    element = doc.at("geoLocations")
    element.replace (<<-EOT)
      <geoLocations>
        <geoLocation>
          <geoLocationPolygon>
            <polygonPoint>
              <pointLongitude>-52</pointLongitude>
              <pointLatitude>69</pointLatitude>
            </polygonPoint>
            <polygonPoint>
              <pointLongitude>-52</pointLongitude>
              <pointLatitude>67</pointLatitude>
            </polygonPoint>
          </geoLocationPolygon>
        </geoLocation>
      </geoLocations>
    EOT
    errors = xsd.validate(Nokogiri::XML(doc.to_xml)).map { |error| error.to_s }
    expect(errors.length).to eq(1)
    expect(errors.first).to include("Element '{https://datacite.org/schema/kernel-4}geoLocationPolygon': Missing child element(s). Expected is ( {https://datacite.org/schema/kernel-4}polygonPoint ).")
  end

  it 'geoLocationBox' do
    element = doc.at("geoLocations")
    element.replace (<<-EOT)
      <geoLocations>
        <geoLocation>
          <geoLocationBox>
            <westBoundLongitude>-71.032</westBoundLongitude>
            <eastBoundLongitude>-68.211</eastBoundLongitude>
            <southBoundLatitude>41.090</southBoundLatitude>
            <northBoundLatitude>42.893</northBoundLatitude>
          </geoLocationBox>
        </geoLocation>
      </geoLocations>
    EOT
    errors = xsd.validate(Nokogiri::XML(doc.to_xml)).map { |error| error.to_s }
    expect(errors).to be_empty
  end

  it 'geoLocationBox missing points' do
    element = doc.at("geoLocations")
    element.replace (<<-EOT)
      <geoLocations>
        <geoLocation>
          <geoLocationBox>
            <westBoundLongitude>-71.032</westBoundLongitude>
            <southBoundLatitude>41.090</southBoundLatitude>
          </geoLocationBox>
        </geoLocation>
      </geoLocations>
    EOT
    errors = xsd.validate(Nokogiri::XML(doc.to_xml)).map { |error| error.to_s }
    expect(errors.length).to eq(1)
    expect(errors.first).to include("Element '{https://datacite.org/schema/kernel-4}geoLocationBox': Missing child element(s). Expected is one of ( {https://datacite.org/schema/kernel-4}eastBoundLongitude, {https://datacite.org/schema/kernel-4}northBoundLatitude ).")
  end
end
