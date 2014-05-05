class KasesController < ApplicationController
  def index
    first_filter_url = get("https://confbots.desk.com/api/v2/filters")[:_embedded][:entries].first
    cases_url = first_filter_url[:_links][:cases][:href]
    @kases = Kase.from_json(get(cases_url))
  end
end
