
class TennisGame1

  def initialize(player1Name, player2Name)
    @player1Name = player1Name
    @player2Name = player2Name
    @p1points = 0
    @p2points = 0
    @result = ""
  end

  def calc_point(playerName)
    playerName == "player1" ? @p1points += 1 : @p2points += 1
  end

  def score
    deuce_check
    points_above_four_check
    partial_score_check
    final_score
  end

  def points_difference_check
    p1_advantage_condition
    p2_advantage_condition
    p1_winner_condition
    p2_winner_condition
  end

  def deuce_print_out
    @result = {
              0 => "Love-All", 1 => "Fifteen-All", 2 => "Thirty-All"
              }.fetch(@p1points, "Deuce")
  end


  def partial_score_print_out
    @result += {
               0 => "Love", 1 => "Fifteen", 2 => "Thirty", 3 => "Forty"
               }[@temp_score]
  end

  private

  def final_score
    @result
  end

  def deuce_condition
    @p1points == @p2points
  end

  def players_points_above_four
    @p1points >= 4 || @p2points >= 4
  end

  def partial_score_condition
    (@p1points != @p2points) && (@p1points <= 3 && @p2points <= 3)
  end

  def deuce_check
    deuce_print_out() if deuce_condition()
  end

  def points_above_four_check
    points_difference_check() if players_points_above_four()
  end

  def partial_score_check
    calc_partial_score() if partial_score_condition()
  end

  def points_difference
    @p1points - @p2points
  end

  def p1_advantage_condition
    @result = "Advantage player1" if points_difference == 1
  end

  def p2_advantage_condition
    @result = "Advantage player2" if points_difference == -1
  end

  def p1_winner_condition
    @result = "Win for player1" if points_difference >= 2
  end

  def p2_winner_condition
    @result = "Win for player2" if points_difference <= -2
  end

  def p1_partial
    @temp_score = @p1points
  end

  def p2_partial
    @result += "-"
    @temp_score = @p2points
  end

  def calc_partial_score
    (1..2).each do |pos|
      p1_partial() if (pos == 1)
      p2_partial() if (pos == 2)
      partial_score_print_out()
    end
  end

end


# class TennisGame2
#   def initialize(player1Name, player2Name)
#     @player1Name = player1Name
#     @player2Name = player2Name
#     @p1points = 0
#     @p2points = 0
#   end
#
#   def won_point(playerName)
#     if playerName == @player1Name
#       p1Score()
#     else
#       p2Score()
#     end
#   end
#
#   def score
#     result = ""
#     if (@p1points == @p2points and @p1points < 3)
#       if (@p1points==0)
#         result = "Love"
#       end
#       if (@p1points==1)
#         result = "Fifteen"
#       end
#       if (@p1points==2)
#         result = "Thirty"
#       end
#       result += "-All"
#     end
#     if (@p1points==@p2points and @p1points>2)
#         result = "Deuce"
#     end
#
#     p1res = ""
#     p2res = ""
#     if (@p1points > 0 and @p2points==0)
#       if (@p1points==1)
#         p1res = "Fifteen"
#       end
#       if (@p1points==2)
#         p1res = "Thirty"
#       end
#       if (@p1points==3)
#         p1res = "Forty"
#       end
#       p2res = "Love"
#       result = p1res + "-" + p2res
#     end
#     if (@p2points > 0 and @p1points==0)
#       if (@p2points==1)
#         p2res = "Fifteen"
#       end
#       if (@p2points==2)
#         p2res = "Thirty"
#       end
#       if (@p2points==3)
#         p2res = "Forty"
#       end
#
#       p1res = "Love"
#       result = p1res + "-" + p2res
#     end
#
#     if (@p1points>@p2points and @p1points < 4)
#       if (@p1points==2)
#         p1res="Thirty"
#       end
#       if (@p1points==3)
#         p1res="Forty"
#       end
#       if (@p2points==1)
#         p2res="Fifteen"
#       end
#       if (@p2points==2)
#         p2res="Thirty"
#       end
#       result = p1res + "-" + p2res
#     end
#     if (@p2points>@p1points and @p2points < 4)
#       if (@p2points==2)
#         p2res="Thirty"
#       end
#       if (@p2points==3)
#         p2res="Forty"
#       end
#       if (@p1points==1)
#         p1res="Fifteen"
#       end
#       if (@p1points==2)
#         p1res="Thirty"
#       end
#       result = p1res + "-" + p2res
#     end
#     if (@p1points > @p2points and @p2points >= 3)
#       result = "Advantage " + @player1Name
#     end
#     if (@p2points > @p1points and @p1points >= 3)
#       result = "Advantage " + @player2Name
#     end
#     if (@p1points>=4 and @p2points>=0 and (@p1points-@p2points)>=2)
#       result = "Win for " + @player1Name
#     end
#     if (@p2points>=4 and @p1points>=0 and (@p2points-@p1points)>=2)
#       result = "Win for " + @player2Name
#     end
#     result
#   end
#
#   def setp1Score(number)
#     (0..number).each do |i|
#         p1Score()
#     end
#   end
#
#   def setp2Score(number)
#     (0..number).each do |i|
#       p2Score()
#     end
#   end
#
#   def p1Score
#     @p1points +=1
#   end
#
#   def p2Score
#     @p2points +=1
#   end
# end
#
# class TennisGame3
#   def initialize(player1Name, player2Name)
#     @p1N = player1Name
#     @p2N = player2Name
#     @p1 = 0
#     @p2 = 0
#   end
#
#   def won_point(n)
#     if n == @p1N
#         @p1 += 1
#     else
#         @p2 += 1
#     end
#   end
#
#   def score
#     if (@p1 < 4 and @p2 < 4) and (@p1 + @p2 < 6)
#       p = ["Love", "Fifteen", "Thirty", "Forty"]
#       s = p[@p1]
#       @p1 == @p2 ? s + "-All" : s + "-" + p[@p2]
#     else
#       if (@p1 == @p2)
#         "Deuce"
#       else
#         s = @p1 > @p2 ? @p1N : @p2N
#         (@p1-@p2)*(@p1-@p2) == 1 ? "Advantage " + s : "Win for " + s
#       end
#     end
#   end
# end
