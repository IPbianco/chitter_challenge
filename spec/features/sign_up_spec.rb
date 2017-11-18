require_relative '../web_helper'

feature 'Sign up' do
  scenario 'I can sign up as a user' do
    expect{ sign_up }.to change{ User.all.length }.by(1)
    expect(page).to have_content('Welcome King!')
    expect(User.first.email).to eq 'elvis@gmail.com'
  end
end
