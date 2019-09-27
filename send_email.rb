# frozen_string_literal: true

require 'mail'

class SendEmail
  def self.send(file_name)
    puts 'Please enter the email that you want the results sent to: '
    to_email = gets.chomp.strip
    # This email and password have been given in office hours
    puts "\n*Note: Next, you will be prompted to enter the gmail that you want to send the email from. An email and password have been provided during office hours. If you'd like to use your personal gmail to send this email instead, please make sure to enable Gmail Less Secure Apps Settings. More details on that are in the README file.\n"
    puts "\nPlease enter the gmail that you want to send the email from: "
    from_email = gets.chomp.strip
    puts "\nPlease enter the password associated with that email: "
    pass = gets.chomp.strip
    options = { address: 'smtp.gmail.com',
                port: 587,
                domain: 'gmail.com',
                user_name: from_email.to_s,
                password: pass.to_s,
                authentication: 'plain',
                enable_starttls_auto: true }

    Mail.defaults do
      delivery_method :smtp, options
    end

    Mail.deliver do
      to to_email.to_s
      from from_email.to_s
      subject 'Job Search Results'
      body 'Attached is a text file with the search results.'
      add_file File.expand_path(file_name)
    end
    puts "Email has been sent to #{to_email} with the file results.txt attached"
  end
end
