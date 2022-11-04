class NotifierMailer < ApplicationMailer
  default from: 'no-reply@example.com',
          return_path: 'admin@example.com'

  def parcel_added(user, parcel)
    @user = user
    @parcel = parcel
    mail(to: @user.email_address,
         subject: "#{@user.first_name}, yay! you've been added to a song!")
  end
end
