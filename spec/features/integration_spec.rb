require 'rails_helper'

describe 'User registration' do
  let(:email) { 'registration_test_user@example.org' }
  let(:password) { 'registration_test_password' }

  before :each do
    visit '/'
    find("button[data-target='#signup-modal']").click
  end

  it "shows the signup modal" do
    within('#signup-modal') do
      expect(page).to have_content('Tell us about yourself') # async
    end
  end

  it "doesn't sign in with incorrect password_confirmation" do
    within('#signup-modal') do
      fill_in 'user_email', with: email
      fill_in 'user_password', with: password
      fill_in 'user_password_confirmation', with: 'wrongpassword'

      click_button 'Sign up'
    end
  end

  it "doesn't redirect to posts index" do
    expect(page).not_to have_css("h1", text: "Posts")
  end
end
