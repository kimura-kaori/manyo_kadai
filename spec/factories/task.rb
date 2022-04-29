FactoryBot.define do
  # factory :task do
  #   title { 'test_title' }
  #   content { 'test_content' }
  #   deadline { 'test_deadline' }
  #   priority { 'test_priority' }
  #   status { 'test_status' }
  # end
  #
  factory :task do
    title { 'Factoryで作ったデフォルトのタイトル１' }
    content { 'Factoryで作ったデフォルトのコンテント１' }
    deadline { '2022-03-03' }
    priority { '低' }
    status { '未着手' }
  end
end
