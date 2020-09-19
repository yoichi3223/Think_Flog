class MessageMailer < ApplicationMailer
  default to: 'yoichi3223@gmail.com' # 送信先アドレス

  def received_email(message)
    @message = message
    mail(subject: 'ThinkFrogの利用を検討しているお客様からメールが届きました。') do |format|
      format.text
    end
  end
end
