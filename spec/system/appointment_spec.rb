require 'rails_helper'
RSpec.feature "Appointment management function", type: :feature do
   scenario "Test Appointment list" do
   User.create(name: 'test', email: 'test@gmail.com', user_role: 'Farmer', password: 'password', password_confirmation: 'password')
   visit 'sessions/new'
   fill_in 'Email', with: 'test@gmail.com'
   fill_in 'Password', with: 'password'
   click_button 'Log in'
   visit appointments_path
   expect(page).to have_content 'Meetings'
 end

 scenario "Appointment creation" do
   User.create(name: 'test', email: 'test@gmail.com', user_role: 'Farmer', password: 'password', password_confirmation: 'password')
   visit 'sessions/new'
   fill_in 'Email', with: 'test@gmail.com'
   fill_in 'Password', with: 'password'
   click_button 'Log in'
   visit appointments_path
   visit new_appointment_path
   fill_in 'Date', with: '10.10.2022'
   fill_in 'Time', with: '3:23'
   click_button 'Create Appointment'
   expect(page).to have_content '3:23'
 end
end
