require 'spec_helper'

describe "full example" do
  let(:doc) { Dir.chdir(RSPEC_ROOT) {Nokogiri::XML(File.read("fixtures/_10.23650.xml")) { |c| c.strict }}}
  let(:root) { File.join(File.dirname(__FILE__), '../../source/meta/kernel-4') }
  let(:xsd) { Dir.chdir(root) { Nokogiri::XML::Schema(File.read("metadata.xsd")) }}

  it 'validates' do
    expect(doc).to pass_validation(xsd)
  end
end
