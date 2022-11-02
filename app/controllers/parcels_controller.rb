class ParcelsController < ApplicationController
  # GET /parcels
  def index
    parcels = Parcel.all
    render json: parcels
  end

  # GET /parcels/1
  def show
    parcel = Parcel.find(params[:id])
    render json: parcel
  end

  # POST /parcels
  def create
    parcel = Parcel.new(parcel_params)

    if parcel.save
      render json: parcel, status: :created
    else
      render json: parcel.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /parcels/1
  def update
    if parcel.update(parcel_params)
      render json: parcel 
    else  
      render json: parcel.errors, status: :unprocessable_entity
    end
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
