require 'sinatra'
require 'sinatra/reloader' if development?
require "open-uri"
require "json"
require "date"

set :public_folder, 'assets'

class Time
  def day_ordinal_suffix
    if day == 11 or day == 12
      return "th"
    else
      case day % 10
      when 1 then return "st"
      when 2 then return "nd"
      when 3 then return "rd"
      else return "th"
      end
    end
  end
end


get '/' do
	url = 'https://opentechcalendar.co.uk/index.php/group/14/json'
	json_response = open(url).read
	result = JSON.parse(json_response)
	event = result['data'][0]
	next_event =  event['summary'] + ' ' + event['description']
	next_event_name =  event['summary']
	next_date_timestamp = Time.at(event['start']['timestamp']).to_datetime 
	"#{next_date_timestamp.strftime("%A %d %B at %H:%M")} #{next_date_timestamp.day_ordinal_suffix} #{next_date_timestamp.year}"
end