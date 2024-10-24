require 'spec_helper'

describe "full example XML exhaustive validation" do
  let(:root) { File.join(File.dirname(__FILE__), '../../source/meta/kernel-4.6') }
  let(:xsd) { Dir.chdir(root) { Nokogiri::XML::Schema(File.read("metadata.xsd")) }}
  let(:doc) { Dir.chdir(root) { Nokogiri::XML(File.read("example/datacite-example-full-v4.xml")) { |config| config.strict }}}

  # Test that the document passes schema validation
  it 'validates against the XML schema' do
    expect(doc).to pass_validation(xsd)
  end

  # Check the identifier (DOI)
  it 'has the correct identifier' do
    identifier = doc.xpath("//*[local-name()='identifier']").first

    expect(identifier).not_to be_nil
    expect(identifier["identifierType"]).to eq("DOI")
    expect(identifier.text).to eq("10.82433/B09Z-4K37")
  end

  describe "creators" do
    # Check the creators and their attributes
    it 'has creators with correct attributes and values' do
      creators = doc.xpath("/*[local-name()='resource']/*[local-name()='creators']/*[local-name()='creator']")
      
      # Ensure that we've captured two creators
    expect(creators.size).to eq(2), "Expected 2 creators, but found #{creators.size}"

    # Process the first creator (ExampleFamilyName, ExampleGivenName)
    creator_node = creators[0]

    # Find the sub-elements using local-name()
    creator_name = creator_node.at_xpath("*[local-name()='creatorName']")
    given_name = creator_node.at_xpath("*[local-name()='givenName']")
    family_name = creator_node.at_xpath("*[local-name()='familyName']")
    orcid = creator_node.at_xpath("*[local-name()='nameIdentifier'][@nameIdentifierScheme='ORCID']")
    affiliation = creator_node.at_xpath("*[local-name()='affiliation']")

    # Ensure the <creatorName> and other elements exist
    expect(creator_name).not_to be_nil, "Creator name not found"
    expect(creator_name.text.strip).to eq("ExampleFamilyName, ExampleGivenName")

    # Validate givenName and familyName
    expect(given_name).not_to be_nil, "Given name not found"
    expect(given_name.text.strip).to eq("ExampleGivenName")

    expect(family_name).not_to be_nil, "Family name not found"
    expect(family_name.text.strip).to eq("ExampleFamilyName")

    # Validate ORCID
    expect(orcid).not_to be_nil, "ORCID not found"
    expect(orcid.text.strip).to eq("https://orcid.org/0000-0001-5727-2427")

    # Validate Affiliation
    expect(affiliation).not_to be_nil, "Affiliation not found"
    expect(affiliation.text.strip).to eq("ExampleAffiliation")

    end
  end

  describe "titles" do
    # Check the titles and attributes
    it 'has titles with correct attributes and values' do
      titles = doc.xpath("/*[local-name()='resource']/*[local-name()='titles']/*[local-name()='title']")

      expect(titles.size).to eq(4)

      expected_titles = [
        { value: "Example Title", lang: "en", titleType: nil },
        { value: "Example Subtitle", lang: "en", titleType: "Subtitle" },
        { value: "Example TranslatedTitle", lang: "fr", titleType: "TranslatedTitle" },
        { value: "Example AlternativeTitle", lang: "en", titleType: "AlternativeTitle" }
      ]

      expected_titles.each_with_index do |expected, index|
        title_node = titles[index]
        expect(title_node.text).to eq(expected[:value]), "Title value mismatch at index #{index}"

        if expected[:titleType]
          expect(title_node["titleType"]).to eq(expected[:titleType]), "Missing or incorrect titleType for title at index #{index}"
        end

        if expected[:lang]
          expect(title_node["xml:lang"]).to eq(expected[:lang]), "Missing or incorrect xml:lang for title at index #{index}"
        end
      end
    end
  end

  describe "publisher" do
    # Check the publisher and publication year
    it 'has the correct publisher and publication year' do
      publisher = doc.xpath("/*[local-name()='resource']/*[local-name()='publisher']").first

      expect(publisher.text).to eq("Example Publisher")
      expect(publisher["publisherIdentifier"]).to eq("https://ror.org/04z8jg394")
      expect(publisher["publisherIdentifierScheme"]).to eq("ROR")
      expect(publisher["xml:lang"]).to eq("en")

      publication_year = doc.xpath("/*[local-name()='resource']/*[local-name()='publicationYear']").first
      expect(publication_year).not_to be_nil
      expect(publication_year.text).to eq("2024")
    end
  end

  describe "subjects" do
    # Check the subjects
    it 'has the correct subjects and subject schemes' do
      subjects = doc.xpath("//*[local-name()='subject']")
      expect(subjects.size).to eq(3)

      expected_subjects = [
        { value: "FOS: Computer and information sciences", subjectScheme: "Fields of Science and Technology (FOS)", schemeURI: "http://www.oecd.org/science/inno", valueURI: "http://www.oecd.org/science/inno/38235147.pdf" },
        { value: "Digital curation and preservation", subjectScheme: "Australian and New Zealand Standard Research Classification (ANZSRC), 2020", classificationCode: "461001", schemeURI: "https://www.abs.gov.au/statistics/classifications/australian-and-new-zealand-standard-research-classification-anzsrc" },
        { value: "Example Subject" }
      ]

      expected_subjects.each_with_index do |expected, index|
        subject_node = subjects[index]

        expect(subject_node.text).to eq(expected[:value]), "Subject value mismatch at index #{index}"

        if expected[:subjectScheme]
          expect(subject_node["subjectScheme"]).to eq(expected[:subjectScheme]), "Subject scheme mismatch at index #{index}"
        end

        if expected[:schemeURI]
          expect(subject_node["schemeURI"]).to eq(expected[:schemeURI]), "Subject schemeURI mismatch at index #{index}"
        end

        if expected[:valueURI]
          expect(subject_node["valueURI"]).to eq(expected[:valueURI]), "Subject valueURI mismatch at index #{index}"
        end
      end
    end
  end

  describe "alternateIdentifier" do
    # Alternate Identifiers validation
    it 'has the alternateIdentifiers with correct attributes and values' do
      alt_identifiers = doc.xpath("//*[local-name()='alternateIdentifier']")
      expect(alt_identifiers.size).to eq(1)
      expect(alt_identifiers.first["alternateIdentifierType"]).to eq("Local accession number")
      expect(alt_identifiers.first.text).to eq("12345")
    end
  end

  describe "rightsList" do
    # Check rights list for correct attributes and values
    it 'has rights with correct attributes and values' do
      # Ignore namespaces and find the <rightsList> element
      rights_list = doc.xpath("//*[local-name()='rightsList']/*[local-name()='rights']")
      
      # Ensure there is exactly one <rights> element within <rightsList>
      expect(rights_list.size).to eq(1), "Expected 1 rights element, found #{rights_list.size}"
  
      # Access the first (and only) <rights> element within <rightsList>
      rights_node = rights_list.first
  
      # Verify text content inside <rights>
      expect(rights_node.text.strip).to eq("Creative Commons Attribution 4.0 International")
  
      # Verify each attribute of <rights>
      expect(rights_node["rightsIdentifier"]).to eq("CC-BY-4.0"), "Mismatch in rightsIdentifier"
      expect(rights_node["rightsURI"]).to eq("https://creativecommons.org/licenses/by/4.0/"), "Mismatch in rightsURI"
      expect(rights_node["rightsIdentifierScheme"]).to eq("SPDX"), "Mismatch in rightsIdentifierScheme"
      expect(rights_node["schemeURI"]).to eq("https://spdx.org/licenses/"), "Mismatch in schemeURI"
      expect(rights_node["xml:lang"]).to eq("en"), "Mismatch in xml:lang"
    end
  end

  describe "fundingReferences" do
    # Funding References validation
    it 'has fundingReferences with correct attributes and values' do
      # Using local-name() to ignore namespaces
      funding_references = doc.xpath("/*[local-name()='resource']/*[local-name()='fundingReferences']/*[local-name()='fundingReference']")
  
      # Check that there is exactly one fundingReference element
      expect(funding_references.size).to eq(1), "Expected 1 fundingReference, got #{funding_references.size}"
  
      funding_ref = funding_references.first
  
      # Use local-name() to find child elements within the <fundingReference>
      funder_name = funding_ref.at_xpath("*[local-name()='funderName']")
      funder_identifier = funding_ref.at_xpath("*[local-name()='funderIdentifier']")
      award_number = funding_ref.at_xpath("*[local-name()='awardNumber']")
      award_title = funding_ref.at_xpath("*[local-name()='awardTitle']")
  
      # Ensure the elements exist and their texts match the expected values
      expect(funder_name).not_to be_nil, "Funder name not found"
      expect(funder_name.text.strip).to eq("Example Funder")
  
      expect(funder_identifier).not_to be_nil, "Funder identifier not found"
      expect(funder_identifier.text.strip).to eq("https://doi.org/10.13039/501100000780")
  
      expect(award_number).not_to be_nil, "Award number not found"
      expect(award_number.text.strip).to eq("12345")
  
      expect(award_title).not_to be_nil, "Award title not found"
      expect(award_title.text.strip).to eq("Example AwardTitle")
    end
  end

  describe "relatedItems" do
    # RelatedItem validation
    it 'has relatedItems with correct attributes and values' do
      # Using local-name() to ignore namespaces and find the <relatedItem> elements
      related_items = doc.xpath("//*[local-name()='relatedItem']")
      
      # Ensure exactly one relatedItem is found
      expect(related_items.size).to eq(1), "Expected 1 relatedItem, but found #{related_items.size}"
  
      # Get the first (and only) relatedItem element
      related_item = related_items.first
  
      # Check the attributes of <relatedItem>
      expect(related_item["relatedItemType"]).to eq("Text"), "Expected relatedItemType to be 'Text'"
      expect(related_item["relationType"]).to eq("Cites"), "Expected relationType to be 'Cites'"
  
      # Find relatedItemIdentifier within relatedItem and check attributes
      related_identifier = related_item.at_xpath("*[local-name()='relatedItemIdentifier']")
      expect(related_identifier).not_to be_nil, "relatedItemIdentifier is missing"
      expect(related_identifier["relatedItemIdentifierType"]).to eq("ISSN"), "Expected relatedItemIdentifierType to be 'ISSN'"
      expect(related_identifier.text.strip).to eq("1234-5678"), "Expected relatedItemIdentifier to be '1234-5678'"
  
      # Find the first <title> inside <titles> and check its text
      title = related_item.at_xpath("*[local-name()='titles']/*[local-name()='title']")
      expect(title).not_to be_nil, "Title inside related item is missing"
      expect(title.text.strip).to eq("Example RelatedItem Title"), "Title text mismatch"
  
      # Find the translated title and check its text
      translated_title = related_item.at_xpath("*[local-name()='titles']/*[local-name()='title'][@titleType='TranslatedTitle']")
      expect(translated_title).not_to be_nil, "Translated title is missing"
      expect(translated_title.text.strip).to eq("Example RelatedItem TranslatedTitle"), "Translated title mismatch"
    end
  end

  describe "contributors" do
    # Check each contributor for correct attributes and values
    it 'has contributors with specified attributes and values' do
      # Use local-name() to avoid namespaces
      contributors = doc.xpath("//*[local-name()='contributor']")
  
      # Ensure exact number of contributors as expected
      expect(contributors.size).to eq(23), "Expected 23 contributors, but found #{contributors.size}"
  
      # List of expected contributors with their attributes and values
      expected_contributors = [
        { contributorType: "ContactPerson", name: "ExampleFamilyName, ExampleGivenName", orcid: "https://orcid.org/0000-0001-5727-2427", affiliation: "ExampleAffiliation" },
        { contributorType: "DataCollector", name: "ExampleFamilyName, ExampleGivenName", orcid: "https://orcid.org/0000-0001-5727-2427", affiliation: "ExampleAffiliation" },
        { contributorType: "DataCurator", name: "ExampleFamilyName, ExampleGivenName", orcid: "https://orcid.org/0000-0001-5727-2427", affiliation: "ExampleAffiliation" },
        { contributorType: "DataManager", name: "ExampleFamilyName, ExampleGivenName", orcid: "https://orcid.org/0000-0001-5727-2427", affiliation: "ExampleAffiliation" },
        { contributorType: "Distributor", name: "ExampleOrganization", ror: "https://ror.org/03yrm5c26" },
        { contributorType: "Editor", name: "ExampleFamilyName, ExampleGivenName", orcid: "https://orcid.org/0000-0001-5727-2427", affiliation: "ExampleAffiliation" },
        { contributorType: "HostingInstitution", name: "ExampleOrganization", ror: "https://ror.org/03yrm5c26" },
        { contributorType: "Producer", name: "ExampleFamilyName, ExampleGivenName", orcid: "https://orcid.org/0000-0001-5727-2427", affiliation: "ExampleAffiliation" },
        { contributorType: "ProjectLeader", name: "ExampleFamilyName, ExampleGivenName", orcid: "https://orcid.org/0000-0001-5727-2427", affiliation: "ExampleAffiliation" },
        { contributorType: "ProjectManager", name: "ExampleFamilyName, ExampleGivenName", orcid: "https://orcid.org/0000-0001-5727-2427", affiliation: "ExampleAffiliation" },
        { contributorType: "ProjectMember", name: "ExampleFamilyName, ExampleGivenName", orcid: "https://orcid.org/0000-0001-5727-2427", affiliation: "ExampleAffiliation" },
        { contributorType: "RegistrationAgency", name: "DataCite", ror: "https://ror.org/04wxnsj81" },
        { contributorType: "RegistrationAuthority", name: "International DOI Foundation" },
        { contributorType: "RelatedPerson", name: "ExampleFamilyName, ExampleGivenName", orcid: "https://orcid.org/0000-0001-5727-2427", affiliation: "ExampleAffiliation" },
        { contributorType: "Researcher", name: "ExampleFamilyName, ExampleGivenName", orcid: "https://orcid.org/0000-0001-5727-2427", affiliation: "ExampleAffiliation" },
        { contributorType: "ResearchGroup", name: "ExampleContributor", affiliation: "ExampleOrganization" }, # Notice, no ROR expected here
        { contributorType: "RightsHolder", name: "ExampleFamilyName, ExampleGivenName", orcid: "https://orcid.org/0000-0001-5727-2427", affiliation: "ExampleAffiliation" },
        { contributorType: "Sponsor", name: "ExampleContributor", affiliation: "https://ror.org/03yrm5c26" },
        { contributorType: "Supervisor", name: "ExampleFamilyName, ExampleGivenName", orcid: "https://orcid.org/0000-0001-5727-2427", affiliation: "ExampleAffiliation" },
        { contributorType: "Translator", name: "ExampleFamilyName, ExampleGivenName", orcid: "https://orcid.org/0000-0001-5727-2427", affiliation: "ExampleAffiliation" },
        { contributorType: "WorkPackageLeader", name: "ExampleOrganization", ror: "https://ror.org/03yrm5c26" },
        { contributorType: "Other", name: "ExampleFamilyName, ExampleGivenName", orcid: "https://orcid.org/0000-0001-5727-2427", affiliation: "ExampleAffiliation" }
      ]
  
      # Loop through the contributors and check their attributes
      expected_contributors.each_with_index do |expected, index|
        contributor_node = contributors[index]
  
        # Validate contributorType attribute
        expect(contributor_node["contributorType"]).to eq(expected[:contributorType]), "Contributor Type mismatch at index #{index}"
  
        # Check for contributorName
        name_node = contributor_node.at_xpath("*[local-name()='contributorName']")
        expect(name_node).not_to be_nil, "Contributor Name missing at index #{index}"
        expect(name_node.text.strip).to eq(expected[:name]), "Contributor Name mismatch at index #{index}"
  
        # If ORCID is expected, check the ORCID
        if expected[:orcid]
          orcid_node = contributor_node.at_xpath("*[local-name()='nameIdentifier'][@nameIdentifierScheme='ORCID']")
          expect(orcid_node).not_to be_nil, "ORCID missing at index #{index}"
          expect(orcid_node.text.strip).to eq(expected[:orcid]), "ORCID mismatch at index #{index}"
        end
  
        # If ROR is expected, check for ROR
        if expected[:ror]
          ror_node = contributor_node.at_xpath("*[local-name()='nameIdentifier'][@nameIdentifierScheme='ROR']")
          expect(ror_node).not_to be_nil, "ROR missing at index #{index}"
          expect(ror_node.text.strip).to eq(expected[:ror]), "ROR mismatch at index #{index}"
        end
  
        # If an affiliation is expected, check it
        if expected[:affiliation]
          affiliation_node = contributor_node.at_xpath("*[local-name()='affiliation']")
          expect(affiliation_node).not_to be_nil, "Affiliation missing at index #{index}"
          expect(affiliation_node.text.strip).to eq(expected[:affiliation]), "Affiliation mismatch at index #{index}"
        end
      end
    end
  end

  describe "dates" do
    # Check all dates and their attributes
    it 'has dates with correct attributes and values' do
      # Using local-name() to ignore namespaces
      dates = doc.xpath("//*[local-name()='date']")
  
      # Ensure the number of date elements matches the real count
      expect(dates.size).to eq(12), "Expected 12 date elements, but found #{dates.size}"
  
      expected_dates = [
        { dateType: "Accepted", value: "2024-01-01" },
        { dateType: "Available", value: "2024-01-01" },
        { dateType: "Copyrighted", value: "2024-01-01" },
        { dateType: "Collected", value: "2024-01-01/2024-12-31" },
        { dateType: "Coverage", value: "2024-01-01/2024-12-31" },
        { dateType: "Created", value: "2024-01-01" },
        { dateType: "Issued", value: "2024-01-01" },
        { dateType: "Submitted", value: "2024-01-01" },
        { dateType: "Updated", value: "2024-01-01" },
        { dateType: "Valid", value: "2024-01-01" },
        { dateType: "Withdrawn", value: "2024-01-01" },
        { dateType: "Other", dateInformation: "ExampleDateInformation", value: "2024-01-01" }
      ]
  
      expected_dates.each_with_index do |expected, index|
        # Find the <date> element by dateType attribute
        date_node = dates.find { |d| d["dateType"] == expected[:dateType] }
        
        # Ensure the node was found
        expect(date_node).not_to be_nil, "Could not find date with dateType '#{expected[:dateType]}'"
  
        # Check the date value
        expect(date_node.text.strip).to eq(expected[:value]), "Date value mismatch for dateType '#{expected[:dateType]}'"
  
        # Check the dateInformation attribute if it exists
        if expected[:dateInformation]
          expect(date_node["dateInformation"]).to eq(expected[:dateInformation])
        end
      end
    end
  end

  describe "relatedIdentifierType" do
    # Check related IDs for correct identifier and relation type
    it 'has related identifiers with correct attributes and values' do
      related_identifiers = doc.xpath("//*[local-name()='relatedIdentifier']")

      expected_related_ids = [
        { relatedIdentifierType: "ARK", relationType: "IsCitedBy", value: "ark:/13030/tqb3kh97gh8w" },
        { relatedIdentifierType: "arXiv", relationType: "Cites", value: "arXiv:0706.0001" },
        { relatedIdentifierType: "bibcode", relationType: "IsSupplementTo", value: "2018AGUFM.A24K..07S" },
        { relatedIdentifierType: "CSTR", relationType: "IsSupplementedBy", value: "31253.11.sciencedb.13238" },
        { relatedIdentifierType: "DOI", relationType: "IsContinuedBy", value: "10.1016/j.epsl.2011.11.037" },
        { relatedIdentifierType: "EAN13", relationType: "Continues", value: "9783468111242" },
        { relatedIdentifierType: "EISSN", relationType: "Describes", value: "1562-6865" },
        { relatedIdentifierType: "Handle", relationType: "IsDescribedBy", value: "10013/epic.10033" },
        { relatedIdentifierType: "IGSN", relationType: "HasMetadata", value: "IECUR0097" },
        { relatedIdentifierType: "ISBN", relationType: "IsMetadataFor", value: "978-3-905673-82-1" },
        { relatedIdentifierType: "ISSN", relationType: "HasVersion", value: "0077-5606" },
        { relatedIdentifierType: "ISTC", relationType: "IsVersionOf", value: "0A9 2002 12B4A105 7" },
        { relatedIdentifierType: "LISSN", relationType: "IsNewVersionOf", value: "1188-1534" },
        { relatedIdentifierType: "LSID", relationType: "IsPreviousVersionOf", value: "urn:lsid:ubio.org:namebank:11815" },
        { relatedIdentifierType: "PMID", relationType: "IsPartOf", value: "12082125" },
        { relatedIdentifierType: "PURL", relationType: "HasPart", value: "http://purl.oclc.org/foo/bar" },
        { relatedIdentifierType: "RRID", relationType: "IsPublishedIn", value: "RRID:SCR_014641" },
        { relatedIdentifierType: "UPC", relationType: "IsReferencedBy", value: "123456789999" },
        { relatedIdentifierType: "URL", relationType: "References", value: "http://www.heatflow.und.edu/index2.html" },
        { relatedIdentifierType: "URN", relationType: "IsDocumentedBy", value: "urn:nbn:de:101:1-201102033592" },
        { relatedIdentifierType: "w3id", relationType: "Documents", value: "https://w3id.org/games/spec/coil#Coil_Bomb_Die_Of_Age" },
        { relatedIdentifierType: "DOI", relationType: "IsCompiledBy", value: "10.1016/j.epsl.2011.11.037" },
        { relatedIdentifierType: "DOI", relationType: "Compiles", value: "10.1016/j.epsl.2011.11.037" },
        { relatedIdentifierType: "DOI", relationType: "IsVariantFormOf", value: "10.1016/j.epsl.2011.11.037" },
        { relatedIdentifierType: "DOI", relationType: "IsOriginalFormOf", value: "10.1016/j.epsl.2011.11.037" },
        { relatedIdentifierType: "DOI", relationType: "IsIdenticalTo", value: "10.1016/j.epsl.2011.11.037" },
        { relatedIdentifierType: "DOI", relationType: "IsReviewedBy", value: "10.1016/j.epsl.2011.11.037" },
        { relatedIdentifierType: "DOI", relationType: "Reviews", value: "10.1016/j.epsl.2011.11.037" },
        { relatedIdentifierType: "DOI", relationType: "IsDerivedFrom", value: "10.1016/j.epsl.2011.11.037" },
        { relatedIdentifierType: "DOI", relationType: "IsSourceOf", value: "10.1016/j.epsl.2011.11.037" },
        { relatedIdentifierType: "DOI", relationType: "IsRequiredBy", value: "10.1016/j.epsl.2011.11.037" },
        { relatedIdentifierType: "DOI", relationType: "Requires", value: "10.1016/j.epsl.2011.11.037" },
        { relatedIdentifierType: "DOI", relationType: "Obsoletes", value: "10.1016/j.epsl.2011.11.037" },
        { relatedIdentifierType: "DOI", relationType: "IsObsoletedBy", value: "10.1016/j.epsl.2011.11.037" },
        { relatedIdentifierType: "DOI", relationType: "Collects", value: "10.1016/j.epsl.2011.11.037" },
        { relatedIdentifierType: "DOI", relationType: "IsCollectedBy", value: "10.1016/j.epsl.2011.11.037" },
        { relatedIdentifierType: "DOI", relationType: "HasTranslation", value: "10.1016/j.epsl.2011.11.037" },
        { relatedIdentifierType: "DOI", relationType: "IsTranslationOf", value: "10.1016/j.epsl.2011.11.037" }
      ]

      expect(related_identifiers.size).to eq(expected_related_ids.size)

      expected_related_ids.each_with_index do |expected, index|
        related_id_node = related_identifiers[index]

        expect(related_id_node["relatedIdentifierType"]).to eq(expected[:relatedIdentifierType]), "relatedIdentifierType mismatch at index #{index}"
        expect(related_id_node["relationType"]).to eq(expected[:relationType]), "relationType mismatch at index #{index}"
        expect(related_id_node.text).to eq(expected[:value]), "Identifier value mismatch at index #{index}"
      end
    end
  end

  describe "geoLocation" do
    # Check geoLocation and its associated attributes
    it 'has geoLocation with correct attributes and values' do
      # Use local-name() to ignore namespaces and find the <geoLocation> elements
      geo_location = doc.xpath("//*[local-name()='geoLocation']").first
  
      # Ensure we found the <geoLocation> element
      expect(geo_location).not_to be_nil
      
      # Find and validate <geoLocationPlace>
      geo_location_place = geo_location.at_xpath("*[local-name()='geoLocationPlace']")
      expect(geo_location_place.text.strip).to eq("Vancouver, British Columbia, Canada"), "geoLocationPlace mismatch"
  
      # Find and validate <geoLocationBox>
      geo_location_box = geo_location.at_xpath("*[local-name()='geoLocationBox']")
      expect(geo_location_box).not_to be_nil, "geoLocationBox is missing"
  
      # Expect correct coordinates within <geoLocationBox>
      expect(geo_location_box.at_xpath("*[local-name()='westBoundLongitude']").text.strip).to eq("-123.27")
      expect(geo_location_box.at_xpath("*[local-name()='eastBoundLongitude']").text.strip).to eq("-123.02")
      expect(geo_location_box.at_xpath("*[local-name()='southBoundLatitude']").text.strip).to eq("49.195")
      expect(geo_location_box.at_xpath("*[local-name()='northBoundLatitude']").text.strip).to eq("49.315")
    end
  end

  describe "formats" do
    # Check for sizes and formats
    it 'has the correct sizes and formats' do
      # Use local-name() to ignore namespaces and find the <size> elements
      sizes = doc.xpath("//*[local-name()='size']")
      expected_sizes = ["1 MB", "90 pages"]
  
      # Ensure we found the correct number of <size> elements
      expect(sizes.size).to eq(expected_sizes.size), "Mismatch in number of sizes"
  
      sizes.each_with_index do |size_node, index|
        expect(size_node.text.strip).to eq(expected_sizes[index]), "Size mismatch at index #{index}"
      end
  
      # Use local-name() to ignore namespaces and find the <format> elements
      formats = doc.xpath("//*[local-name()='format']")
      expected_formats = ["application/xml", "text/plain"]
  
      # Ensure we found the correct number of <format> elements
      expect(formats.size).to eq(expected_formats.size), "Mismatch in number of formats"
  
      formats.each_with_index do |format_node, index|
        expect(format_node.text.strip).to eq(expected_formats[index]), "Format mismatch at index #{index}"
      end
    end
  end

  # Check descriptions (Abstract, Methods, etc.)
  it 'has descriptions with correct values' do
    descriptions = doc.xpath("//*[local-name()='description']")
  
    # Expected descriptions
    expected_descriptions = [
      { descriptionType: "Abstract", value: "Example Abstract" },
      { descriptionType: "Methods", value: "Example Methods" },
      { descriptionType: "TechnicalInfo", value: "Example TechnicalInfo" },
      { descriptionType: "SeriesInformation", value: "Example SeriesInformation" },
      { descriptionType: "TableOfContents", value: "Example TableOfContents" },
      { descriptionType: "Other", value: "Example Other" }
    ]
  
    # Ensure the document has at least 1 description
    expect(descriptions.size).not_to eq(0), "No description elements found in the XML"
  
    # Check that each expected description is present in the XML
    expected_descriptions.each do |expected|
      description_node = descriptions.find { |d| d["descriptionType"] == expected[:descriptionType] }
      expect(description_node).not_to be_nil, "Could not find description of type '#{expected[:descriptionType]}'"
      expect(description_node.text.strip).to eq(expected[:value]), "Description text mismatch for type '#{expected[:descriptionType]}'"
    end
  end
end