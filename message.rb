class Message

	attr_reader :local_type, :local_ip, :local_port, :remote_type, :remote_ip, :remote_port,
			:trace_handle, :msgtype, :direction, :msgname, :msglen, :msgvalue

	def initialize(local_type, local_ip, local_port, remote_type, remote_ip, remote_port, 
		trace_handle, msgtype, direction, msgname, msglen, msgvalue)
		@local_type = local_type
		@local_ip = local_ip
		@local_port = local_port
		@remote_type = remote_type
		@remote_ip = remote_ip
		@remote_port = remote_port
		@trace_handle = trace_handle
		@msgtype = msgtype
		@direction = direction
		@msgname = msgname
		@msglen = msglen
		@msgvalue = msgvalue
	end

	def direction_vert
		if self.direction == "0"
			"receive"
		else
			"send"
		end
	end

end
# https://gist.github.com/ablwr/aad01782214cec1632b65bc42559d4ca