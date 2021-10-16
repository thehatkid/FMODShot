# FMOD Engine for ModShot

FMOD Engine by Firelight Technologies Pty Ltd.

## What is it?
[FMOD](https://www.fmod.com/) is a proprietary sound effects engine and
authoring tool for video games and applications developed by Firelight
Technologies, that play and mix sounds of diverse formats on many operating
systems. [(from Wikipedia)](https://en.wikipedia.org/wiki/FMOD)

**FMODShot** allows you to interact with FMOD library in OneShot (RGSS),
adds some effects, reverb, DSP and more.

Also you can download/update the FMOD Engine library:
https://www.fmod.com/download

## What is its goal?
The objective is to make a sufficient library that helps to easily play sound
or background music with effects, reverb or DSP inside OneShot.

## How to install it?
1. You must have [ModShot Core](https://github.com/Astrabit-ST/ModShot-Core/)
   to run it.
2. Download or Clone this repository.
3. Copy files from `lib\` to ModShot's `lib\ruby\`
4. Copy FMOD Engine library from `ext\` to root directory of OneShot
   - `fmod.dll` for Windows 32-bits
   - `fmod64.dll` for Windows 64-bits
   - `x86-linux\libfmod.so` for Linux x86
   - `x86_64-linux\libfmod.so` for Linux x86_64
5. Also You need put script from `scripts\` to `Data\xScripts.rxdata`
   - With RPG Maker XP
     - Rename `xScripts.rxdata` to `Scripts.rxdata`
     - Open RPG Maker XP, load OneShot as Project, open Script Editor
     - Create script with name `Audio_FMOD` and put code from
       `scripts\Audio_FMOD.rb`
     - Save code and save project, then exit from RPG Maker XP
     - Rename `Scripts.rxdata` to `xScripts.rxdata`
   - With extracting `xScripts.rxdata`
     - Extract content with Ruby Script `rpgscript.rb`
       [(script)](https://github.com/Astrabit-ST/ModShot-Core/blob/master/rpgscript.rb):
       ```
       ruby rpgscript.rb <path to OneShot> <path to extract> x
       ```
     - Copy script(s) from `scripts\` to extracted directory
     - Append `_scripts.txt` names from script(s)
     - Pack `xScripts.rxdata` with ruby script:
       ```
       ruby rpgscript.rb <path to OneShot> <extracted path>
       ```

## Issues
- Anywhere crashing with segmentation fault. *(why...)*
- Only maded for BGM.

## Contribution
Feel free to contribute this project.