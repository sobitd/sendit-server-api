class UsersController < ApiController
  before_action :authorized, only: [:profile]

  # REGISTER
  def create
    @user = User.create(user_params)
    if @user.valid?
      token = encode_token({ user_id: @user.id })
      render json: { user: @user, token: token }
    else
      render json: { error: 'Invalid username or password' }
    end
  end

  # LOGGING IN
  def login
    @user = User.find_by(email_address: params[:email_address])

    if @user && @user.authenticate(params[:password])
      token = encode_token({ user_id: @user.id })
      render json: { user: @user, token: token }
    else
      render json: { error: 'Invalid username or password' }
    end
  end

  def profile
    render json: @user
  end

  private

  def user_params
    params.permit(:first_name, :last_name, :phone_number, :username, :password, :password_confirmation, :email_address)
  end
end
