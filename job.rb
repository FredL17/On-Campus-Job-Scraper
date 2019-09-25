# frozen_string_literal: true

# Model job object.
class Job
  # Getter methods to make values public
  attr_reader :title
  attr_reader :department
  attr_reader :deadline
  attr_reader :salary

  def initialize(title, department, deadline, salary)
    @title = title.strip
    @department = department.strip
    @deadline = deadline.strip
    @salary = salary.strip
  end

  def display(index)
    puts "Job #{index}"
    puts "Job Title: #{title}"
    puts "Department: #{department}"
    puts "Application Deadline: #{deadline}"
    puts "Salary: #{salary}"
    puts '--------------------------------------------------------------------'
  end
end
