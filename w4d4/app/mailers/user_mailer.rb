class UserMailer < ApplicationMailer
    default from: 'cat@cats.com'

  def welcome_email(user)
    @user = user
    mail(to: user.email, subject: 'Hi, rent me pls :3')
  end
end
