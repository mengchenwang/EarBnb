feature 'Editing properties' do

  scenario 'I can edit a property' do
    sign_up
    create_property
    click_link 'Test Street'
    click_button 'Edit property'
    edit_property

    expect(page).to have_content('New Street')
    expect(page).to have_content('£20')
    expect(page).to have_content('Bedrooms: 2')
    expect(page).to have_content('this has been changed')
    expect(page).to_not have_content('Test Street')
    expect(page).to_not have_content('£10')
    expect(page).to_not have_content('Bedrooms: 3')
    expect(page).to_not have_content('this is an awesome house')
  end
end
