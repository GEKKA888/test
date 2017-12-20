require 'rails_helper'

RSpec.describe PostsController, type: :controller do

    describe 'GETメソッドのindexアクションについて' do

      before do
        get :index
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
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
