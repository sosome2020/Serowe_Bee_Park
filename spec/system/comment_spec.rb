require 'rails_helper'
RSpec.feature "Comment management function", type: :feature do
 scenario "Test Comment list" do
   User.create(name: 'test', email: 'test@gmail.com', user_role: 'Farmer', password: 'password', password_confirmation: 'password')
   task = Task.create(name: "Test", quantity:"7", unit_price: "122")
   visit 'sessions/new'
   fill_in 'Email', with: 'test@gmail.com'
   fill_in 'Password', with: 'password'
   click_button 'Log in'
   visit new_task_path
   fill_in 'Name', with: "Bee suit"
   fill_in 'Quantity', with: "3"
   fill_in 'Unit price', with: "200"
   click_button 'Create Equipment'
   expect(page).to have_content 'No Comments found'
 end
 scenario "Comment creation" do
   User.create(name: 'test', email: 'test@gmail.com', user_role: 'Farmer', password: 'password', password_confirmation: 'password')
   visit 'sessions/new'
   fill_in 'Email', with: 'test@gmail.com'
   fill_in 'Password', with: 'password'
   click_button 'Log in'
   visit new_task_path
   fill_in 'Name', with: "Bee suit"
   fill_in 'Quantity', with: "3"
   fill_in 'Unit price', with: "200"
   click_button 'Create Equipment'
   expect(page).to have_content 'Add Comment'
 end
end
