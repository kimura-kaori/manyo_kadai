require 'rails_helper'

RSpec.describe 'タスク管理機能', type: :system do
  #:create(:task)の引数にある:taskは、factory :task doの:taskを示している。それをlet!(:task)に代入している。
  let!(:task) { FactoryBot.create(:task) }

  describe '新規作成機能' do
    context 'タスクを新規作成した場合' do
      it '作成したタスクが表示される' do
        visit new_task_path
        fill_in "task[title]", with: "メーカー直送"
        fill_in "task[content]", with: "自動化"
        fill_in "task[deadline]", with: "2022-02-01"
        fill_in "task[priority]", with: "高"
        fill_in "task[status]", with: "未着手"
        click_on "登録する"
        expect(page).to have_content 'メーカー直送'
      end
    end
  end
  describe '一覧表示機能' do
    before do
      # Task.destroy_all
      FactoryBot.create(:task, title: 'task1', content: '卒業発表会', deadline: '2022-05-05', priority: '高', status: '未着手')
      FactoryBot.create(:task, title: '最後のタスク', content: '卒業発表会', deadline: '2022-06-06', priority: '高', status: '未着手')
      visit tasks_path
    end
    context '一覧画面に遷移した場合' do
      it '作成済みのタスク一覧が表示される' do
        expect(page).to have_content 'task'
      end
    end
    context 'タスクが作成日時の降順に並んでいる場合' do
      it '新しいタスクが一番上に表示される' do
        visit tasks_path
        #all('.task_row')で、titleに入っている値を取得し、変数に代入。
        task_list = all('.task_row')
        #コントローラーで降順に並び替えてるから、並びの最初に作成日時が一番新しいものが来るはず。to（その結果が）本文が最後のタスクとなっているはずであるという意味で定義。
        expect(task_list.first).to have_content'最後のタスク'
      end
    end
  end
  describe '詳細表示機能' do
     context '任意のタスク詳細画面に遷移した場合' do
       it '該当タスクの内容が表示される' do
         visit task_path(task.id)
         expect(page).to have_content 'Factoryで作ったコンテント1'
       end
     end
  end
end
