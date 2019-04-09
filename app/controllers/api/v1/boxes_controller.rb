class Api::V1::BoxesController < ApplicationController
  before_action :find_box, only: [:update]

  def index
    @boxes = Box.all
    render json: @boxes
  end

  def create
    @box = Box.create(box_params)
    if @box.valid?
      render json: @box, status: :accepted
    else
      render json: { errors: @box.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def update
    if @box.update(box_params)
      render json: @box, status: :accepted
    else
      render json: { errors: @box.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def destroy
    @box.destroy
  end

  private

  def box_params
    params.permit(:label, :length, :width, :height)
  end

  def find_box
    @box = Box.find(params[:id])
  end
end
