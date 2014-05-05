class Kase

  attr_reader :blurb, :subject, :status, :received_at

  def self.from_json(json)
    json[:_embedded][:entries].inject([]) do |kases, kase|
      kases << new(kase)
    end
  end

  def initialize(json)
    @blurb = json[:blurb]
    @subject = json[:subject]
    @status = json[:status]
    @received_at = json[:received_at]
  end

  def to_partial_path
    "kases/kase"
  end

end
