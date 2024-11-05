#!/bin/bash

#Introduction - Should help the user understand the point of this script
echo "Installer for Ableton Live 12 and WINE"
echo "This will install WINE and try to configure Ableton Live 12 for the best possible use."

#Make a directory and CD into it.

mkdir AbletonLive12
cd AbletonLive12

#Install the basic WINE functions and the necessary software to make WINE fully work along with better software to configure WINE.

echo "This will require a SUDO password at least one time, but it may require a SUDO password some other times too. This part will install WINE and the necessary software."
sudo sed -i "/\[multilib\]/,/Include/"'s/^#//' /etc/pacman.conf
sudo pacman -Syyu
sudo pacman -S wine winetricks zenity curl p7zip

#Let the user select the type of Ableton Live 12 they want. That can be Intro, Standard, or Suite.
echo "Please select your version of Ableton Live 12."

AL12="Select your version of Ableton Live 12"

select abletonlive12 in Intro Standard Suite; do

  case $abletonlive12 in
    Intro)
    curl https://cdn-downloads.ableton.com/channels/12.1.1/ableton_live_intro_12.1.1_64.zip --output AbletonLive12Intro.zip
    break
      ;;
    Standard)
    curl https://cdn-downloads.ableton.com/channels/12.1.1/ableton_live_standard_12.1.1_64.zip --output AbletonLive12Standard.zip
    break
      ;;
    Suite)
    curl https://cdn-downloads.ableton.com/channels/12.1.1/ableton_live_suite_12.1.1_64.zip --output AbletonLive12Suite.zip
    break
      ;;
    *)
      echo "Invalid option $REPLY"
      ;;
  esac
done
break

#Test command, but I'll leave it here for now. Just until I know what's the full outcome of this script.
echo $abletonlive12

#Let the user know what we're doing next

echo "Done downloading Ableton Live 12 $abletonlive12"
echo "Extracting Ableton Live 12 $abletonlive12 contents!"
7z x *.zip

#Start the installation of Ableton Live 12
echo "Running WINE to start installation of Ableton Live $abletonlive12"

wine "Ableton Live 12 $abletonlive12 Installer.exe"
