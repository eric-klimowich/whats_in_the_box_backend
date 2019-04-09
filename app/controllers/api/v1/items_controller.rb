class Api::V1::ItemsController < ApplicationController
  before_action :find_item, only: [:update]

  def index
    @items = Item.all
    render json: @items
  end

  def create
    @item = Item.create(item_params)
    if @item.valid?
      render json: @item, status: :accepted
    else
      render json: { errors: @item.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def update
    if @item.update(item_params)
      render json: @item, status: :accepted
    else
      render json: { errors: @item.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def destroy
    @item.destroy
  end

  private

  def item_params
    params.permit(:description, :quantity, :box_id)
  end

  def find_item
    @item = Item.find(params[:id])
  end
end
