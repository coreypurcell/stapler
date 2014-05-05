require "spec_helper"

feature 'testing oauth' do
  scenario 'should show signed in when mocked oauth' do
    login_with_oauth
    visit root_path

    page.should have_content("Signed in")
  end
end
