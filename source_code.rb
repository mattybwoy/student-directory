puts __FILE__
File.open(__FILE__, "r") do |file|
   file.readlines.each do |line|
    puts line
  end 
end

#write program read source code of file