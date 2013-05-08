#/usr/bin/env ruby

# input = ARGV[0]
# output = ARGV[1]

input = "esql.log"
output = "esql.txt"

puts "RUN : ruby esql.rb esql.log esql.txt"

# exec "grep -e http: -R /cygdrive/d/workspace/ESB | grep Req_Mapping | grep bd.ws | grep tns1 > esql.log"

def read_write_file(inFile, outFile)
    input = File.open(inFile, "r")
    output = File.open(outFile, "w")
    
    input.each_line do | line |
        
        puts line

        ifIndex = line.index("Req")
        ifName = line[ifIndex-9, 8].upcase

        bsIndex = line.index('http')
        bsName = line[bsIndex + 13, 9].upcase

        outline = ifName + "," + bsName
        puts outline
        output.puts outline
    
    end
 end

 read_write_file(input ,output)

 puts "END SAVE FILE : " +  output
