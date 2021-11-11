class ListsController < ApplicationController

  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def show
    @list = List.find(params[:id])
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list), notice: 'list was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @list = List.find(params[:id]).destroy
    redirect_to lists_path, notice: 'list deleted.'
  end


  private

  def list_params
    params.require(:list).permit(:name, :list_id)
  end
end
