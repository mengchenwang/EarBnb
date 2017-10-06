feature 'Clicking on property' do
  let!(:user) do
    User.create(first_name: 'Jack Bauer',
                last_name: 'Jack24',
                email: 'jbauer@ctu.com',
                password: 'damn_it!',
                password_confirmation: 'damn_it!')
  end

  scenario 'I can select a property to view after creating an account' do
    sign_in(email: user.email, password: user.password)
    create_property
    click_link('proplink')
    expect(page).to have_content('Test Street')
  end

  scenario 'I can select a property to view without signing in' do
    sign_in(email: user.email, password: user.password)
    create_property
    click_button 'Sign out'
    visit '/properties'
    click_link('proplink')
    expect(page).to have_content('Test Street')
  end
end
