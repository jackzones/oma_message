require_relative 'xml_reader'

reader = XmlReader.new 

ARGV.each do |xml_file_name|
	# STDERR.puts "Procissing #{xml_file_name}"
	reader.read_in_xml_file(xml_file_name)
end

reader.mess_filter
# reader.pkg_out




