require 'spec_helper'

describe "full example" do
  let(:root) { File.join(File.dirname(__FILE__), '../../source/meta/kernel-4.1') }
  let(:xsd) { Dir.chdir(root) { Nokogiri::XML::Schema(File.read("metadata.xsd")) }}
  let(:doc) { Dir.chdir(root) { Nokogiri::XML(File.read("example/datacite-example-fundingReference-v.4.1.xml")) { |c| c.strict }}}

  it 'validates' do
    expect(doc).to pass_validation(xsd)
  end

  # it 'has funderReference' do
  #   doc.at("funderReferences").first = "<funderReference></f"
  #   # expect(resource_type["resourceTypeGeneral"]).to eq("Workflow")
  #   # expect(resource_type.text).to eq("Software")
  # end
end
