require 'spec_helper'

describe "validate DOI" do
  let(:root) { File.join(File.dirname(__FILE__), '../../source/meta/kernel-4') }
  let(:xsd) { Dir.chdir(root) { Nokogiri::XML::Schema(File.read("metadata.xsd")) }}
  let(:doc) { Dir.chdir(root) { Nokogiri::XML(File.read("example/datacite-example-full-v4.xml")) { |c| c.strict }}}

  it '10.5555/123' do
    doc.at("identifier").content = "10.5555/123"
    errors = xsd.validate(Nokogiri::XML(doc.to_xml)).map { |error| error.to_s }
    expect(errors).to be_empty
  end

  it '10.5555/a' do
    doc.at("identifier").content = "10.5555/a"
    errors = xsd.validate(Nokogiri::XML(doc.to_xml)).map { |error| error.to_s }
    expect(errors).to be_empty
  end
end
