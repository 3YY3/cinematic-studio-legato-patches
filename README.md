# cinematic-studio-legato-patches
[Reaper](https://www.reaper.fm/) patches for legato for [Cinematic Studio series](https://cinematicstudioseries.com/) Kontakt instruments.
Intended for use with Advanced legato in CSS and CSSS, Expressive legato in CSW and for legato in CSB.

## General description
These scripts are used while in MIDI editor window. They change the starting position of each note in active take so that it corresponds with the beat.
If you intend to move every note in the take, do not select any of them. Just run the script and wait for magic to happen. If, however, you want to move only some of the notes, select them and run the script.
Remember that first notes in continuous legato move have to be right on the desired beat. Repair them after running the script, or simply do not choose them before running the script.
Script always marks the take with appropriate name suffix, so you know it was already patched (and also to make sure you do not run the script twice on some take).

## Drawbacks
Since this script takes into account the BPM value, if you change BPM later, notes will be in wrong spots. There is also a problem if there is not a constant BPM used through playing the take. In such a situation I recommend splitting the MIDI item and patching the parts separately.
