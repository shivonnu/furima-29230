class MessageItemMessageAddress
  
  include ActiveModel::Model

  attr_accessor :text, :item_id, :message_id, :content, :message_channel

  def save
    message = Message.create(text: text)
    ItemMessage.create(item_id: item_id, message_id: message.id)
  end
end
