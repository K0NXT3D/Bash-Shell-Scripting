#!/usr/bin/env bash
# Horrible Random Melody Maker 1.0.0
# R. Seaverns 2021
# Set Up Our Notes.
clear
echo "Horrible Random Melody Maker 1.0.0 R. Seaverns 2021"
sleep 2 && clear

x=0
while [ $x -le 1 ]
do
#StandardTuning=("E2" "A2" "D3" "G3" "B3" "E4")
ChromaticTuning=("C2" "C#2" "D2" "D#2" "E2" "F2" "F#2" "G2" "G#2" "A2" "A#2" "B2" "C3" "C#3" "D3" "D#3" "E3" "F3" "F#3" "G3" "G#3" "A3" "A#3" "B3" "C4" "C#4" "D4" "D#4" "E4" "F4" "F#4" "G4" "G#4" "A4" "A#4" "B4" "C5")
# Set Note Duration
Timeout=1.5
SelectedNote=$(printf "%s\n" "${ChromaticTuning[@]}" | shuf -n1)
# Loop Through Notes
for Note in $SelectedNote ; do
  unset continue
  ifs="$IFS"
  IFS=""                  
    ps $NotePID &> /dev/null && kill $NotePID &> /dev/null
    echo $Note && play -qnV0 synth $Timeout pl $Note &
    notePID="$!"
    read -sN1 -t $Timeout continue
  IFS="$ifs"
done
# Kill The Synth When Closed
    ps $NotePID &> /dev/null && kill $NotePID &> /dev/null
# Loop The Script
x=$(( $x - 1 ))
done
./$(basename $0) && exit
