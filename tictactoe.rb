# tictactoe game in shell
class TicTacToe
  def initialize(player1, player2)
    @player1 = [player1, "X"]
    @player2 = [player2, "O"]
    @moves = [[' ', ' ', ' '], [' ', ' ', ' '], [' ', ' ', ' ']]
    @victory = false
    self.runGame
    end

  def updateGrid
    @grid = "| #{@moves[0][0]} | #{@moves[0][1]} | #{@moves[0][2]} |" + 
            "\n- - - - - - -\n" +
            "| #{@moves[1][0]} | #{@moves[1][1]} | #{@moves[1][2]} |" +
            "\n- - - - - - -\n" +
            "| #{@moves[2][0]} | #{@moves[2][1]} | #{@moves[2][2]} |" # string containing the curretnly played postions
  end

  def drawGrid
    puts @grid
  end

  def play(player)
    puts "It's #{player[0]}'s turn. Enter row, press return, then column, return."
    loop do
      movex, movey = gets, gets 
      if @moves[movex.to_i-1][movey.to_i-1]==" " 
        @moves[movex.to_i-1][movey.to_i-1] = player[1]
        break
      else
        puts "That space is taken! Choose a different space!"
      end
    end
    self.updateGrid
    self.drawGrid
    @victory=self.checkVictory(player[1])
  end

  def checkVictory(token)
    @moves.each { |row| # check rows
      if row.all?(token)
        return token
      end
        }
    @moves.transpose.each { |column| # check columns
      if column.all?(token)
        return token
      end
      }
    return token if [@moves[0][0],@moves[1][1],@moves[2][2]].all?(token) #check diagonal
    return token if [@moves[0][2],@moves[1][1],@moves[2][0]].all?(token) #check diagonal
    return false # no victory
  end


  def runGame
    puts "Let the games beign!"
    puts "\nIt's #{@player1[0]} as #{@player1[1]}'s versus #{@player2[0]} as #{@player2[1]}'s"
    self.updateGrid    
    loop do
      self.drawGrid
      play(@player1) if @victory == false
      play(@player2) if @victory == false
      if @victory != false
        puts("#{@victory}'s win!")
        puts("\nWould you like to play again")
        again = gets.chop
        if again.downcase == 'yes'
          self.initialize(@player1[0], @player2[0])
        end
        break
      end
      puts "\nNext turn:"
    end
  end
end

game = TicTacToe.new('Mark', 'Andrew')
