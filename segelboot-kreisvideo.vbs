
Set oShell = CreateObject("WScript.Shell")
aktuellesVerzeichnis = oShell.CurrentDirectory

' Eine Funktion um Ticker Texte hinzuzufügen
'
' text = Der anzuzeigene Text
' sX, sY = Die Startposition. Kann (und sollte) außerhalb des Bildschirms liegen
' dX, dY = Werte, die mit jedem Frame zur Position addiert werden (Delta Vector)
Function CreateTextWithVectorMovement(byval text, byval sX, byval sY, byval dX, byval dY)

	dim move : set move = Wscript.CreateObject("Liconcomp.VectorMovement")
	move.SetX sX
	move.SetY sY
	move.SetDeltaX dX
	move.SetDeltaY dY

	dim ticker : set ticker = player.CreateSimpleText()
	ticker.Text = text
	ticker.Movement = move
	
	' Sichtbarkeit zuletzt setzen!
	ticker.Visible = True
	
End Function

' Eine Funktion um Videos hinzuzufügen
'
' filename = Die Videodatei, die angezeigt werden soll
' sX, sY = Die Startposition. Kann (und sollte) außerhalb des Bildschirms liegen
' dX, dY = Werte, die mit jedem Frame zur Position addiert werden (Delta Vector)
Function CreateVideoWithVectorMovement( _
	byval filename, _
	byval sX, _
	byval sY, _
	byval dX, _
	byval dY, _
	byval linebreak, _
	byval offsetX, _
	byval offetY, _
	byval loopCount)

	dim video : set video = nothing
	set video = player.CreateVideoFromFile(filename)
	dim move : set move = Wscript.CreateObject("Liconcomp.VectorMovement")
	move.SetX sX
	move.SetY sY
	move.SetDeltaX dX
	move.SetDeltaY dY
	video.Movement = move
	video.LineBreak = linebreak
	video.OffsetX = offsetX
	video.OffsetY = offsetY
	video.Play()
	video.Visible = True
	
End Function

' Eine Funktion um statische Texte hinzuzufügen
'
' text = Der anzuzeigene Text
' sX, sY = Die Position.
Function CreateStaticText(byval text, byval sX, byval sY)
	dim move : set move = Wscript.CreateObject("Liconcomp.StaticPosition")
	move.SetX sX
	move.SetY sY

	dim ticker : set ticker = player.CreateSimpleText()
	ticker.Text = text
	ticker.Movement = move
	
	' Sichtbarkeit zuletzt setzen!
	ticker.Visible = True
	
	CreateStaticText = ticker

End Function

dim player : set player = nothing
set player = Wscript.CreateObject("Liconcomp.Player")
player.SetBackgroundColor Int(0), Int(0), Int(0)


CreateVideoWithVectorMovement aktuellesVerzeichnis+"\sailboat.avi", 0, 0, 0, 0, 920, 0, 0, 0

CreateTextWithVectorMovement "Viel Erfolg!", 100, 150, 0, 0

