module IntegrationSpecHelper
  def login_with_oauth(service = :desk)
    visit "/auth/#{service}"
  end

  def stub_access_token
    consumer = OAuth::Consumer.new(
      ENV['DESK_KEY'],
      ENV['DESK_SECRET'],
      :site => "https://confbots.desk.com",
      :scheme => :header
    )
    token = OAuth::AccessToken.from_hash(
      consumer,
      oauth_token: ENV['DESK_ACCESS_TOKEN'],
      oauth_secret: ENV['DESK_ACCESS_SECRET']
    ).tap do |t|
      t.secret = ENV['DESK_ACCESS_SECRET']
    end
    allow_any_instance_of(ApplicationController).to receive(:access_token).and_return(token)
    allow_any_instance_of(ApplicationController).to receive(:check_auth).and_return(true)
  end
end
