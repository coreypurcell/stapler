class Label

  attr_reader :name, :description, :types

  def self.from_json(json)
    json[:_embedded][:entries].inject([]) do |labels, label|
      labels << new(label)
    end
  end

  def initialize(json)
    @name = json[:name]
    @description = json[:description]
    @types = json[:types]
  end
end
