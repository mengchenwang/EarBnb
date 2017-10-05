module SessionHelpers

 def sign_in(email: 'jbauer@ctu.gov', password: 'damn_it!' )
   visit '/sessions/new'
   fill_in :email, with: email
   fill_in :password, with: password
   click_button 'Sign in'
 end

 def sign_up(first_name: 'Jack',
             last_name: 'Bauer',
             email: 'jbauer@ctu.gov',
             password: 'damn_it!',
             password_confirmation: 'damn_it!')
   visit '/users/new'

   fill_in :first_name,  with: first_name
   fill_in :last_name,   with: last_name
   fill_in :email,       with: email
   fill_in :password,    with: password
   fill_in :password_confirmation, with: password_confirmation
   click_button 'Sign up'
 end

 def create_property(address: "Test Street", description: "this is an awesome house")
   visit('/properties/new')
   fill_in      :address1, with: address
   fill_in      :price, with: 10
   select       '3', from: 'bedrooms'
   fill_in      :description, with: description
   #attach_file('1200px-Buckingham_Palace__London_-_April_2009.jpg', 'app/public/property/images/1200px-Buckingham_Palace__London_-_April_2009.jpg')
   click_button 'Submit'
 end

end
