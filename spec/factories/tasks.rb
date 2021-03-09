FactoryBot.define do
  factory :task_2 do
  task_name { 'test_title' }
  task_detail { 'test_content' }
  expiration_date { '2021-09-29'}
  user
  end

  factory :second_task_2, class: Task do
  task_name { 'second' }
  task_detail { 'second one' }
  expiration_date { '2020-01-07'}
  user
  end

  factory :third_task_2, class: Task do
  task_name { 'third' }
  task_detail { 'third one' }
  expiration_date { '2022-11-29'}
  user
  end

end
