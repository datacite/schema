require 'spec_helper'

describe "full example" do
  let(:root) { File.join(File.dirname(__FILE__), '../../source/meta/kernel-4') }
  let(:xsd) { Dir.chdir(root) { Nokogiri::XML::Schema(File.read("metadata.xsd")) }}
  let(:doc) { Dir.chdir(root) { Nokogiri::XML(File.read("example/datacite-example-ResearchGroup_Methods-v4.xml")) { |c| c.strict }}}

  it 'validates' do
    expect(doc).to pass_validation(xsd)
  end

  it 'has contributor ResearchGroup' do
    contributors = doc.search("contributor")
    expect(contributors.size).to eq(1)
    contributor = contributors.first
    expect(contributor["contributorType"]).to eq("ResearchGroup")
    contributor_name = contributor.first_element_child
    expect(contributor_name.name).to eq("contributorName")
    expect(contributor_name.text).to eq("Center for Imaging of Neurodegenerative Disease")
  end

  it 'has descriptionType Methods' do
    descriptions = doc.search("description")
    expect(descriptions.size).to eq(2)
    description = descriptions.last
    expect(description["descriptionType"]).to eq("Methods")
  end
end
