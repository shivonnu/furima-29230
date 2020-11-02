require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end
    describe '商品出品機能' do

      it "すべての情報が正しいフォーマットで入力されていれば出品登録できること" do
        expect(@item).to be_valid
      end
      it "商品名が空では登録出来ないこと" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("名前を入力してください")
      end
      it "カテゴリーの情報が必須であること" do
        @item.category_id = "0"
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーは一覧にありません")
      end
      it "商品の状態についての情報が必須であること" do
        @item.status_id = "0"
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態は一覧にありません")
      end
      it "配送料の負担についての情報が必須であること" do
        @item.shipping_fee_burden_id = "0"
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担は一覧にありません")
      end
      it "発送元の地域についての情報が必須であること" do
        @item.shipping_area_id = "0"
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域は一覧にありません")
      end
      it "発送までの日数についての情報が必須であること" do
        @item.days_to_ship_id = "0"
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数は一覧にありません")
      end
      it "価格についての情報が必須であること" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("値段を入力してください", "値段が空です 半角で入力してください", "値段が設定可能範囲を超えています")
      end
      it "価格が、¥299では出品出来ないこと" do
        @item.price = "299"
        @item.valid?
        expect(@item.errors.full_messages).to include("値段が設定可能範囲を超えています")
      end
      it "価格が、¥10,000,000では出品出来ないこと" do
        @item.price = "10000000"
        @item.valid?
        expect(@item.errors.full_messages).to include("値段が設定可能範囲を超えています")
      end
      it "販売価格は半角数字のみ入力可能であること" do
        @item.price = "１００００"
        @item.valid?
        expect(@item.errors.full_messages).to include("値段が設定可能範囲を超えています")
      end
    end
  end
end
