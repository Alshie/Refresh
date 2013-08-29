require 'sinatra'
require 'sinatra/reloader' if development?
require "open-uri"
require "json"

set :public_folder, 'assets'


get '/' do
	url = 'https://opentechcalendar.co.uk/index.php/group/14/json'
	json_response = open(url).read
	result = JSON.parse(json_response)
	event = result['data'][0]
	next_event =  event['summary'] + ' ' + event['description']
	"new: #{next_event}"
end