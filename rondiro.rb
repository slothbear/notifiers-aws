require "date"
require "json"

def lambda_handler(event:, context:)
  puts "\n\n--------------------"

  start_time = DateTime.parse("Monday 7:00am EDT")
  if DateTime.now.wday == 0
    start_time -= 7
  end
  
  if [5, 6, 0].include?(DateTime.now.wday)
    start_time += 7
  end
  
  end_time = start_time + 6
  puts "start: #{start_time}  end: #{end_time}"
  
  start_epoch = start_time.strftime("%s")
  end_epoch = end_time.strftime("%s")
  puts "start: #{start_epoch}  end: #{end_epoch}"
  
  seventy_two_hours_from_now = DateTime.now + 3
  puts "I'm looking for laps starting before: #{seventy_two_hours_from_now}"
  
  puts "--------------------\n\n"
  { statusCode: 200, body: JSON.generate('rondiro has completed') }
end

