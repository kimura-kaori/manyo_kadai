class User < ApplicationRecord
  before_validation { email.downcase! }
  before_destroy :admin_exist_check
  before_update :admin_update_exist

  has_many :tasks, dependent: :destroy
  validates :name,  presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  has_secure_password
  validates :password, length: { minimum: 6 }
  # if admin_change
  #最後の1人の管理者ユーザーを削除しない
  # def not_destroy_last_one_admin_user
  #   #削除しようとしているユーザー以外に管理者がいない場合は、削除を中止する。
  #   #User.where(admin: true).count <= 1 では、管理者ユーザーが一人未満かどうか、かつ、選択したユーザーが管理者（admin:true）かどうかを確認している。
    # if User.where(admin: true).count == 1 && self.admin == true
  #     throw(:abort)
  #   end
  # end
  #
  # def not_update_last_one_admin_user
  #   #self.admin == falseにしないと、最後の一人の管理者のチェックを外したらadmin == falseになり、管理者が０人になってしまうから。
  #   if User.where(admin: true).count == 1 && self.admin
  #     throw(:abort)
  #   end


  def admin_exist_check
    if User.where(admin: true).count <= 1 && self.admin == true
      throw(:abort)
    end
  end

  def admin_update_exist
    if User.where(admin: true).count == 1 && self.admin == false
      throw(:abort)
    end
  end
end
