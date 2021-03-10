require 'rails_helper'
RSpec.describe Comment, type: :model do
   it "Validation does not pass if the message is empty" do
   Task.create(name: "Test", quantity:"7", unit_price: "122")
   User.create(name: 'test', email: 'test@gmail.com', user_role: 'Farmer', password: 'password', password_confirmation: 'password')
   comment = Comment.new(task_id: '1', user_id: '1', message: '')
   expect(comment).not_to be_valid
   end
   it "validation passes If the message is present" do
   Task.create(name: "Test", quantity: "7", unit_price: "122")
   User.create(name: 'test', email: 'test@gmail.com', user_role: 'Farmer', password: 'password', password_confirmation: 'password')
   comment = Comment.new(task_id: '1', user_id: '1', message: 'This product is less expensive in the shop I visited yesterday')
   expect(comment).not_to be_valid
   end
end
