require 'rails_helper'
RSpec.describe 'Task management function', type: :system do
  before do
FactoryBot.create(:user, name: 'test', email: 'test@gmail.com', user_role: 'Farmer', password: 'password', password_confirmation: 'password')
visit new_session_path
fill_in 'Email', with: 'test@gmail.com'
fill_in 'Password', with: 'password'
click_button 'Log in'
@user = User.first
end


  describe 'New creation function' do
    context 'When creating a new equipment' do
      it 'The created equipment is displayed' do
        visit new_session_path
        fill_in 'Email', with: 'test@gmail.com'
        fill_in 'Password', with: 'password'
        click_button 'Log in'
        visit new_task_path
        fill_in 'Name', with: "Bee suit"
        fill_in 'Quantity', with: "3"
          fill_in 'Unit price', with: "200"
        click_button 'Create Equipment'
        expect(page).to have_content 'Equipment was successfully created.'
      end
    end
  end
  describe 'List display function' do
    context 'When transitioning to the list screen' do
      it 'The created equipment list is displayed' do
        visit new_session_path
        fill_in 'Email', with: 'test@gmail.com'
        fill_in 'Password', with: 'password'
        click_button 'Log in'
        visit new_task_path
        visit new_task_path
        fill_in 'Name', with: "Bee suit"
        fill_in 'Quantity', with: "3"
          fill_in 'Unit price', with: "200"
        click_button 'Create Equipment'
        visit tasks_path
        expect(page).to have_content 'Bee suit'
        expect(page).to have_content '200'
      end
    end
  end
  describe 'Detailed display function' do
     context 'When transitioned to any equipment details screen' do
       it 'The content of the relevant equipment is displayed' do
         visit new_session_path
         fill_in 'Email', with: 'test@gmail.com'
         fill_in 'Password', with: 'password'
         click_button 'Log in'
         visit new_task_path
         visit new_task_path
         fill_in 'Name', with: "Bee suit"
         fill_in 'Quantity', with: "3"
           fill_in 'Unit price', with: "200"
         click_button 'Create Equipment'
         visit tasks_path
         expect(page).to have_content 'Bee suit'
       end
     end
  end
    context 'When equipments are arranged in descending order of creation date and time' do
      it 'New equipment is displayed at the top' do
        visit new_session_path
        fill_in 'Email', with: 'test@gmail.com'
        fill_in 'Password', with: 'password'
        click_button 'Log in'
        visit tasks_path
        assert Task.all.order(created_at: "DESC")
      end
    end
    describe 'Search function' do

        context 'When you search by name' do
          it "Filter by equipments that include search keywords" do
            visit new_session_path
            fill_in 'Email', with: 'test@gmail.com'
            fill_in 'Password', with: 'password'
            click_button 'Log in'
            visit new_task_path
            visit new_task_path
            fill_in 'Name', with: "Bee suit"
            fill_in 'Quantity', with: "3"
              fill_in 'Unit price', with: "200"
            click_button 'Create Equipment'
            visit tasks_path
            fill_in 'Name of the equipment', with: 'Bee suit'
            click_on 'search'
            expect(page).to have_content 'Bee suit'
          end
        end

      end
end
