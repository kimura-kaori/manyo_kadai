FactoryBot.define do

  factory :adin_user do
    id { 1 }
    name { "管理者" }
    email { "admin@admin.com" }
    password { '123456' }
    password_confirmation { '123456' }
    admin { "true" }
  end

  factory :user1, class: User do
    id { 2 }
    name { "一般ユーザー1" }
    email { "normal@normal.com" }
    password { '654321' }
    password_confirmation { '654321' }
    admin { "false" }
  end

  factory :user2, class: User do
    id { 3 }
    name { "一般ユーザー2" }
    email { "normal2@normal.com" }
    password { '111111' }
    password_confirmation { '111111' }
    admin { "false" }
  end
end
