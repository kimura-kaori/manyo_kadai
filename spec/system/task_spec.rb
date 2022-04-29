require 'rails_helper'
RSpec.describe 'タスク管理機能', type: :system do
  # before do
  #   FactoryBot.create(:task)
  # end

  describe '新規作成機能' do
    context 'タスクを新規作成した場合' do
      it '作成したタスクが表示される' do
        visit new_task_path
        fill_in "task[title]", with: "メーカー直送"
        fill_in "task[content]", with: "自動化"
        fill_in "task[deadline]", with: "2022-03-01"
        fill_in "task[priority]", with: "高"
        fill_in "task[status]", with: "未着手"
        click_on "Create Task"
        expect(page).to have_content 'メーカー直送'
      end
    end
  end
  describe '一覧表示機能' do
    context '一覧画面に遷移した場合' do
      it '作成済みのタスク一覧が表示される' do
        task = FactoryBot.create(:task, title: 'task', content: '卒業発表会', deadline: '2022-04-28', priority: '高', status: '未着手')
        visit tasks_path
        expect(page).to have_content 'task'
      end
    end
  end
  describe '詳細表示機能' do
     context '任意のタスク詳細画面に遷移した場合' do
       it '該当タスクの内容が表示される' do
         # visit task_path(@task.id)
         # expect(page).to have_content '詳細'
       end
     end
  end
end
