require 'spec_helper'

describe "related item 1 example" do
  let(:root) { File.join(File.dirname(__FILE__), '../../source/meta/kernel-4') }
  let(:xsd) { Dir.chdir(root) { Nokogiri::XML::Schema(File.read("metadata.xsd")) }}
  let(:doc) { Dir.chdir(root) { Nokogiri::XML(File.read("example/datacite-example-relateditem1-v4.xml")) { |c| c.strict }}}

  it 'validates' do
    expect(doc).to pass_validation(xsd)
  end
end
