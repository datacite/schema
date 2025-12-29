require 'spec_helper'

describe "full example" do
  let(:root) { File.join(File.dirname(__FILE__), '../../source/meta/kernel-4') }
  let(:xsd) { Dir.chdir(root) { Nokogiri::XML::Schema(File.read("metadata.xsd")) { |c| c.strict }}}

  it 'is valid' do
    expect(xsd.errors).to be_empty
  end
end
