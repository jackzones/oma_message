require 'nokogiri'
	
		message_in_stock = []
		xml = File.read('output.xml')
		doc = Nokogiri::XML(xml)

		doc.xpath('//traceMsg').each do |file|
			local_type             = file.xpath("./localIpType").text
			local_addr             = file.xpath( "./localIpAddr" ).text
			local_port              = file.xpath( "./localIpPort" ).text
			remote_type           = file.xpath( "./remoteIpType" ).text
			remote_addr          = file.xpath( "./remoteIpAddr" ).text
			remote_port           = file.xpath( "./remoteIpPort" ).text
			handle                    = file.xpath( "./int" ).text
			msgtype                  = file.xpath( "./msgType").text
			direction                = file.xpath( "./direction").text
			msgname               = file.xpath( "./msgName").text
			msglen                   = file.xpath( "./msgLen").text
			msgvalue               = file.xpath( "./msgValue").text

			message_in_stock << [local_type, local_addr, local_port, remote_type, remote_addr, remote_port, handle, 
				msgtype, direction, msgname, msglen, msgvalue]
		end
	
	puts message_in_stock[2]