feature 'Delete property' do

  scenario 'property owner' do
    sign_up
    create_property
    click_link 'Test Street'
    click_link 'Delete property'
    expect('page').to not_have_content('Test Street')
  end

  # scenario 'guest' do
  #   sign_up
  #   create_property
  #   click_button 'Sign out'
  #   sign_out
  #   click_link 'New Street'
  #   expect('page').to not_have_content('Delete Property')
  # end
  #
  # scenario 'not property owner' do
  #   sign_up
  #   create_property
  #   signout
  #   sign_up('Keith','Amaoh','k@a','worlds','worlds')
  #   click_link 'New Street'
  #   expect('page').to not_have_content('Delete Property')
  # end
end
