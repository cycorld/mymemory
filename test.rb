def string_match(names, char)
  #여러분이 쓸 부분은 이 부분입니다. 
  toggle=0
  0.upto(4) do |x|
    if(names[x].chars.first==char) 
      print names[x]
      print " "
#       print " char : #{char}"
      puts names[x].count char
      toggle+=1
    end
  end
  if(toggle==0)
    puts "no matches"
  end
end

string_match(["ant","elephant","aardvark","dog","antelope"],"a")
puts "+++++"
string_match(["ant","elephant","aardvark","dog","antelope"],"t")

