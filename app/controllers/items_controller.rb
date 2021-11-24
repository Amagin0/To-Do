class ItemsController < ApplicationController
  
  def create
    @list = List.find(params[:list_id])
    @item = Item.new(item_params)
    @item.list_id = @list.id
    @item.save
    redirect_back(fallback_location: root_url)
  end
  
  def destroy
    @list = List.find(params[:list_id])
    item = @list.items.find(params[:id])
    item.destroy
    redirect_back(fallback_location: root_url)
  end
  
  def item_params
    params.require(:item).permit(:name)
  end

end