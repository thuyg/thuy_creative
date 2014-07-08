class ContactMailer < ActionMailer::Base
  
  attr_accessor :name, :email, :message_body
  
  default from: "gthuyduong@yahoo.com"
  
  headers = {'Return-Path' => 'gthuyduong@yahoo.com'}
  
  def send_email(user_info)
      @user_info = user_info

      mail(
        to: "gthuyduong@googlemail.com",
        subject: "Thuy Creative Contact Form",
        from: "My Yahoo account <gthuyduong@yahoo.com>",
        return_path: "gthuyduong@yahoo.com",
        date: Time.now,
        content_type: "text/html"
      )
  end
  
end
