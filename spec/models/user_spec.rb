require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @user = FactoryBot.build(:user)
  end

   describe "ユーザー新規登録" do
    context '新規登録できる場合' do
      it "ニックネーム、email、password、password_confirmation、名前(全角)、名前カナ(全角)、生年月日が存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end
    context '新規登録できない場合' do
      it "ニックネームが空では登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "emailが重複で登録できない" do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "emailが@を含まず登録できない" do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "passwordが空では登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordは5文字以下では登録できない" do
        @user.password = '123ab'
        @user.password_confirmation = '123ab'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordは半角英字だけでは登録できない" do
        @user.password = 'abcdef'
        @user.password_confirmation = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "passwordは数字だけでは登録できない" do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "passwordとpassword_confirmationが一致していないと登録できない" do
        @user.password = '123abc'
        @user.password_confirmation = '123abcd'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "苗字が空では登録できない" do
        @user.lastname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname can't be blank")
      end
      it "名前が空では登録できない" do
        @user.firstname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname can't be blank")
      end
      it "苗字が半角文字では登録できない" do
        @user.lastname = 'lastname'
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname is invalid")
      end
      it "名前が半角文字では登録できない" do
        @user.firstname = 'firstname'
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname is invalid")
      end
      it "苗字カナが空では登録できない" do
        @user.lastname_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname kana can't be blank")
      end
      it "名前カナが空では登録できない" do
        @user.firstname_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname kana can't be blank")
      end
      it "苗字カナが半角文字では登録できない" do
        @user.lastname_kana = 'lastname'
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname kana is invalid")
      end
      it "名前カナが半角文字では登録できない" do
        @user.firstname_kana = 'firstname'
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname kana is invalid")
      end
      it "生年月日が空では登録できない" do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
   end
 end
