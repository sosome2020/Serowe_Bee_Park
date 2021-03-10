require 'rails_helper'
RSpec.describe Appointment, type: :model do
   it "Validation does not pass if there is no user_id" do
   User.create(name: 'test', email: 'test@gmail.com', user_role: 'Farmer', password: 'password', password_confirmation: 'password')
   User.create(name: 'test2', email: 'test2@gmail.com', user_role: 'Stakeholder', password: 'password2', password_confirmation: 'password2')
   appointment = Appointment.new(user_id: '', date: '2020/10/10', time: '3:25')
   expect(appointment).not_to be_valid
 end
   it "validation passes If there is an user_id" do
   User.create(name: 'test', email: 'test@gmail.com', user_role: 'Farmer', password: 'password', password_confirmation: 'password')
   User.create(name: 'test2', email: 'test2@gmail.com', user_role: 'Stakeholder', password: 'password2', password_confirmation: 'password2')
   appointment = Appointment.new(user_id: '1', date: '2020/10/10', time: '3:25')
   expect(appointment).not_to be_valid
   end
end
