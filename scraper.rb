# frozen_string_literal: true

require 'nokogiri'
require 'httparty'
require_relative 'job'
require_relative 'send_email'

puts 'This program will search for jobs at OSU.'
print 'Please enter a keyword to search for: '
# Convert input to lowercase and remove all the leading and trailing spaces.
keyword = gets.chomp.downcase.strip
puts "You are searching for jobs related to #{keyword}." unless keyword.empty?
keyword.gsub!(' ', '+')
first_url = "https://www.jobsatosu.com/postings/search?utf8=%E2%9C%93&query=#{keyword}&query_v0_posted_at_date=&577=&578=&579=&commit=Search"
unparsed_page = HTTParty.get(first_url)
parsed_page = Nokogiri::HTML(unparsed_page)
total_tag = parsed_page.css('span.smaller')[0].text
# Get the total number of jobs related to this keyword.
job_count = total_tag[1, total_tag.length - 2].to_i
puts "Total number of jobs related to this keyword: #{job_count}."
puts ''
current_page = 1
# Count the number of pages.
last_page = (job_count / 30) + 1
job_array = []
index = 1
while current_page <= last_page
  page_url = "https://www.jobsatosu.com/postings/search?utf8=%E2%9C%93&query=#{keyword}&page=#{current_page}&query_v0_posted_at_date=&577=&578=&579=&commit=Search"
  unparsed_current_page = HTTParty.get(page_url)
  parsed_current_page = Nokogiri::HTML(unparsed_current_page)
  # Get the job items in the current page.
  job_list = parsed_current_page.css('div.job-item')
  job_list.each do |job|
    # Get the info list for each job item.
    info_list = job.css('div.col-md-8').css('div.job-title')
    title = info_list[0].text
    department = info_list[1].text
    deadline = info_list[2].text
    salary = info_list[4].text
    # Create the job object for each job item.
    job_object = Job.new(title, department, deadline, salary, index)
    # Add each job object to the job array.
    job_array.push job_object
    index += 1
  end
  current_page += 1
end

# Print out the searching results.
puts '--------------------------Searching Results--------------------------'
job_array.each(&:display)

# Write the job info to the result.txt file.
f = File.new('results.txt', 'w')
f.write("--------------------------Searching Results--------------------------\n")
job_array.each do |item|
  f.write(item.index)
  f.write(item.title)
  f.write(item.department)
  f.write(item.deadline)
  f.write(item.salary)
  f.write(item.line)
end
f.close
SendEmail.send(f)
