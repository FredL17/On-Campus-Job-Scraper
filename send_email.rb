require 'mail'

class SendEmail
  options = { :address              => "smtp.gmail.com",
              :port                 => 587,
              :domain               => 'gmail.com',
              :user_name            => 'codefellas123@gmail.com',
              :password             => 'fellas123',
              :authentication       => 'plain',
              :enable_starttls_auto => true  }

  Mail.defaults do
    delivery_method :smtp, options
  end

  Mail.deliver do
    to 'danashkokani@gmail.com'
    from 'codefellas123@gmail.com'
    subject 'Job Search Results'
    body "Attached is a text file with the search results."
    add_file  File.expand_path("results.txt")
  end
end
