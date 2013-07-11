#!/usr/bin/env ruby
require 'rubygems'
require 'open-uri'
require 'json'
require 'net/http'

URL = 'https://data.mtgox.com/api/2/BTCUSD/money/ticker'

def fetch_json
	JSON.parse(open(URL).read)
end

def parse_json json_data
	high  = json_data['data']['high']['display_short']
	low = json_data['data']['low']['display_short']
	avg = json_data['data']['avg']['display_short']

	return high, low, avg
end

high, low, avg = parse_json fetch_json

puts "high: #{high}\nlow: #{low}\navg: #{avg}"