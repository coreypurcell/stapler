require "spec_helper"

describe KasesController do
  before do
    stub_access_token
  end

  it "retrieves the first cases" do
    VCR.use_cassette('kases') do
      get "/kases"
    end

    expect(response.body).to include("Case")
  end

  it "displays the details of the cases" do
    VCR.use_cassette('kases') do
      get "/kases"
    end

    expect(response.body).to include("Subject: Getting Started with Your New Account")
  end
end
