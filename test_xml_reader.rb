require_relative 'xml_reader'
require_relative 'message'

require "test/unit"
require 'pry'

class TestXmlReader < Test::Unit::TestCase


	def test_read_in_xml_file
		message_stock = XmlReader.new.read_in_xml_file('10.xml')

		binding.pry
		assert_equal("0", message_stock[0].local_type)
	end
end
