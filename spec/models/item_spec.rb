require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end
    describe '商品出品機能' do
      it "商品名が空では登録出来ないこと" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "カテゴリーの情報が必須であること" do
        @item.category = "0"
        @item.valid?
        expect(@item.errors.full_messages).to include("Category is not included in the list")
      end
      it "商品の状態についての情報が必須であること" do
        @item.status = "0"
        @item.valid?
        expect(@item.errors.full_messages).to include("Status is not included in the list")
      end
      it "配送料の負担についての情報が必須であること" do
        @item.shipping_fee_burden = "0"
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee burden is not included in the list")
      end
      it "発送元の地域についての情報が必須であること" do
        @item.shipping_area = "0"
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping area is not included in the list")
      end
      it "発送までの日数についての情報が必須であること" do
        @item.days_to_ship = "0"
        @item.valid?
        expect(@item.errors.full_messages).to include("Days to ship is not included in the list")
      end
      it "価格についての情報が必須であること" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank", "Price is invalid. Input half-width characters.", "Price is out of setting range")
      end
      it "価格が、¥299では出品出来ないこと" do
        @item.price = "299"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end
      it "価格が、¥10,000,000では出品出来ないこと" do
        @item.price = "10000000"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end
      it "販売価格は半角数字のみ入力可能であること" do
        @item.price = "１００００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end
    end
  end
end


#ログインしているユーザーだけが、出品ページへ遷移できること
