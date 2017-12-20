require 'rails_helper'

RSpec.describe PostsController, type: :controller do

    describe 'GETメソッドのindexアクションについて' do

      before do
        get :index
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end

      it 'タスクをcreated_at降順で並べ替える' do
        create(:task,id:1,created_at:Time.now)
        create(:task,id:2,created_at:Time.now - 2.days)
        create(:task,id:3,created_at:Time.now - 1.days)
        expect(assigns(:posts).map(&:id)).to eq [1,3,2]
      end

      it '該当するビューが描画されていること' do
        expect(response).to render_template :index
      end

    end

    describe 'POSTメソッドのcreateアクションについて' do
      context '有効な入力の場合' do
        it 'リクエストは302 リダイレクトとなること' do
          #post :create, params: {title: 'hoge',content: 'hogehoge'}
          post :create, params: attributes_for(:task)
          expect(response.status).to eq 302
        end
        it 'データベースに新しいタスクが登録されること' do
          expect{
            post :create, params: attributes_for(:task)
          }.to change(Task, :count).by(1)
        end
      end
      context 'titleが50文字を超える入力な場合' do
        it 'リクエストは200 OKとなること' do
          post :create, params: attributes_for(:taska)
          expect(response.status).to eq 200
        end
        it 'データベースに新しいタスクが登録されないこと' do
        expect{
          post :create, params: attributes_for(:taska)
        }.not_to change(Task, :count)
        end
        it ':newテンプレートを再表示すること' do
          post :create, params: attributes_for(:taska)
          expect(response).to render_template :new
        end
      end
      context 'contentが140文字を超える入力な場合' do
        it 'リクエストは200 OKとなること' do
          post :create, params: attributes_for(:taskb)
          expect(response.status).to eq 200
        end
        it 'データベースに新しいタスクが登録されないこと' do
        expect{
          post :create, params: attributes_for(:taskb)
        }.not_to change(Task, :count)
        end
        it ':newテンプレートを再表示すること' do
          post :create, params: attributes_for(:taskb)
          expect(response).to render_template :new
        end
      end
    end

end
