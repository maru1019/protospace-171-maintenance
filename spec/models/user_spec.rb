require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @user = FactoryBot.build(:user)
  end

  context 'ユーザー情報新規登録' do
    describe '成功' do
      it '全ての項目が埋まっていて、かつ要件を満たしている' do
        expect(@user).to be_valid
      end
    end
    describe '失敗' do
      it 'メールアドレスが必須であること' do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'メールアドレスが一意性であること' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it 'メールアドレスは、@を含む必要があること' do
        @user.email = "test.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it 'パスワードが必須であること' do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'パスワードは、6文字以上での入力が必須であること' do
        @user.password = "12345"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'パスワードとパスワード（確認）は、値の一致が必須であること' do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'ユーザー名が必須であること' do
        @user.name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end
      it 'プロフィールが必須であること' do
        @user.profile = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Profile can't be blank")
      end
      it '所属が必須であること' do
        @user.occupation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Occupation can't be blank")
      end
      it '役職が必須であること' do
        @user.position = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Position can't be blank")
      end
    end
  end
end
