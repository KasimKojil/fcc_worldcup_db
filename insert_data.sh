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
    TEAMS_NAME=$($PSQL "SELECT name FROM teams WHERE name = '$WINNER'")
    
    #if not found
    if [[ -z $WINNER_ID ]]
    then 
       
      #insert into (from winner side)
        if [[ $TEAMS_NAME != $WINNER ]]
        then
        INSERT_TEAMS_NAME=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
        fi

        #check if succes
        if [[ $INSERT_TEAMS_NAME == "INSERT 0 1" ]]
        then
          echo inserted "$WINNER" succes
        fi
        

    fi

    #get team_id from opponent side
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT'")
    TEAMS_NAME=$($PSQL "SELECT name FROM teams WHERE name = '$OPPONENT'")
        
    #if not found
    if [[ -z $OPPONENT_ID ]]
    then
        
        # insert into (from opponent side)
        if [[ $TEAMS_NAME != $OPPONENT ]]
        then
        INSERT_TEAMS_NAME=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")

        fi

        #check if succes
        if [[ $INSERT_TEAMS_NAME == "INSERT 0 1" ]]
        then
          echo inserted "$OPPONENT" succes
        fi
    fi
        #kode di atas membagi pencarian menjadi dua sesi
        #sesi pertama input dari sisi winner
        #sesi kedua dari sisi opponent
        
    
  fi
done

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS 
do
  # pengecualian title
  if [[ $YEAR != 'year' ]] 
  then
    
    #get game_id,  winner & opponent @id, untuk values insert
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER'")
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT'")
    
    GAMES_ID=$($PSQL "SELECT game_id from games WHERE winner_id = '$WINNER_ID' AND opponent_id = '$OPPONENT_ID'")
    
    #if not found
      if [[ -z $GAMES_ID ]]
      then
    #inser into
      INSERT_GAMES_RESULT=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)")
      fi

      #check if succes
      if [[ $INSERT_GAMES_RESULT == "INSERT 0 1" ]]
      then
        echo "insert $ROUND games succes"
      fi 

    #get new game_id
    GAMES_ID=$($PSQL "SELECT game_id from games WHERE winner_id = '$WINNER_ID' AND opponent_id = '$OPPONENT_ID'")
  fi
done


#kode di atas masih terlalu kompleks 
#masih ada cara untuk menyederhanakan, dengan mengurangin beberapa hal yang tidak perlu 
  #seperti: 
    # - while-loop kedua tidak perlu ditulis ulang 
    # - variable teams_name tidak diperlukan 
    # - variable untuk insert data, bisa diganti dengan perintah echo langsung
    
#dengan begitu waktu yang diperlukan lebih singkat dalam menjalankan progaram 
#menjadi lebih efisien dalam keterbacaan sebuah kode
