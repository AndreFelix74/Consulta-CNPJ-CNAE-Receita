copyPageContent() {
	clipboard = 
	nAttempt := 0
	Loop,
	{
		Send ^u
		Sleep, 800
		WinGetActiveTitle, text
		if(SubStr(text, 1, 12) != "view-source:")
		{
			Sleep, 1000
			Continue
		}
		Send ^a
		Send ^c
		if(copyPageContentCheck())
		{
			Break
		}
		clipboard = 
		nAttempt += 1
		if(nAttempt > 10)
		{
			MsgBox , , , %nAttempt%º tentativa, %nAttempt%
		}
		Sleep, 1000
		Send ^w
	}
	Send ^w
	Sleep, 500
}

openPage(strURL, strPageTitle) {
	strBrowserPath = C:\Program Files (x86)\Google\Chrome\Application\chrome.exe
    Run, %strBrowserPath% -incognito %strURL%
	Sleep, 100
	WinWait, %strPageTitle% - Google Chrome
	Sleep, 200
}
