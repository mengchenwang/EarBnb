feature 'Creating properties' do
  let!(:user) do
    User.create(first_name: 'Jack Bauer',
                last_name: 'Jack24',
                email: 'jbauer@ctu.com',
                password: 'damn_it!',
                password_confirmation: 'damn_it!')
  end

  scenario 'I can create a new property' do
    sign_in(email: user.email, password: user.password)
    click_button('Make new listing')
    create_property

    expect(current_path).to eq('/properties')

    within 'ul' do
      expect(page).to have_content('Test Street')
    end
  end

  scenario 'I cannot create a property without a description' do
    sign_in(email: user.email,   password: user.password)
    visit '/properties/new'

    expect { click_button 'Submit' }.to_not change(Property, :count)
    expect(current_path).to eq('/properties')
    expect(page).to have_content('Description must not be empty')
  end

  scenario 'I cannot create a property description longer than 300 chars.' do
    sign_in(email: user.email,   password: user.password)
    visit '/properties/new'
    create_property(description: 'Hey' * 101)

    expect { click_button 'Submit' }.to_not change(Property, :count)
    expect(current_path).to eq('/properties')
    expect(page).to have_content('Description must not be more than 300 characters')
  end
end
