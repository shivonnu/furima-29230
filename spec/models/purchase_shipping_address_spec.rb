require 'rails_helper'

RSpec.describe PurchaseShippingAddress, type: :model do
  describe 'カード決済' do
    before do
      @purchase_shipping_address = FactoryBot.build(:purchase_shipping_address)
      payjp_chage = double("Payjp::Charge")
      allow(Payjp::Charge).to receive(:create).and_return(payjp_chage)  
    end
    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@purchase_shipping_address).to be_valid
    end
    it 'postal_codeが空だと保存できないこと' do
      @purchase_shipping_address.postal_code = ""
      @purchase_shipping_address.valid?
      expect(@purchase_shipping_address.errors.full_messages).to include("Postal code can't be blank", "Postal code is invalid. Include hyphen(-).")
    end
    it 'postal_codeにハイフン(-)が無いと保存できないこと' do
      @purchase_shipping_address.postal_code = "1234567"
      @purchase_shipping_address.valid?
      expect(@purchase_shipping_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-).")
    end
    it 'shipping_area_idが空だと保存できないこと' do
      @purchase_shipping_address.shipping_area_id = ""
      @purchase_shipping_address.valid?
      expect(@purchase_shipping_address.errors.full_messages).to include("Shipping area can't be blank")
    end
    it 'cityが空だと保存できないこと' do
      @purchase_shipping_address.city = ""
      @purchase_shipping_address.valid?
      expect(@purchase_shipping_address.errors.full_messages).to include("City can't be blank")
    end
    it 'building_nameは空でも保存できること' do
      @purchase_shipping_address.building_name = ""
      expect(@purchase_shipping_address).to be_valid
    end
    it 'phone_numberが空だと保存できないこと' do
      @purchase_shipping_address.phone_number = ""
      @purchase_shipping_address.valid?
      expect(@purchase_shipping_address.errors.full_messages).to include("Phone number can't be blank", "Phone number can't be blank", "Phone number is invalid. Within 11 digits. Do not put hyphens.")
    end
    it 'phone_numberが12桁だと保存できないこと' do
      @purchase_shipping_address.phone_number = "111111111111"
      @purchase_shipping_address.valid?
      expect(@purchase_shipping_address.errors.full_messages).to include("Phone number is invalid. Within 11 digits. Do not put hyphens.")
    end
    it 'tokenが空だと保存できないこと' do
      @purchase_shipping_address.token = ""
      @purchase_shipping_address.valid?
      expect(@purchase_shipping_address.errors.full_messages).to include()
    end
  end
end