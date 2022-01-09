# cinematic-studio-legato-patches
[Reaper](https://www.reaper.fm/) patches for legato for [Cinematic Studio series](https://cinematicstudioseries.com/) Kontakt instruments.
Intended for use with Advanced legato in CSS and CSSS, Expressive legato in CSW and for legato in CSB.

¯\\_(ツ) *Use them to ease you life a little bit...*

## What is CSS, CSSS, CSW and CSB and why did I created the legato scripts?
Cinematic Studio series instruments are great tools for making Cinematic music. These four NI Kontakt instruments cover Strings, Woodwinds and Brass in orchestra, including solo instruments in more that enough cases.
Since their philosophy on the legato is to have true sample with the legato transition, this transition takes some time after you press the key. This creates quite a problem because legato notes are then not played in the right beat but always a little late. Thanks to this you need to manually edit most legato notes start positions in your composition. 
You can of course compensate for this by setting negative offset on the track. However, there are multiple legato transition speeds in CS libraries (each producing different lag in milliseconds). If you choose to compensate in DAW, you are limited in this approach choosing only one of these speeds so that it fits every note (it also proves problematic when changing articulations on the same track).
This is where my scripts come in handy!

## General description
These scripts are used while in MIDI editor window. They change the starting position of each note in active take so that it corresponds with the beat.
If you intend to move every note in the take, do not select any of them. Just run the script and wait for magic to happen. If, however, you want to move only some of the notes, select them and run the script.
Remember that first notes in continuous legato move have to be right on the desired beat. Repair them after running the script, or simply do not choose them before running the script.
Script always marks the take with appropriate name suffix, so you know it was already patched (and also to make sure you do not run the script twice on some take).

## CSS, CSSS and CSW simple legato
If you want to use simple legato instead of advanced or expressive mode, take a look in the instrument PDF documentation and edit the times in ms at the beginning of the scripts.

## Drawbacks
Since these scripts take BPM value into account, if you change BPM later, notes will be in wrong spots. There is also a problem if there is not a constant BPM used through playing the take. In such a situation I recommend splitting the MIDI item and patching the parts separately. Or just move start of each note manually in some cases.
