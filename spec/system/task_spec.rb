require 'rails_helper'

RSpec.describe 'タスク管理機能', type: :system do
  #:create(:task)の引数にある:taskは、factory :task doの:taskを示している。それをlet!(:task)に代入している。
  let!(:task) { FactoryBot.create(:task) }

  describe '新規登録機能' do
    context 'タスクを新規登録した場合' do
      it 'ステータスも登録ができる' do
        visit new_task_path
        fill_in "task[title]", with: "メーカー直送"
        fill_in "task[content]", with: "自動化"
        fill_in "task[deadline]", with: "2022-02-01"
        fill_in "task_priority", with: "高"
        select 'yet', from: 'task_status'
        click_on "Create Task"
        expect(page).to have_content 'メーカー直送'
      end
    end
  end

    before do
      FactoryBot.create(:task, title: 'task1', content: '卒業発表会', deadline: '2022-05-05', priority: '高', status: 'start')
      FactoryBot.create(:task, title: '最後のタスク', content: '卒業発表会', deadline: '2022-06-06', priority: '高', status: 'start')
    end

    context 'タイトルであいまい検索をした場合' do
      it "検索キーワードを含むタスクで絞り込まれる" do
        visit tasks_path
        fill_in 'title', with: 'ta'
        click_on "検索"
        expect(page).to have_content 'task1'
      end
    end

    context 'ステータス検索をした場合' do
      it "ステータスに完全一致するタスクが絞り込まれる" do
        visit tasks_path
        select 'start', from: 'status'
        click_on "検索"
        expect(page).to have_content 'Factoryで作ったタイトル1'
        expect(page).to have_content 'task1'
        expect(page).to have_content '最後のタスク'
      end
    end

    context 'タイトルのあいまい検索とステータス検索をした場合' do
      it "検索キーワードをタイトルに含み、かつステータスに完全一致するタスクに絞り込まれる" do
        visit tasks_path
        fill_in 'title', with: "Factory"
        select 'start', from: 'status'
        click_on "検索"
        expect(page).to have_content 'Factoryで作ったタイトル1'
      end
    end

    context '優先順位検索をした場合' do
      it "優先順位が高い順にソートできる" do
        visit tasks_path
        click_link "優先度"
        expect(page).to have_content '高'
      end
    end
end
