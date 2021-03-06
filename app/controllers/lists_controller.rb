class ListsController < ApplicationController
  
  def new
    @list = List.new
  end
  
  def show
    @list = List.find(params[:id])
    @item = Item.new
  end

  def index
    @lists = List.all
    @list = List.new
  end
  
  def edit
    @list = List.find(params[:id])
  end

  def create
    @list = List.new(list_params)
    @list.save
    redirect_to list_path(@list)
  end
  
  def update
    @list = List.find(params[:id])
      if @list.update(list_params)
        redirect_to lists_path
      else
        render 'edit'
      end
  end
  
  def destroy
    list = List.find(params[:id])
    list.destroy
    redirect_to lists_path
  end
  
  private
  
  def list_params
    params.require(:list).permit(:name, :description)
  end
  
end
