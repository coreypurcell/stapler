class LabelsController < ApplicationController
  before_filter :check_auth

  def index
    labels_json = get("https://confbots.desk.com/api/v2/labels")
    @labels = Label.from_json(labels_json)
  end

  def prove
    hash = {
      name: "Prove It",
      description: "description of Prove It",
      types: [ "case", "macro" ],
      color: "blue"
    }
    resp = post("https://confbots.desk.com/api/v2/labels", hash)
    if resp.code =~ /^2/
      flash[:notice] = "Created Prove It label"
      redirect_to labels_path
    else
      flash[:error] = "Failed to creat prove it label: #{resp.body}"
      redirect_to :root
    end
  end

  def assign
    first_filter_url = get("https://confbots.desk.com/api/v2/filters")[:_embedded][:entries].first
    cases_url = first_filter_url[:_links][:cases][:href]
    @kases = Kase.from_json(get(cases_url))

    hash = {
      labels: [ "Prove It" ]
    }
    resp = patch(@kases.first.href, hash)
    if resp.code =~ /^2/
      flash[:notice] = "Addes prove it label"
      redirect_to kases_path
    else
      flash[:error] = "Failed to add prove it label: #{resp.body}"
      redirect_to :root
    end
  end

end
