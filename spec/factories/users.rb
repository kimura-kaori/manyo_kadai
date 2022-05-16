FactoryBot.define do

  factory :admin_user, class: User do
    id { 1 }
    name { "管理者" }
    email { "admin@admin.com" }
    password { '123456' }
    password_confirmation { '123456' }
    admin { "true" }
  end

  factory :user1, class: User do
    id { 3 }
    name { "一般ユーザー3" }
    email { "normal3@normal.com" }
    password { '333333' }
    password_confirmation { '333333' }
    admin { "false" }
  end

  factory :user2, class: User do
    id { 4 }
    name { "一般ユーザー4" }
    email { "normal2@normal.com" }
    password { '444444' }
    password_confirmation { '444444' }
    admin { "false" }
  end
end
