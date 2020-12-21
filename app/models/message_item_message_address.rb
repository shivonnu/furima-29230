class MessageItemMessageAddress
  
  include ActiveModel::Model

  attr_accessor :text, :item_id, :message_id
 
  with_options presence: true do
    validates :text
  end

  def save
    message = Message.create(text: text)
    ActionCable.server.broadcast 'message_channel', content: Message.text
    ItemMessage.create(item_id: item_id, message_id: message.id)
  end
end
