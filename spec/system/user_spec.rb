require 'rails_helper'

RSpec.describe 'ユーザー管理機能' , type: :system do

  context '新規登録画面に遷移した場合' do
    it '新規登録ができる' do
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

  context 'ログインができた場合' do
    it '自分の詳細画面(マイページ)に飛べること' do
      visit new_user_path
      fill_in 'user_name', with: '木村'
      fill_in 'user_email', with: 'abc@abc.com'
      fill_in 'user_password', with: '111111'
      fill_in 'user_password_confirmation', with: '111111'
      click_on "Create my account"
      expect(page).to have_content '木村のページ'
    end
  end

  before do
    FactoryBot.create(:user1)
    FactoryBot.create(:user2)
  end
  describe "セッション機能" do
    # let!(:user1) { FactoryBot.create(:user1) }
    # let!(:user2) { FactoryBot.create(:user2) }
    context '一般ユーザが他人の詳細画面に飛んだ場合' do
      it 'タスク一覧画面に遷移する' do
        visit new_session_path
        fill_in 'session_email', with: 'normal@normal.com'
        fill_in 'session_password', with: '654321'
        click_on "Log in"
        visit user_path(3)
        expect(page).to have_content 'タスク一覧'
      end
    end

  context 'ログイン後' do
    it 'ログアウトができる' do
    visit new_session_path
    fill_in 'session_email', with: 'normal@normal.com'
    fill_in 'session_password', with: '654321'
    click_on "Log in"
    click_on "Logout"
    expect(page).to have_content 'Log in'
  end
  end

  end
end
