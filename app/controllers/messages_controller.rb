class MessagesController < ApplicationController
  def new
    @message = MessageItemMessageAddress.new
  end

  def create
    @item = Item.find_by(id: params[:item_id])
    @messages = ItemMessage.includes(:message).where(item_id: @item.id)
    unless current_user.id == @item.user_id
      redirect_to root_path
    @message = MessageItemMessageAddress.new(message_params)
    if @message.valid?
       @message.save
      ActionCable.server.broadcast 'message_channel', content: Message.all 
    else
      flash.now
      render :show
    end
  end
  end

  private

  def message_params
    params.require(:message_item_message_address).permit(:text).merge(item_id: @item.id)
  end
end
