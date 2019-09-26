# frozen_string_literal: true

# Model job object.
class Job
  # Getter methods to make values public
  attr_reader :index
  attr_reader :title
  attr_reader :department
  attr_reader :deadline
  attr_reader :salary
  attr_reader :line

  def initialize(title, department, deadline, salary, index)
    @index = 'Job ' + index.to_s.strip + "\n"
    @title = 'Job Title: ' + title.strip + "\n"
    @department = 'Department: ' + department.strip + "\n"
    @deadline = 'Application Deadline: ' + deadline.strip + "\n"
    @salary = 'Salary: ' + salary.strip + "\n"
    @line = "--------------------------------------------------------------------\n"
  end

  def display
    puts index
    puts title
    puts department
    puts deadline
    puts salary
    puts line
  end
end
