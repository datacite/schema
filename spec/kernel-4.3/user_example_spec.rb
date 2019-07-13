require 'spec_helper'

describe "full example" do
  let(:doc) { Dir.chdir(RSPEC_ROOT) {Nokogiri::XML(File.read("fixtures/_10.23650.xml")) { |c| c.strict }}}
  let(:root) { File.join(File.dirname(__FILE__), '../../source/meta/kernel-4') }
  let(:xsd) { Dir.chdir(root) { Nokogiri::XML::Schema(File.read("metadata.xsd")) }}

  it 'does not validate' do
    expect(doc).not_to pass_validation(xsd)
  end

  it 'missing nameIdentifier string' do
    errors = xsd.validate(Nokogiri::XML(doc.to_xml)).map { |error| error.to_s }
    expect(errors.length).to eq(2)
    expect(errors.first).to include("Element '{http://datacite.org/schema/kernel-4}nameIdentifier': [facet 'minLength'] The value has a length of '0'; this underruns the allowed minimum length of '1'.")
  end
end
