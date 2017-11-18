def sign_up(password_confirmation: 'Blue_Hawaii', email: 'elvis@gmail.com')
  visit '/sign_up'
  expect(page.status_code).to eq(200)
  fill_in('name', with: 'Elvis')
  fill_in('email', with: email)
  fill_in('username', with: 'King')
  fill_in('password', with: 'Blue_Hawaii')
  fill_in('password_confirmation', with: password_confirmation)
  click_button('Sign up!')
end
