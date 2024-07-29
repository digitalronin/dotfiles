function fullScreen(window, screen)
    if not window then
        hs.alert.show("No focused window")
        return
    end

    if not screen then
        hs.alert.show("No screen provided")
        return
    end

    local windowFrame = window:frame()
    local screenFrame = screen:frame()

    setWindowPosition(windowFrame, screenFrame.x, screenFrame.y)
    setWindowSize(windowFrame, screenFrame.w, screenFrame.h)
    window:setFrame(windowFrame)
end


function setWindowPosition(frame, x, y)
  frame.x = x
  frame.y = y
end


function setWindowSize(frame, width, height)
  frame.w = width
  frame.h = height
end


function maximiseWindow()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  fullScreen(win, screen)
end


-- Make current window fill left half of screen
function setWindowLeftHalf()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()
  setWindowPosition(f, max.x, max.y)
  setWindowSize(f, max.w / 2, max.h)
  win:setFrame(f)
end


-- Make current window fill right half of screen
function setWindowRightHalf()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()
  setWindowPosition(f, max.x + (max.w / 2), max.y)
  setWindowSize(f, max.w / 2, max.h)
  win:setFrame(f)
end


-- Make current window fill upper half of screen
function setWindowUpperHalf()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()
  setWindowPosition(f, max.x, max.y)
  setWindowSize(f, max.w, max.h / 2)
  win:setFrame(f)
end


-- Make current window fill lower half of screen
function setWindowLowerHalf()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()
  setWindowPosition(f, max.x, max.y + (max.h / 2))
  setWindowSize(f, max.w, max.h / 2)
  win:setFrame(f)
end


-- Make current window fill top-left quarter of screen
function setWindowUpperLeft()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()
  setWindowPosition(f, max.x, max.y)
  setWindowSize(f, max.w / 2, max.h / 2)
  win:setFrame(f)
end


-- Make current window fill top-right quarter of screen
function setWindowUpperRight()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()
  setWindowPosition(f, max.x + (max.w / 2), max.y)
  setWindowSize(f, max.w / 2, max.h / 2)
  win:setFrame(f)
end


-- Make current window fill bottom-left quarter of screen
function setWindowLowerLeft()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()
  setWindowPosition(f, max.x, max.y + (max.h / 2))
  setWindowSize(f, max.w / 2, max.h / 2)
  win:setFrame(f)
end


-- Make current window fill bottom-right quarter of screen
function setWindowLowerRight()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()
  setWindowPosition(f, max.x + (max.w / 2), max.y + (max.h / 2))
  setWindowSize(f, max.w / 2, max.h / 2)
  win:setFrame(f)
end


-- Function to move the currently focused window to the first monitor
function moveToFirstMonitor()
    local window = hs.window.focusedWindow()
    if not window then
        hs.alert.show("No focused window")
        return
    end

    local screens = hs.screen.allScreens()
    if #screens < 1 then
        hs.alert.show("No monitors detected")
        return
    end

    local firstScreen = screens[1]
    fullScreen(window, firstScreen)
end


-- Function to move the current window to the second monitor
function moveToSecondMonitor()
    local window = hs.window.focusedWindow()
    if not window then
        hs.alert.show("No focused window")
        return
    end

    local screens = hs.screen.allScreens()
    if #screens < 2 then
        hs.alert.show("Second monitor not detected")
        return
    end

    local secondScreen = screens[2]
    fullScreen(window, secondScreen)
end


-- Reload config
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "R", function()
  hs.reload()
end)
hs.alert.show("Config loaded")

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Left", setWindowLeftHalf)
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Right", setWindowRightHalf)
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Up", setWindowUpperHalf)
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Down", setWindowLowerHalf)
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "1", setWindowUpperLeft)
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "2", setWindowUpperRight)
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "3", setWindowLowerLeft)
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "4", setWindowLowerRight)
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Space", maximiseWindow)
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "N", moveToFirstMonitor)
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "M", moveToSecondMonitor)
