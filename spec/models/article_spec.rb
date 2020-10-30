require 'rails_helper'

RSpec.describe Article, type: :model do
  let!(:user) { create(:user, email: 'test@test.com') }
    
  context 'タイトルと内容が入力がされている場合' do
    let(:article) { build(:article, user: user) }

    it '記事を保存出来る' do
      expect(article).to be_valid
    end
  end

  context 'タイトルの文字が１文字の場合' do
    let(:article) { build(:article, title: Faker::Lorem.characters(number: 1), user: user )}

    before do
      article.save
    end

    it '記事を保存出来ない' do 
      expect(article.errors.messages[:title][0]).to eq('は2文字以上で入力してください')
    end
  end
end
