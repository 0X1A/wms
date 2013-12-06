--------------------     Imports     --------------------
import XMonad
import XMonad.Actions.DwmPromote
import XMonad.Layout.Spacing
import XMonad.Layout.ResizableTile
import XMonad.Layout.Named
import XMonad.Layout.Spiral
import XMonad.Layout.NoBorders
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.UrgencyHook
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig
import System.IO

import qualified XMonad.StackSet as W

--------------------        Main      --------------------

main = do
    status  <- spawnPipe myDzenStatus
    conky   <- spawnPipe myDzenConky
    xmonad $ withUrgencyHook NoUrgencyHook $ defaultConfig
        {   terminal    = "urxvt"
        ,   workspaces  = myWorkSpaces
        ,   manageHook  = manageDocks <+> myManageHook
                          <+> manageHook defaultConfig
        ,   layoutHook  = customLayoutHook
        ,   handleEventHook     = fullscreenEventHook
        ,   logHook     = myLogHook status
        ,   modMask     = mod4Mask
        ,   normalBorderColor   = "#404040"
        ,   focusedBorderColor  = "#303030"
        ,   borderWidth = 3
        }
        `additionalKeys` myKeys

myManageHook = composeAll
    [
    ]

myKeys =    [   ((mod4Mask, xK_m), spawn "urxvt -e mutt")
            ,   ((mod4Mask, xK_e), spawn "urxvt -e vim")
            ,   ((0, xK_Print), spawn "scrot")
            ,   ((mod4Mask, xK_F12), spawn "amixer set Master 2+ unmute")
            ,   ((mod4Mask, xK_F11), spawn "amixer set Master 2- unmute")
            ,   ((mod4Mask, xK_F10), spawn "amixer set Master 1+ toggle")
            ,   ((mod4Mask, xK_F6), spawn "xbacklight -inc 10")
            ,   ((mod4Mask, xK_F5), spawn "xbacklight -dec 10")
            ,   ((mod4Mask, xK_F7), spawn "xbacklight -set 0")
            ,   ((mod4Mask, xK_b), spawn "firefox")
            ]

--------------------     Layout Hook     --------------------
customLayoutHook    = avoidStruts $ (tiled ||| mirrortiled ||| full)
    where
        full            = named "F" $ Full
        mirrortiled     = named "M" $ Mirror tiled
        tiled           = named "T" $ spacing 10 $ Tall 1 (3/100) (1/2)

--------------------     Workspaces      --------------------

myWorkSpaces            :: [String]
myWorkSpaces            = clickable . (map dzenEscape) $ ["I","II","III","IV","V"]

  where clickable l     = [ "^ca(1,xdotool key super+" ++ show (n) ++ ")" ++ ws ++ "^ca()" |
                            (i,ws) <- zip [1..] l,
                            let n = i ]

--------------------      Log Hook        --------------------
myLogHook h = dynamicLogWithPP $ myDzenPP { ppOutput = hPutStrLn h }

myDzenStatus = "dzen2 -ta 'l'" ++ myDzenStyle
myDzenConky  = "conky -c ~/.conkyrc | dzen2 -x '320' -w '0' -ta 'r'" ++ myDzenStyle
myDzenStyle  = " -h '20' -fg '#FFFFFF' -bg '#303030' -fn 'Terminus:size=9'"

myDzenPP  = dzenPP
    { ppCurrent = dzenColor "#90C63D" "" . wrap " " " "
    , ppHidden  = dzenColor "#FFFFFF" "" . wrap " " " "
    , ppHiddenNoWindows = dzenColor "#7B7B7B" "" . wrap " " " "
    , ppUrgent  = dzenColor "#ff0000" "" . wrap " " " "
    , ppSep     = "     "
    , ppLayout  = dzenColor "#aaaaaa" "" . wrap "^ca(1,xdotool key super+space)" "^ca()"
    , ppTitle   = dzenColor "#93a1a1" ""
                    . wrap "^ca(1,xdotool key super+k)^ca(2,xdotool key super+shift+c)"
                           "                          ^ca()^ca()" . shorten 30 . dzenEscape
    }
