class ParcelsController < ApiController
  before_action :common_setup, only: %i[show update destroy]
  before_action :authorized
  load_and_authorize_resource


  # GET /parcels
  def index
    @parcels = Parcel.all
    render json: @parcels
  end

  # GET /parcels/1
  def show
    render json: @parcel
  end

  # POST /parcels
  def create
    @parcel = Parcel.new(parcel_params)
    @parcel.user_id = @user.id
    user = @parcel.user 
    new_parcel = @parcel 
    if @parcel.save
      NotifierMailer.parcel_added(user, new_parcel).deliver_now 
      render json: @parcel, status: :created
    else
      render json: @parcel.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /parcels/1
  def update
   @parcel = Parcel.find_by(id: params[:id])
    if @parcel
    @parcel.update(parcel_params)
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

  def common_setup
    @parcel = Parcel.find(params[:id])
  end

  # Use callbacks to share common setup or constraints between actions.
  # Only allow a list of trusted parameters through.
  def parcel_params
    params.permit(:recipient_name, :recipient_contact, :weight, :total_cost, :from, :destination, :order_status,
                  :distance, :user_id)
  end
end
