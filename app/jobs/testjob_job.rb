class TestjobJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    puts"let's go" 
     raise "jobs invalid"

  end
end
