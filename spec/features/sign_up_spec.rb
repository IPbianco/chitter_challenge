require_relative '../web_helper'

feature 'Sign up' do
  scenario 'I can sign up as a user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome King!')
    expect(User.first.email).to eq 'elvis@gmail.com'
  end

  scenario 'Requires a matching confirmation password' do
    expect do
      sign_up(password_confirmation: 'wrong')
    end
      .not_to change(User, :count)
  end

  scenario 'The user fails confirming password' do
    sign_up(password_confirmation: 'wrong')
    expect(current_path).to eq '/sign_up'
    expect(page).to have_content 'Password and conf. password do not match'
  end

  scenario 'I can\'t sign up without an email' do
    expect { sign_up(email: nil) }.not_to change(User, :count)
  end

  scenario 'I can\'t sign up with an invalid email' do
    expect { sign_up(email: 'invalid@email') }.not_to change(User, :count)
  end
end
