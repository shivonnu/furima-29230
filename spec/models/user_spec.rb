require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    it "nicknameが空だと登録できない" do
      @user.nickname = "" 
      @user.valid?
      expect(@user.errors.full_messages).to include("ニックネームを入力してください")
    end
    it "emailが空では登録できない" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Eメールを入力してください")
    end
    it "重複したemailが存在する場合登録できない" do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
     expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
    end
    it "emailに@が無い場合登録できない" do
      @user.email = "aaaaaa.com"  
      @user.valid?
      expect(@user.errors.full_messages).to include("Eメールは不正な値です")
    end
    it "passwordが空では登録できない" do
      @user.password = ""  
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードを入力してください", "パスワードが空です 数字と文字の両方を入力して下さい", "パスワード（確認用）とパスワードの入力が一致しません")
    end
    it "passwordが6文字以下では登録できない" do
      @user.password = "12345"
      @user.password_confirmation = "12345"
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください", "パスワードが空です 数字と文字の両方を入力して下さい")
    end
    it "passwordが半角英数字混合で無いと登録できない" do
      @user.password = "1234567"
      @user.password_confirmation = "1234567"
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードが空です 数字と文字の両方を入力して下さい")
    end
    it "passwordが存在してもpassword_confirmationが空では登録できない" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
    end

  end
  describe '本人情報確認' do
    it "ユーザー本名名字が空だと新規登録できない" do
      @user.last_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("苗字を入力してください", "苗字が空です 全角で入力して下さい")
    end
    it "ユーザー本名名前が空だと新規登録できない" do
      @user.first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("名前を入力してください", "名前が空です 全角で入力して下さい")
    end
    it "ユーザー本名が半角だと新規登録できない" do
      @user.last_name = "ﾔﾏﾀﾞ"
      @user.first_name = "ﾀﾛｳ"
      @user.valid?
      expect(@user.errors.full_messages).to include("苗字が空です 全角で入力して下さい", "名前が空です 全角で入力して下さい")
    end
    it "ユーザー本名フリガナ名字が空だと新規登録できない" do
      @user.last_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("苗字(かな)を入力してください", "苗字(かな)が空です 全角かなで入力して下さい")
    end
    it "ユーザー本名フリガナ名前が空だと新規登録できない" do
      @user.first_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("名前(かな)を入力してください", "名前(かな)が空です 全角かなで入力して下さい")
    end
    it "生年月日が空だと新規登録できない" do
      @user.birthday = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("誕生日を入力してください")
    end
  end
end