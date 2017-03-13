require 'nokogiri'
require_relative 'message'
# require 'pry'

class XmlReader
	def initialize
		@message_in_stock = []
	end

	def read_in_xml_file(xml_file_name)
		# xml = File.read(xml_file_name)
		# doc = Nokogiri::XML(xml)

		@doc = File.open(xml_file_name) { |f| Nokogiri::XML(f) }

		@doc.xpath('//traceMsg').each do |file|
			local_type             = file.xpath("./localIpType").text
			local_addr             = file.xpath( "./localIpAddr" ).text
			local_port              = file.xpath( "./localIpPort" ).text
			remote_type           = file.xpath( "./remoteIpType" ).text
			remote_addr          = file.xpath( "./remoteIpAddr" ).text
			remote_port           = file.xpath( "./remoteIpPort" ).text
			handle                    = file.xpath( "./userTraceHandle/int" ).text
			msgtype                  = file.xpath( "./msgType").text
			direction                = file.xpath( "./direction").text
			msgname               = file.xpath( "./msgName").text
			msglen                   = file.xpath( "./msgLen").text
			msgvalue               = file.xpath( "./msgValue").text

			@message_in_stock << Message.new(local_type, local_addr, local_port, remote_type, remote_addr, remote_port, handle, 
				msgtype, direction, msgname, msglen, msgvalue)
		end
	end

	def pkg_out
		@message_in_stock.each do |message|
			# binding.pry
			if message.msgname == "200"
				puts "HTTP/1.1 #{message.msgname} OK"
				puts "Server:"
				puts "#{message.msgvalue}"
			else
				puts "#{message.msgname} HTTP/1.1"
				puts "#{message.msgvalue}"
			end
			puts ''
		end
	end

	def mess_filter
		@message_in_stock.each do |message|
				puts "From: #{message.remote_type}, #{message.remote_ip}, #{message.remote_port} "
				puts "To: #{message.local_type}, #{message.local_ip}, #{message.local_port}"
				puts "msgType: #{message.msgtype}, direction: #{message.direction_vert}"
				puts "Handle: #{message.trace_handle}, Name: #{message.msgname}"
				puts "#{message.msgvalue}"
				puts ""
		end
		
	end

end

