# proj3-code
### Web Scraping
Before running the Web Scraping project, please install all of the needed Gems by typing 'bundle install' in the command line. If there is no bundler on your machine, please type 'gem install bundler' to get bundler gem and then install all gems by 'bundle install'.

### Developers:
* Bowen Li
* Feifan Lin
* Dana Shkokani
* Mengying Xie
  

### Prerequistes:
* Ruby version >= 2.2.1

### Installation guide:
* Download the codebase into local machine.
* Start web scraping with command: ruby scraper.rb

### Gems Dependencies
* httparty 0.17.1
* mail 2.7.1
* nokogiri 1.10.4


### What does it do / how to use it:
Enter the keyword of job you want to search and you can find the results in a formatted test file named "results.txt". Then the program prompts you for a receiver email address and a sender email address and password. Note: for easy use, we have created a sender gmail and password and provided the credentials in office hours. If you would prefer to use a different email, please note that this program can only send from a gmail account. To send from a different gmail, please ensure to enable Gmail Less Secure Apps Settings. That can be done by logging into your gmail and then turning on the toggle switch in this link: https://myaccount.google.com/lesssecureapps 

After inputting the gmail and password, the receiver will receive an email with a text file named 'results.txt', which includes all jobs and details you want to get.
    
