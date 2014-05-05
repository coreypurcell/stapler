require "spec_helper"

describe KasesController do
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
end
