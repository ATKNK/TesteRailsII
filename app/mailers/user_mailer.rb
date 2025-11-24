class UserMailer < ApplicationMailer
  default from: 'no-reply@codequiz.local'

  def welcome_email(user)
    @user = user
    @url = 'https://localhost:3000/login'
      mail(to: @user.email, subject: "Bem vindo ao CodeQuiz!")
  end
end
