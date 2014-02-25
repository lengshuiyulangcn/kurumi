# encoding:utf-8
require "cseg/version"
require "tempfile"
class Kurumi
	# since crf++ can only read from file
	@modle=File.expand_path("../../data/pkumodle.data", __FILE__)
	def self.segment(str)
		tmpstr=""
		for i in 0..str.length-1
			tmpstr+=str[i]+"\n"
		end
	@tmp=Tempfile::new("tmp")
	@resultfile=Tempfile::new("result")
	@tmp.write(tmpstr)
	@tmp.rewind
	@result=Array.new
	system("crf_test -m #{@modle} #{@tmp.path}>#{@resultfile.path}")
	@resultfile.rewind
		word=""
		@resultfile.read.each_line{|line|
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
		
		@resultfile.close(true)
		@tmp.close(true)
		return @result
	end
end

# result=Cseg.segment("屌丝是一种生活态度")
# print result
