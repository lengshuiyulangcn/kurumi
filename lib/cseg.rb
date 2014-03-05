# encoding:utf-8
require "cseg/version"
require "tempfile"
class Kurumi
	# since crf++ can only read from file
	@modle=File.expand_path("../../data/pkumodle.data", __FILE__)
	def self.segment(str)
	  @result=Array.new
	  result_data = IO.popen "crf_test -m #{@modle}", 'r+' do |io|
  		io.puts *str.chars
  		io.close_write
  		io.read
	  end
		word=""
		result_data.each_line{|line|
			token=line.chomp.split("	")
			if token[1]=="B"or token[1]=="O"
				if word!=""
					@result.push(word)
				end
				word=token[0]
			elsif token[1]=="I"
				word+=token[0]
			else
				#nil
				if word!=""
					@result.push(word)
					word=""
				end
			end

		}
		return @result
	end
end
# result=Kurumi.segment("屌丝是一种生活态度")
# print result
