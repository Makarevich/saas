class WrongNumberOfPlayersError < StandardError ; end 
class NoSuchStrategyError < StandardError ; end 
 
def rps_game_winner(game) 
 raise WrongNumberOfPlayersError unless game.length == 2 
 # your code here 

 codes = { 'R' => 1, 'P' => 2, 'S' => 0 }

 k1 = codes[game[0][1]]
 k2 = codes[game[1][1]]

 raise NoSuchStrategyError unless k1 and k2

 if k1 == k2 or k1 == (k2 + 1) % 3
     game[0]
 else
     game[1]
 end
end 

def rps_tournament_winner ttt
    if ttt[0].class == String
        return ttt
    end

    rps_game_winner [ rps_tournament_winner(ttt[0]), rps_tournament_winner(ttt[1]) ]
    #rps_tournament_winner ttt[0]
end

%Q{
puts rps_game_winner [ ["Armando", "S"], ["Dave", "P"] ]

puts rps_tournament_winner [ 
[ 
  [ ["Armando", "P"], ["Dave", "S"] ], 
  [ ["Richard", "R"],  ["Michael", "S"] ], 
], 
[  
  [ ["Allen", "S"], ["Omer", "R"] ], 
  [ ["David E.", "R"], ["Richard X.", "S"] ] 
] 
] 
 
}
