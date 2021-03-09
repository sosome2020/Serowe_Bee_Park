require 'rails_helper'
describe 'Task model function', type: :model do
  describe "Validation test" do
      it "validation doesn't pass if name of the equipment is empty" do
        task = Task.new(name: '', quantity: 2, unit_price: 100)
        expect(task).not_to be_valid
      end

      it "validation passess if only the name of equipment is given" do
        task = Task.new(name: 'beehive')
        expect(task).not_to be_valid
      end
    end

end
