# encoding:utf-8
require "cseg/version"
require "tempfile"
class Kurumi
	# since crf++ can only read from file
	#@tmpfile.read{|file| file=nil}
	@modle=File.expand_path("../../data/pkumodle.data", __FILE__)
	@result=Array.new
	def self.segment(str)
		tmpstr=""
		for i in 0..str.length-1
			tmpstr+=str[i]+"\n"
		end
		#@tmpfile=nil
	@tmp=Tempfile::new("tmp")
	@resultfile=Tempfile::new("result")
		@tmp.write(tmpstr)
		@tmp.rewind
		#@tmpfile.close
		system("crf_test -m #{@modle} #{@tmp.path}>#{@resultfile.path}")
		@resultfile.rewind
	#	puts @resultfile.read
	#	puts @tmp.read
		
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
				end
			end
			# @result.push(line.chomp.split("	")[0])

		}
		
		@resultfile.close(true)
		@tmp.close(true)
		return @result
		# puts $?
	end
end

# result=Cseg.segment("ˆ¢çŒ?z??èÜC¥ˆêŠ¼œk??“I??èÜ")
# print result
