# encoding:utf-8
require "cseg/version"
class Kurumi
	# since crf++ can only read from file
	@modle_sp=File.expand_path("../../data/as_training.data", __FILE__)
	@modle_tr=File.expand_path("../../data/as_training_less.data", __FILE__)
	def self.segment(str, mode="sp")
	  @result=Array.new
	  	case mode
			when "sp"
			       @modle=@modle_sp
			when "tr"
		 		@modle=@modle_tr
			else
			raise "no such parameter, please use sp or tr"		
		end
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

print Kurumi.segment("屌丝是一种自我讽刺。")
