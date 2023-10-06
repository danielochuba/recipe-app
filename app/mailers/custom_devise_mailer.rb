class CustomDeviseMailer < Devise::Mailer
  default from: 'test@example.com' # Set a default 'from' address

  def confirmation_instructions(record, token, opts = {})
    # Override the confirmation_instructions method to prevent sending emails
    opts[:subject] = 'Confirmation instructions' # Set the email subject if needed
    devise_mail(record, :confirmation_instructions, opts)
  end
end
