FactoryBot.define do
  # factory :task do
  #   title { 'test_title' }
  #   content { 'test_content' }
  #   deadline { 'test_deadline' }
  #   priority { 'test_priority' }
  #   status { 'test_status' }
  # end
  #
  #実際にテストの時に入力するデータ
  factory :task do
    title { 'Factoryで作ったタイトル1' }
    content { 'Factoryで作ったコンテント1' }
    deadline { '2022-03-03' }
    priority { '低' }
    status { '未着手' }
  end

  factory :second_task, class: Task do
    title { 'Factoryで作ったタイトル2' }
    content { 'Factoryで作ったコンテント2' }
    deadline { '2022-03-04' }
    priority { '高' }
    status { '未着手' }
  end
end
