class MasterMind
  def initialize
    puts 'Is the player a breaker(1) or a coder(2)? (input 1 or 2)'
    choice=2 # choice=gets
    if choice==1 
      self.human
    else 
      self.computer
    end
  end


  def compare(attempt)
    result=["-","-","-","-"]
    codeTemp=[]
    @code.each{|elem| codeTemp << elem.dup}
    
    # codeIndex=0     
    # attempt.each { |try|  #full loop to check right postions          
    #   if try==codeTemp[codeIndex]
    #     result[codeIndex]="X"
    #     codeTemp[codeIndex]="0" 
    #   elsif codeTemp.include?(try)
    #     result[codeIndex]='O'
    #     codeTemp[codeTemp.index(try)]="0"        
    #   else 
    #     result[codeIndex]="-"
    #   end
    #   codeIndex+=1 
    # }
    codeIndex=0     
    attempt.each { |try|  #full loop to check right postions          
      if try==codeTemp[codeIndex]
        result[codeIndex]="X"
        codeTemp[codeIndex]="0"
      end 
      codeIndex+=1
    }
    codeIndex=0 
    attempt.each { |try| #2nd loop to check O's and misses
      if codeTemp.include?(try)
        result[codeIndex]='O'
        codeTemp[codeTemp.index(try)]="0"        
      #else 
      #  result[codeIndex]="-"
      end
      codeIndex+=1
    } 
    return result
  end

  def computerGuess(lastAttempt,result)
    newAttempt=[] 
    found=[]
   


    for index in (0..3) #check and fill sure result, store wrong location
      if result[index]=="X"
        newAttempt[index]=lastAttempt[index]
      elsif result[index]=="O"
        found.push([lastAttempt[index],index]) #store wrong location hits with wrong index
        newAttempt[index]="-"
        #newAttempt[index]=rand(1..6).to_s
      else
        newAttempt[index]="-"
      end
    end
    found.each {|item| #try to guess "old location items"
      for index in (0..3)
        if newAttempt[index]=="-" && index!=item[1] && !(@oldAttempts.include?(item))
          newAttempt[index]=item[0]
        end
      end
    }
     
    for index in (0..3) #choose random elems for remaining spots
      if newAttempt[index]=="-"
        loop do
          x=rand(1..6).to_s
          if !(@oldAttempts.include?([x,index]))
            newAttempt[index]= x
            break
          end
        end
      end
    end 
    return newAttempt     
  end

  def computer
    puts "Type your code (4 numbers 1..6 do, separate with space): "
    @code=gets.split(" ") 
    @oldAttempts=[]
    lastAttempt=["0","0","0","0"] 
    result=["-","-","-","-"]      
    12.times do
      attempt=[]      
      puts "Computer chooses: "
      attempt=computerGuess(lastAttempt,result)
      p attempt 
      
      if attempt==@code
        puts "The computer has broken the code. It has already begun..."
        break  
      else    
        puts "You respond with:"
        puts result=self.compare(attempt)
        lastAttempt=attempt 
        i=0
        result.each { |item| #populate old misses list
          if item=="-"
            @oldAttempts.push([lastAttempt[i],i])
          end
          i+=1
        } 
        puts "Press enter to continue..."     
        gets
      end
    end
  end

  def human
    @code=[rand(1..6).to_s, rand(1..6).to_s,rand(1...6).to_s ,rand(1..6).to_s]
    puts 'Secret code is created!'

    12.times do
      attempt=[]
      puts "It's your turn. Type your break attempt (4 numbers 1..6 do, separate with space): "
      attempt=gets.split(" ") 
      
      if attempt==@code
        puts "Human has broken the code. Machines suck!"
        break  
      else    
        puts "The computer respods with"
        puts result=self.compare(attempt)
      end
    end
    puts "The human could not break the code. It has already begun..."
  end
end
 
  

game=MasterMind.new

