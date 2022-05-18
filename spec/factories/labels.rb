FactoryBot.define do
  factory :label do
    name { "label_1" }
  end
  factory :label2, class: Label do
    name { "label_2" }
  end
end
