class ParcelsController < ApplicationController
  before_action :set_parcel, only: %i[show update destroy]

  # GET /parcels
  def index
    render json: Parcel.all
  end

  # GET /parcels/1
  def show
    render json: @parcel
  end

  # POST /parcels
  def create
    parcel = Parcel.create!(parcel_params)
    render json: parcel
  end

  # PATCH/PUT /parcels/1
  def update
    dog = Parcel.find(params[:id])
    dog.update_attributes(parcel_params)
    render json: dog
  end

  # DELETE /parcels/1
  def destroy
    Parcel.destroy(params[:id])
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  # Only allow a list of trusted parameters through.
  def parcel_params
    params.permit(:recipient_name, :recipient_contact, :weight, :from, :destination, :order_status,
                  :distance, :user_id)
  end
end
