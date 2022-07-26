def caesar_chiper(string,shift)
    chiper=""
    string.split('').each {|char| 
        charAscii=char.ord
        if charAscii>=65 and charAscii<=90
            charAscii+=shift
            if charAscii>90
                charAscii-=26
            end
        end
        if charAscii>=97 and charAscii<=122
            charAscii+=shift
            if charAscii>122
                charAscii-=26
            end
        end
        chiper+=charAscii.chr            
    }
    return chiper
end

puts caesar_chiper("What a string!",5)