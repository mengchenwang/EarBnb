feature 'Delete property' do
  scenario 'property owner' do
    sign_up
    create_property
    click_link 'Test Street'
    click_button 'Delete property'

    expect(current_path).to eq('/properties')

    within 'ul#properties' do
      expect('page').to_not have_content('Test Street')
    end
  end

  scenario 'guest' do
    sign_up
    create_property
    click_button 'Sign out'
    visit '/properties'
    click_link 'Test Street'

    expect('page').to_not have_content('Delete Property')
  end

  scenario 'not property owner' do
    sign_up
    create_property
    click_button 'Sign out'
    sign_up(first_name: 'Keith',
            last_name: 'Amaoh',
            email: 'k@a.com',
            password: 'worlds',
            password_confirmation: 'worlds')
    click_link 'Test Street'

    expect('page').to_not have_content('Delete Property')
  end
end
