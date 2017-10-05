feature 'upload photos for property' do

  let!(:user) do
    User.create(first_name: 'Jack Bauer',
                last_name: 'Jack24',
                email: 'jbauer@ctu.com',
                password: 'damn_it!',
                password_confirmation: 'damn_it!')
              end


  scenario 'Upload a photo on the new property page' do
    sign_in(email: user.email, password: user.password)
    create_property
    click_link('proplink')
    expect(page).to have_xpath("//img[contains(@src, 'buckhouse.jpg')]")
  end
end
