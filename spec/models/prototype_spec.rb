require 'rails_helper'

RSpec.describe Prototype, type: :model do

  before do
    @prototype = FactoryBot.build(:prototype)
  end

  context 'プロトタイプ投稿機能' do
    describe '成功' do
      it '全ての項目を入力している' do
        expect(@prototype).to be_valid
      end
    end
    describe '失敗' do
      it 'プロトタイプの名称が必須であること' do
        @prototype.title = ""
        @prototype.valid?
        expect(@prototype.errors.full_messages).to include("Title can't be blank")
      end
      it 'キャッチコピーが必須であること' do
        @prototype.catch_copy = ""
        @prototype.valid?
        expect(@prototype.errors.full_messages).to include("Catch copy can't be blank")
      end
      it 'コンセプトの情報が必須であること' do
        @prototype.concept = ""
        @prototype.valid?
        expect(@prototype.errors.full_messages).to include("Concept can't be blank")
      end
      it '画像は1枚必須であること' do
        @prototype.image = nil
        @prototype.valid?
        expect(@prototype.errors.full_messages).to include("Image can't be blank")
      end
    end
  end

end
