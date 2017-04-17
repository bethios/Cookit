require 'rails_helper'

RSpec.feature "Landings", :type => :feature do
  let(:user) { create(:user) }

  scenario "Signing in with correct credentials" do
    sign_in_with(user.email, user.password)
    expect(page).to have_content 'Welcome, '
  end

  scenario "Signing in with bad credentials" do
    sign_in_with('blarg@blerg.com', 'blarg')
    expect(page).to have_content 'Invalid email/password combination'
  end

  scenario "Signing up with correct information" do
    sign_up
    expect(page).to have_content 'Sign Up Confirmation
Are these values correct?'
    click_button 'Yes'
    expect(page).to have_content 'Welcome to Bloccit'
  end

  scenario "Signing up and updating information" do
    sign_up
    expect(page).to have_content 'Sign Up Confirmation
Are these values correct?'
    click_button 'No'
    sign_up
    click_button 'Yes'
    expect(page).to have_content 'Welcome to Bloccit'
  end

  private

  def sign_in_with(email, password)
    visit '/sessions/new'
    fill_in "Email", with: email
    fill_in "Password", with: password
    click_button 'Sign in'
  end

  def sign_up
    visit '/users/new'
    password = RandomData.random_sentence

    fill_in "Name", with: RandomData.random_word
    fill_in "Email", with: RandomData.random_word + "@bloccit.com"
    fill_in "Password", with: password
    fill_in "Password confirmation", with: password
    click_button 'Sign up'
  end
end