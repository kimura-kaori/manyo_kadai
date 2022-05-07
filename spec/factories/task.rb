FactoryBot.define do
  #実際にテストの時に入力するデータ
  factory :task do
    title { 'Factoryで作ったタイトル1' }
    content { 'Factoryで作ったコンテント1' }
    deadline { '2022-03-03' }
    priority { '高' }
    status { 'start' }
  end

  factory :second_task, class: Task do
    title { 'Factoryで作ったタイトル2' }
    content { 'Factoryで作ったコンテント2' }
    deadline { '2022-04-04' }
    priority { '低' }
    status { 'start' }
  end
end
