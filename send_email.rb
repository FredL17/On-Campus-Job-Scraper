require 'mail'

class SendEmail

  def self.send(file_name)
    puts "Please enter the email that you want the results sent to: "
    to_email = gets.chomp.strip
    #This email and password have been given in office hours
    puts "\nPlease enter the email that you want to send the email from: "
    from_email = gets.chomp.strip
    puts "\nPlease enter the password associated with that email: "
    pass = gets.chomp.strip
    options = { :address              => "smtp.gmail.com",
                :port                 => 587,
                :domain               => 'gmail.com',
                :user_name            => "#{from_email}",
                :password             => "#{pass}",
                :authentication       => 'plain',
                :enable_starttls_auto => true  }

    Mail.defaults do
      delivery_method :smtp, options
    end

    Mail.deliver do
      to "#{to_email}"
      from "#{from_email}"
      subject 'Job Search Results'
      body "Attached is a text file with the search results."
      add_file  File.expand_path(file_name)
    end
  puts "Email has been sent to #{to_email} with the file results.txt attached"
  end
end
