class LabelsController < ApplicationController

  def index
    labels_json = get("https://confbots.desk.com/api/v2/labels")
    @labels = Label.from_json(labels_json)
  end

end
