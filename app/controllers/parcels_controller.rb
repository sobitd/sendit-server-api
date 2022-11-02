class ParcelsController < ApplicationController
  before_action :common_setup, only: %i[show update destroy]
  before_action :authorized
  # GET /parcels
  def index
    @parcels = Parcel.where(user_id: @user.id)
    render json: @parcels
  end

  # GET /parcels/1
  def show
    # parcel = Parcel.find(params[:id])
    render json: @parcel
  end

  # POST /parcels
  def create
    @parcel = Parcel.new(parcel_params)
    @parcel.user_id = @user.id

    if @parcel.save
      render json: @parcel, status: :created, location: @parcel
    else
      render json: @parcel.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /parcels/1
  def update
    if @parcel.update(parcel_params)
      render json: @parcel
    else
      render json: @parcel.errors, status: :unprocessable_entity
    end
  end

  # DELETE /parcels/1
  def destroy
    @parcel.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions
  def common_setup
    @parcel = Parcel.find(params[:id])
  end

  # Use callbacks to share common setup or constraints between actions.
  # Only allow a list of trusted parameters through.
  def parcel_params
    params.require(:parcel).permit(:recipient_name, :recipient_contact, :weight, :from, :destination, :order_status,
                                   :distance, :user_id)
  end
end
