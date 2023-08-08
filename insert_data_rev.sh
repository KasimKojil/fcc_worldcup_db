#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
echo $($PSQL "TRUNCATE games, teams")

#insert teams name
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS 
do
  if [[ $WINNER != "winner" ]]

  then

    #get team_id for WINNER side
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER'")
    
    #if not found
    if [[ -z $WINNER_ID ]]
    then 
      echo "$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")"
      echo inserted "$WINNER" succes
    
    #if found instead
    else
      echo "$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")"
      echo inserted "$OPPONENT" succes

    fi
  fi
done


#tetap menggunakan while loop ke dua 
#jika tidak, maka team_id untuk opponent akan kosong dan tidak bisa memasukkan nilai untuk games 
#apakah ada cara lain
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS 
do
  if [[ $YEAR != "year" ]]
  then

    #get game_id,  winner & opponent @id, untuk values insert
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER'")
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT'")
    
    GAMES_ID=$($PSQL "SELECT game_id from games WHERE winner_id = '$WINNER_ID' AND opponent_id = '$OPPONENT_ID'")
    
    #if not found
      if [[ -z $GAMES_ID ]]
      then
        echo "$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)")"
        echo "insert $ROUND games succes"
      
      fi 

    #get new game_id
    GAMES_ID=$($PSQL "SELECT game_id from games WHERE winner_id = '$WINNER_ID' AND opponent_id = '$OPPONENT_ID'")
  fi
done

# lebih ringkas dari yang sebelumnya, mambagi insert team_id menjadi dua sesi
