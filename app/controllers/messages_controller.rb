class MessagesController < ApplicationController
  
  def new
    @message = MessageItemMessageAddress.new
  end

  def create
    @item = Item.find_by(id: params[:item_id])
    @message = MessageItemMessageAddress.new(message_params)
    if @message.save
       ActionCable.server.broadcast 'message_channel', content: @message
       redirect_to @item
    else
      flash.now
      render :show
    end
  end

  private

  def message_params
    params.require(:message_item_message_address).permit(:text).merge(item_id: @item.id)
  end
end

