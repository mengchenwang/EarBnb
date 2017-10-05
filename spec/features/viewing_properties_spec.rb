feature 'Viewing propertiees' do

  let!(:user) do
    User.create(first_name: 'Jack Bauer',
                last_name: 'Jack24',
                email: 'jbauer@ctu.com',
                password: 'damn_it!',
                password_confirmation: 'damn_it!')


  end

  scenario 'I can see existing properties on the properties page' do
    sign_in(email: user.email,   password: user.password)
    create_property

    expect(current_path).to eq('/properties')

    within 'ul' do
      expect(page).to have_content('Test Street')
    end
  end
end
