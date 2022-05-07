require 'rails_helper'
describe 'タスクモデル機能', type: :model do
  describe '検索機能' do
    let!(:task) { FactoryBot.create(:task, title: 'テスト', status: 'yet') }
    let!(:second_task) { FactoryBot.create(:second_task, title: "サンプル", status: 'start') }
    context 'scopeメソッドでタイトルのあいまい検索をした場合' do
      it "検索キーワードを含むタスクが絞り込まれる" do
        expect(Task.get_by_title('テスト')).to include(task)
        expect(Task.get_by_title('テスト')).not_to include(second_task)
        expect(Task.get_by_title('テスト').count).to eq 1
      end
    end
    context 'scopeメソッドでステータス検索をした場合' do
      it "ステータスに完全一致するタスクが絞り込まれる" do
        expect(Task.get_by_status('yet')).to include(task)
        expect(Task.get_by_status('yet')).not_to include(second_task)
        expect(Task.get_by_status('yet').count).to eq 1
      end
    end
    context 'scopeメソッドでタイトルのあいまい検索とステータス検索をした場合' do
      it "検索キーワードをタイトルに含み、かつステータスに完全一致するタスク絞り込まれる" do
        expect(Task.get_by_title('テスト')).to include(task)
        expect(Task.get_by_status('yet')).to include(task)
        expect(Task.get_by_title('テスト')).not_to include(second_task)
        expect(Task.get_by_status('yet')).not_to include(second_task)
        expect(Task.get_by_title('テスト').count).to eq 1
        expect(Task.get_by_status('yet').count).to eq 1
      end
    end
  end
end
