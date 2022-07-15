class ApprovedMailer < ApplicationMailer
  default from: 'ethpros@trader.com'

  def approved_mail
    @user = params[:user]
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Your account has been approved!')
  end
end
