require 'rails_helper'

RSpec.describe 'ユーザー管理機能' , type: :system do

  # before do
  #  FactoryBot.create(:user)
  # end

  context '新規登録画面に遷移した場合' do
    it '新規登録ができる' do
      # user = FactoryBot.create(:user, name:'一般ユーザー')
      visit new_user_path
      fill_in 'user_name', with: '木村'
      fill_in 'user_email', with: 'abc@abc.com'
      fill_in 'user_password', with: '111111'
      fill_in 'user_password_confirmation', with: '111111'
      click_on "Create my account"
      expect(page).to have_content '木村のページ'
    end
  end

  context 'ユーザがログインせずタスク一覧画面に飛ぼうとした場合' do
    it 'ログイン画面に遷移する' do
      visit tasks_path
      expect(page).to have_content 'Log in'
    end
  end
end

# it 'ログインせずタスク一覧画面に飛ぼうとしたとき、ログイン画面に遷移する' do
