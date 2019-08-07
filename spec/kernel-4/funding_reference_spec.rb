require 'spec_helper'

describe "validate funderReference" do
  let(:root) { File.join(File.dirname(__FILE__), '../../source/meta/kernel-4') }
  let(:xsd) { Dir.chdir(root) { Nokogiri::XML::Schema(File.read("metadata.xsd")) }}
  let(:doc) { Dir.chdir(root) { Nokogiri::XML(File.read("example/datacite-example-fundingReference-v4.xml")) { |c| c.strict }}}

  it 'empty fundingReferences tag' do
    element = doc.at("fundingReferences")
    element.replace "<fundingReferences/>"
    errors = xsd.validate(Nokogiri::XML(doc.to_xml)).map { |error| error.to_s }
    expect(errors).to be_empty
  end

  it 'empty fundingReference tag' do
    element = doc.at("fundingReferences")
    element.replace (<<-EOT)
      <fundingReferences>
        <fundingReference/>
      </fundingReferences>
    EOT
    errors = xsd.validate(Nokogiri::XML(doc.to_xml)).map { |error| error.to_s }
    expect(errors.length).to eq(1)
    expect(errors.first).to include("Missing child element(s). Expected is one of ( {http://datacite.org/schema/kernel-4}funderName, {http://datacite.org/schema/kernel-4}funderIdentifier, {http://datacite.org/schema/kernel-4}awardNumber, {http://datacite.org/schema/kernel-4}awardTitle )")
  end

  it 'only funderName' do
    element = doc.at("fundingReferences")
    element.replace (<<-EOT)
      <fundingReferences>
        <fundingReference>
          <funderName>European Commission</funderName>
        </fundingReference>
      </fundingReferences>
    EOT
    errors = xsd.validate(Nokogiri::XML(doc.to_xml)).map { |error| error.to_s }
    expect(errors).to be_empty
  end

  it 'empty funderName' do
    element = doc.at("fundingReferences")
    element.replace (<<-EOT)
      <fundingReferences>
        <fundingReference>
          <funderName/>
        </fundingReference>
      </fundingReferences>
    EOT
    errors = xsd.validate(Nokogiri::XML(doc.to_xml)).map { |error| error.to_s }
    expect(errors.length).to eq(2)
    expect(errors.first).to include("Element '{http://datacite.org/schema/kernel-4}funderName': [facet 'minLength'] The value has a length of '0'; this underruns the allowed minimum length of '1'.")
  end

  it 'funderIdentifier' do
    element = doc.at("fundingReferences")
    element.replace (<<-EOT)
      <fundingReferences>
        <fundingReference>
          <funderName>European Commission</funderName>
          <funderIdentifier funderIdentifierType="Crossref Funder ID" schemeURI="http://doi.org/">http://doi.org/10.13039/501100000780</funderIdentifier>
        </fundingReference>
      </fundingReferences>
    EOT
    errors = xsd.validate(Nokogiri::XML(doc.to_xml)).map { |error| error.to_s }
    expect(errors).to be_empty
  end

  it 'funderIdentifier without funderIdentifierType' do
    element = doc.at("fundingReferences")
    element.replace (<<-EOT)
      <fundingReferences>
        <fundingReference>
          <funderName>European Commission</funderName>
          <funderIdentifier>http://doi.org/10.13039/501100000780</funderIdentifier>
        </fundingReference>
      </fundingReferences>
    EOT
    errors = xsd.validate(Nokogiri::XML(doc.to_xml)).map { |error| error.to_s }
    expect(errors.length).to eq(1)
    expect(errors.first).to include("The attribute 'funderIdentifierType' is required but missing.")
  end

  it 'funderIdentifier unknown funderIdentifierType' do
    element = doc.at("fundingReferences")
    element.replace (<<-EOT)
      <fundingReferences>
        <fundingReference>
          <funderName>European Commission</funderName>
          <funderIdentifier funderIdentifierType="ABC">http://doi.org/10.13039/501100000780</funderIdentifier>
        </fundingReference>
      </fundingReferences>
    EOT
    errors = xsd.validate(Nokogiri::XML(doc.to_xml)).map { |error| error.to_s }
    expect(errors.length).to eq(2)
    expect(errors.first).to include("The value 'ABC' is not an element of the set {'ISNI', 'GRID', 'ROR', 'Crossref Funder ID', 'Other'}.")
  end

  it 'awardNumber' do
    element = doc.at("fundingReferences")
    element.replace (<<-EOT)
      <fundingReferences>
        <fundingReference>
          <funderName>European Commission</funderName>
          <awardNumber awardURI="http://cordis.europa.eu/project/rcn/100603_en.html">284382</awardNumber>
        </fundingReference>
      </fundingReferences>
    EOT
    errors = xsd.validate(Nokogiri::XML(doc.to_xml)).map { |error| error.to_s }
    expect(errors).to be_empty
  end
end
