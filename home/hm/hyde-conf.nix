{config, ...  }:

''
  #      ░▒▒▒░░░░░▓▓          ___________
  #    ░░▒▒▒░░░░░▓▓        //___________/
  #   ░░▒▒▒░░░░░▓▓     _   _ _    _ _____
  #   ░░▒▒░░░░░▓▓▓▓▓▓ | | | | |  | |  __/
  #    ░▒▒░░░░▓▓   ▓▓ | |_| | |_/ /| |___
  #     ░▒▒░░▓▓   ▓▓   \__  |____/ |____/
  #       ░▒▓▓   ▓▓  //____/


  #|--/ /+-------------------------+--/ /|#
  #|-/ /-| HyDE Configuration File |-/ /-|#
  #|/ /--+-------------------------+/ /--|#


  # ▀█▀ █░█ █▀▀ █▀▄▀█ █▀▀
  # ░█░ █▀█ ██▄ █░▀░█ ██▄

  #// hydeTheme indicates the current theme is use
  #// DO NOT update this manually, use - themeswitch.sh
  hydeTheme="Catppuccin Mocha"


  # █░█░█ ▄▀█ █░░ █░░ █▀█ ▄▀█ █▀█ █▀▀ █▀█
  # ▀▄▀▄▀ █▀█ █▄▄ █▄▄ █▀▀ █▀█ █▀▀ ██▄ █▀▄

  #// wallFramerate sets the transition FPS while changing wallpaper
  #// set this to match your monitor refresh rate
  wallFramerate=${toString  (144)}

  #// wallTransDuration sets the transition duration while changing wallpaper
  #// set this value in seconds
  wallTransDuration=${toString ( 0.4)}

  #// wallAddCustomPath sets the custom user directories scanned for wallpaper
  #// add your wallpaper directories as - wallAddCustomPath=("/path/to/wall/dir1" "/path/to/wall/dir2")
  wallAddCustomPath="${ ""}"


  # █░█░█ ▄▀█ █░░ █░░ █▄▄ ▄▀█ █▀ █░█
  # ▀▄▀▄▀ █▀█ █▄▄ █▄▄ █▄█ █▀█ ▄█ █▀█

  #// enableWallDcol determines the colors deployed by wallbash. DO NOT update this manually, use - wallbashtoggle.sh
  #// 0 applies the colors from current theme
  #// 1 applies auto colors from current wallpaper (dark colors for dark wallpaper/light colors for light wallpaper)
  #// 2 applies dark colors for dark wallpaper/force dark colors for light wallpaper
  #// 3 applies light colors for light wallpaper/force light colors for dark wallpaper
  enableWallDcol="2"

  #// wallbashCustomCurve sets the HSV curve based on which the accent colors are generated
  #// for ex. wallbashCustomCurve="32 50\n42 46\n49 40\n56 39\n64 38\n76 37\n90 33\n94 29\n100 20"
  #// here it has nine lines where each line has 2 values {Brightness} (0-100) and {Saturation} (0-100)
  #// so edit this curve to fine tune the Brightness and Saturation % values for your accent colors
  #// dont forget to regenerate cache once you set this curve - swwwallcache.sh -f
  wallbashCustomCurve="${""}"

  #// skip_wallbash specifies wallbash templates that should be excluded from processing
  #// Add paths of templates you want to skip, relative to $hydeConfDir (which points to ~/.config/hyde/)
  #// This allows you to selectively exclude certain templates from the wallbash process
  #// while still processing others
  #// example: 
  #// skip_wallbash=(
  #//    "''${hydeConfDir}/wallbash/Wall-Dcol/waybar.dcol" #! This skips waybar
  #//    "''${hydeConfDir}/wallbash/Wall-Ways/code.dcol" #! Skips code
  #// )

  skip_wallbash=(
    ${toString (builtins.concatStringsSep "\n  " 
      (map (path: "\"${path}\"") ( []))
    )}
  )


  # █▀█ █▀█ █▀▀ █
  # █▀▄ █▄█ █▀░ █

  #// themeSelect sets the style for theme select menu
  #// available styles - 1 (default) , 2
  themeSelect=${toString ( 2)}

  #// rofiStyle sets the style for rofi application launcher
  #// to select from available styles use - rofiselect.sh
  rofiStyle="${toString ( 11)}"

  #// rofiStyle sets the scale for rofi application launcher
  #// adjust this value to increase/decrease the launcher size
  rofiScale=${toString ( 9)}


  # █░░ █▀█ █▀▀ █▀█ █░█ ▀█▀
  # █▄▄ █▄█ █▄█ █▄█ █▄█ ░█░

  #// wlogoutStyle sets the style for logout menu
  #// available styles - 1 (default) , 2
  wlogoutStyle=${toString ( 1)}
''
