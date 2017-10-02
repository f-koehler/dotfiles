(defun playerctl/command (command message)
  "Call playerctl asynchronously and display a message."
  (if (executable-find "playerctl")
      (progn
	(start-process "elplayerctl" nil "playerctl" command)
	(message message))
    (message "playerctl not available")))

(defun song-pause()
  "Pause playback using playerctl"
  (interactive)
  (playerctl/command "play-pause" "Toggle playback"))

(defun song-next()
  "Skip to next song using playerctl"
  (interactive)
  (playerctl/command "next" "Next song"))

(defun song-prev()
  "Go back to previous song using playerctl"
  (interactive)
  (playerctl/command "previous" "Previous song"))

(defun song-stop()
  "Stop playback using playerctl"
  (interactive)
  (playerctl/command "stop" "Stop music"))
