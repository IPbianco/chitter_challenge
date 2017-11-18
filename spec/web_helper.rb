def sign_up
  visit '/chitter/sign_up'
  expect(page.status_code).to eq(200)
  fill_in('name', with: 'Elvis')
  fill_in('email', with: 'elvis@gmail.com')
  fill_in('username', with: 'King')
  fill_in('password', with: 'Blue_Hawaii')
  click_button('Sign up!')
end
