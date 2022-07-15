class ApprovedMailer < ApplicationMailer
  default from: 'ethpros@trader.com'

  def approved_mail
    @user = params[:user]
    @url  = user_session_url
    mail(to: @user.email, subject: 'Your account has been approved!')
  end
end
