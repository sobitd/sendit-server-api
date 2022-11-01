class ParcelsController < ApplicationController
  

  # GET /parcels
  def index
    render json: Parcel.all
  end

  # GET /parcels/1
  def show
    parcel = Parcel.find(params[:id])
    render json: parcel
  end

  # POST /parcels
  def create
    parcel = Parcel.create!(parcel_params)
    render json: parcel
  end

  # PATCH/PUT /parcels/1
  def update
    parcel = Parcel.find(params[:id])
    parcel.update_attributes(parcel_params)
    render json: parcel
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
