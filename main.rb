#!/usr/bin/env ruby
# A simple program that looks for my phone on my home network every 15 seconds and writes the output to a csv with time and date.
#
# 

require 'nmap/parser'
require 'csv'


#replace this with the MAC vendor name of your device
devicename = "Motorola Mobile Devices"


loop do


			i=0

			puts "Starting a new scan"
			puts Time.now
			p = Nmap::Parser.parsescan("nmap", "-sP 192.168.1.1/24")
			puts


			p.hosts("up") do |host|


				puts "#{host.mac_vendor} - #{host.addr}, #{host.mac_addr} "
				if host.mac_vendor == devicename
				i = 1
				puts
					end
						
			end
		
			if i == 1
				puts "home" 
				c1 = "home"
				c2 = Time.now
				
					CSV.open('db.csv', 'a') do |writer|		
									writer << [ c1, c2]
					 end
				 puts 
							else			
				puts "out"
				c1 = "out"
				c2 = Time.now
								
				CSV.open('db.csv', 'a') do |writer|		
					writer << [c1, c2]
			     end
				
				end
	
	    sleep 15
  end
  
	
