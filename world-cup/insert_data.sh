#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

cat games.csv | while IFS="," read -r year round winner opponent winner_goals opponent_goals
do
  if [[ $year != "year" ]]
  then
    winner_id=$($PSQL "SELECT team_id FROM teams WHERE name='$winner'")
    if [[ -z $winner_id ]]
    then
      $PSQL "INSERT INTO teams(name) VALUES('$winner')" > /dev/null
      winner_id=$($PSQL "SELECT team_id FROM teams WHERE name='$winner'")
    fi
    opponent_id=$($PSQL "SELECT team_id FROM teams WHERE name='$opponent'")
    if [[ -z $opponent_id ]]
    then
      $PSQL "INSERT INTO teams(name) VALUES('$opponent')" > /dev/null
      opponent_id=$($PSQL "SELECT team_id FROM teams WHERE name='$opponent'")
    fi
    $PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($year, '$round', $winner_id, $opponent_id, $winner_goals, $opponent_goals)" > /dev/null
  fi
done
