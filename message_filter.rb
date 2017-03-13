require 'rexml/document'
require 'rexml/streamlistener'
# class Listener
# include StreamListener
include REXML

message = Array.new

for file in ARGV
	xmlfile = File.new(file)
	xmldoc = Document.new(xmlfile)
	from_type = XPath.first(xmldoc, "//localIpType").text
	from_addr = XPath.first( xmldoc, "//localIpAddr" ).text
	from_port = XPath.first( xmldoc, "//localIpPort" ).text
	to_type = XPath.first( xmldoc, "//remoteIpType" ).text
	to_addr = XPath.first( xmldoc, "//remoteIpAddr" ).text
	to_port = XPath.first( xmldoc, "//remoteIpPort" ).text
	handle = XPath.first( xmldoc, "//int" ).text
	msgtype = XPath.first( xmldoc, "//msgType").text
	direction = XPath.first( xmldoc, "//direction").text
	msgname = XPath.first( xmldoc, "//msgName").text
	msglen = XPath.first( xmldoc, "//msgLen").text
	msgvalue = XPath.first( xmldoc, "//msgValue").text
	size = msgvalue.size
	message = [from_type, from_addr, from_port, to_type, to_addr, to_port, 
		handle, msgtype, direction, msgname, msglen, msgvalue, size]

end

def mess_filter(message)
	puts "From: #{message[3]}, #{message[4]}, #{message[5]} To: #{message[0]}, #{message[1]}, #{message[2]}"
	puts "msgType: #{message[7]}, direction: #{direction(message)}"
	puts "Handle: #{message[6]}, Name: #{message[-4]}, Length: #{message[-3]}"
	puts "#{message[-2]}"
end
def direction(message)
	if message[8] == "0"
		"receive"
	else
		"send"
	end
end

def pkg_out(message)
	if message[-4] == "200"
		puts  "HTTP/1.1 #{message[-4]} OK"
		puts "Server:"
		puts message[-2]
	else
		puts message[-4] + " HTTP/1.1"
		puts message[-2]
	end
end

pkg_out(message)