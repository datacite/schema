require 'spec_helper'

describe "full example" do
  let(:root) { File.join(File.dirname(__FILE__), '../../meta/kernel-4') }
  let(:xsd) { Dir.chdir(root) { Nokogiri::XML::Schema(File.read("metadata.xsd")) }}
  let(:doc) { Dir.chdir(root) { Nokogiri::XML(File.read("example/datacite-example-funderReference-v.4.0.xml")) }}

  it 'validates' do
    expect(doc).to pass_validation(xsd)
  end

  it 'has funderReference' do
    funder_reference = doc.at("funderReference")
    # expect(resource_type["resourceTypeGeneral"]).to eq("Workflow")
    # expect(resource_type.text).to eq("Software")
  end
end
