require 'rails_helper'
RSpec.describe 'Label function', type: :system do
before do
  FactoryBot.create(:user, name: 'test',
  email: 'test@gmail.com',
  password: 'password',
  password_confirmation: 'password')
  visit new_session_path
  fill_in 'Email', with: 'test@gmail.com'
  fill_in 'Password', with: 'password'
  click_button 'Log in'
  @user = User.first
end
describe 'New creation function' do
context 'When creating a new label' do
it 'Should display created Label' do
  visit new_session_path
  fill_in 'Email', with: 'test@gmail.com'
  fill_in 'Password', with: 'password'
  click_button 'Log in'
  visit new_label_path
  fill_in 'Name', with: 'Work'
  click_button 'Create Label'
  expect(page).to have_content 'successfully created.'
end
end
end
describe 'Adding multiple labels to tasks function' do
context 'When you add labels to task' do
it 'The creates task with label' do
  visit new_session_path
  fill_in 'Email', with: 'test@gmail.com'
  fill_in 'Password', with: 'password'
  click_button 'Log in'
  visit new_label_path
  fill_in 'Name', with: 'Test1'
    click_button 'Create Label'
    visit new_label_path
    fill_in 'Name', with: 'Test2'
      click_button 'Create Label'
  visit new_task_path
  fill_in 'Task name', with: 'Task1'
  fill_in 'Task detail', with: 'details'
  fill_in 'Expiration date', with: '2022-08-07'
  select 'Completed'
  select 'High'
  page.has_field?('Test1', checked: true)
  page.has_field?('Test2', checked: true)
  click_button 'Create Task'
  expect(page).to have_content 'Task was successfully created.'
end
end
end
describe 'Search function' do
context 'When you search by label' do
it "Searching by label name" do
  visit new_session_path
  fill_in 'Email', with: 'test@gmail.com'
  fill_in 'Password', with: 'password'
  click_button 'Log in'
  visit new_label_path
  fill_in 'Name', with: 'testing'
    click_button 'Create Label'
  task = Task.create(task_name: "test", task_detail: "test
  content", expiration_date: "2022/09/08", status:"Completed", priority: 3,
  user_id: @user.id)
  visit tasks_path
  select 'testing'
  click_on 'search'
  expect(page).to have_content 'testing'
end
end
end
end
