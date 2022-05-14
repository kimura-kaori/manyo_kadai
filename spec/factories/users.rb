FactoryBot.define do

  factory :adin_user do
    name { "管理者" }
    email { "admin@admin.com" }
    password { 123456 }
    password_confirmation { 123456 }
    admin { "true" }
  end

  factory :user do
    name { "一般ユーザー" }
    email { "normal@normal.com" }
    password { 654321 }
    password_confirmation { 654321 }
    admin { "false" }
  end
end
