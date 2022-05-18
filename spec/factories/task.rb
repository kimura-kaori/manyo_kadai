# FactoryBot.define do
#   factory :task, class: Task do
#     trait :with_a_label_and_labellings do
#       after(:build) do |task|
#         task.labels << FactoryBot.build(:label, :with_labellings)
#       end
#     end
#   end
# end
#
# FactoryBot.define do
#   factory :label, class: Label do
#     after(:build) do |label|
#     label.labellings = FactoryBot.build_list(:labelling, 0)
#     end
#   end
# end
#     after(:build) do |task|
#       label = create(:label)
#       task.labellings << build(:labelling, task: task, label: label)
#     end
#
  # factory :second_task, class: Task do
  #   title { 'Factoryで作ったタイトル2' }
  #   content { 'Factoryで作ったコンテント2' }
  #   deadline { '2022-04-04' }
  #   priority { '低' }
  #   status { 'start' }
  #
  #   after(:build) do |task|
  #     label = create(:label)
  #     task.labellings << build(:labelling, task: task, label: label)
  #   end
  # end
  # FactoryBot.define do
  #   factory :task do
  #     title { "Through the Looking Glass" }
  #     user
  #   end
  #
  #   factory :user do
  #     name { "Rachel Sanchez" }
  #   end
  # end
  #
  # def user_with_posts(posts_count: 5)
  #   FactoryBot.create(:user) do |user|
  #     FactoryBot.create_list(:post, posts_count, user: user)
  #   end
  # end
