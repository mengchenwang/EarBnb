feature 'Conversation' do
  let!(:user) do
    User.create(first_name: 'Jack',
                last_name: 'Bauer',
                email: 'jbauer@ctu.com',
                password: 'damn_it!',
                password_confirmation: 'damn_it!')
  end

  scenario 'I can see a converation button' do
    sign_in(email: user.email, password: user.password)
    click_button('Conversations')
    expect(page).to have_content('Conversations')
  end

  scenario 'I can have a conversation with a property owner' do
    User.create(first_name: 'Marcus',
                last_name: 'Rands',
                email: 'mr@rands.com',
                password: 'rands',
                password_confirmation: 'rands')

    sign_in(email: user.email, password: user.password)
    create_property
    click_button('Sign out')
    sign_in(email: 'mr@rands.com', password: 'rands')
    click_link('proplink')
    click_button('Contact the owner')
    fill_in :content, with: 'Hello Mr Property Owner'
    click_button('Send')
    click_button('View')
    expect(page).to have_content('Hello Mr Property Owner')
  end

  scenario 'I can have a conversation with a potential renter' do
    User.create(first_name: 'Marcus',
                last_name: 'Rands',
                email: 'mr@rands.com',
                password: 'rands',
                password_confirmation: 'rands')

    sign_in(email: user.email, password: user.password)
    create_property
    click_button('Sign out')
    sign_in(email: 'mr@rands.com', password: 'rands')
    click_link('proplink')
    click_button('Contact the owner')
    fill_in :content, with: 'Hello Mr Property Owner'
    click_button('Send')
    click_button('View')
    expect(page).to have_content('Hello Mr Property Owner')
    click_button('Sign out')
    sign_in(email: user.email, password: user.password)
    click_button('Conversations')
    click_button('View')
    click_button('Send a new message')
    fill_in :content, with: 'Hello Mr Renter'
    click_button('Send')
    expect(page).to have_content('Hello Mr Renter')
  end
end
