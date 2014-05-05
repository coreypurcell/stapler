require "spec_helper"

describe LabelsController do
  before do
    stub_access_token
  end

  it "retrieves the labels" do
    VCR.use_cassette('labels') do
      get "/labels"
    end

    expect(response.body).to include("Labels")
  end

  it "displays the details of the labels" do
    VCR.use_cassette('labels') do
      get "/labels"
    end

    expect(response.body).to include("Name: Abandoned Chats")
  end

  describe "Adding a prove it label" do
    it "displays an error if it can't create the label" do
      VCR.use_cassette('labels-prove-error') do
        get "/labels/prove"
        follow_redirect!
      end

      expect(response.body).to include("Failed")
      expect(response.body).to include("taken")
    end

    it "displays an the labes if it created the label" do
      VCR.use_cassette('labels-prove-success') do
        get "/labels/prove"
        follow_redirect!
      end

      expect(response.body).to include("Created")
      expect(response.body).to include("Name: Prove It")
    end
  end

  describe "Adding a prove it label to a case" do
    it "displays the cases if it successfully added the label" do
      VCR.use_cassette('labels-case-success') do
        get "/labels/assign"
        follow_redirect!
      end

      expect(response.body).to include("Added prove it label")
    end
  end
end
