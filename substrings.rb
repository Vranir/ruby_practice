def substrings(word, dictionary)
    result={} 
    words=word.split
    words.each do |word|   
        dictionary.each do |item|
            count=0               
            count+=1 if word.downcase.include?(item.downcase)
            if count>0
                result[item]==nil ? result[item]=count : result[item]=result[item]+count
            end
        end   
    end         
    return result
end


dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

puts substrings("below", dictionary)
puts substrings("Howdy partner, sit down! How's it going?", dictionary)
