import XMonad
import XMonad.Actions.SwapWorkspaces
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO
import qualified Data.Map as M


myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $
    [((modm .|. controlMask, k), windows $ swapWithCurrent i)
        | (i, k) <- zip myWorkspaces [xK_1 .. xK_9]]

myWorkspaces = ["web", "code", "chat", "vm"] ++ map show [5..8] ++ ["music"]

main = do
    xmproc <- spawnPipe "xmobar /home/jmarshall/.xmobarrc"
    xmonad $ defaultConfig {
        manageHook = manageDocks <+> manageHook defaultConfig
        , workspaces = myWorkspaces
        , layoutHook = avoidStruts $ layoutHook defaultConfig
        , logHook = dynamicLogWithPP xmobarPP
            { ppOutput = hPutStrLn xmproc
            , ppTitle = xmobarColor "green" "" . shorten 50
            }
        , startupHook = do
            spawn "xloadimage -onroot -fullscreen -tile /home/jmarshall/.background.jpg"
        }
