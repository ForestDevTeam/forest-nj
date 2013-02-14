structure Utils :> UTILS = struct 
	fun toLower #"Ä" = #"†"
	   |toLower #"Å" = #"°"
	   |toLower #"Ç" = #"¢"
	   |toLower #"É" = #"£"
	   |toLower #"Ñ" = #"§"
	   |toLower #"Ö" = #"•"
	   |toLower #"" = #"Ò"
	   |toLower #"Ü" = #"¶"
	   |toLower #"á" = #"ß"
	   |toLower #"à" = #"®"
	   |toLower #"â" = #"©"
	   |toLower #"ä" = #"™"
	   |toLower #"ã" = #"´"
	   |toLower #"å" = #"¨"
	   |toLower #"ç" = #"≠"
	   |toLower #"é" = #"Æ"
	   |toLower #"è" = #"Ø"
	   |toLower #"ê" = #"‡"
	   |toLower #"ë" = #"·"
	   |toLower #"í" = #"‚"
	   |toLower #"ì" = #"„"
	   |toLower #"î" = #"‰"
	   |toLower #"ï" = #"Â"
	   |toLower #"ñ" = #"Ê"
	   |toLower #"ó" = #"Á"
	   |toLower #"ò" = #"Ë"
	   |toLower #"ô" = #"È"
	   |toLower #"ú" = #"Ï"
	   |toLower #"õ" = #"Î"
	   |toLower #"ö" = #"Í"
	   |toLower #"ù" = #"Ì"
	   |toLower #"û" = #"Ó"
	   |toLower #"ü" = #"Ô"
	   |toLower c = Char.toLower c
	   
	fun toUpper #"†" = #"Ä"
	   |toUpper #"°" = #"Å"
	   |toUpper #"¢" = #"Ç"
	   |toUpper #"£" = #"É"
	   |toUpper #"§" = #"Ñ"
	   |toUpper #"•" = #"Ö"
	   |toUpper #"Ò" = #""
	   |toUpper #"¶" = #"Ü"
	   |toUpper #"ß" = #"á"
	   |toUpper #"®" = #"à"
	   |toUpper #"©" = #"â"
	   |toUpper #"™" = #"ä"
	   |toUpper #"´" = #"ã"
	   |toUpper #"¨" = #"å"
	   |toUpper #"≠" = #"ç"
	   |toUpper #"Æ" = #"é"
	   |toUpper #"Ø" = #"è"
	   |toUpper #"‡" = #"ê"
	   |toUpper #"·" = #"ë"
	   |toUpper #"‚" = #"í"
	   |toUpper #"„" = #"ì"
	   |toUpper #"‰" = #"î"
	   |toUpper #"Â" = #"ï"
	   |toUpper #"Ê" = #"ñ"
	   |toUpper #"Á" = #"ó"
	   |toUpper #"Ë" = #"ò"
	   |toUpper #"È" = #"ô"
	   |toUpper #"Ï" = #"ú"
	   |toUpper #"Î" = #"õ"
	   |toUpper #"Í" = #"ö"
	   |toUpper #"Ì" = #"ù"
	   |toUpper #"Ó" = #"û"
	   |toUpper #"Ô" = #"ü"
	   |toUpper c = Char.toUpper c
	   
	fun inLowerCase str = (String.implode o map toLower o String.explode) str
	fun inUpperCase str = (String.implode o map toUpper o String.explode) str

	fun isSeparator #" " = true
	   |isSeparator #"," = true
	   |isSeparator #"." = true
	   |isSeparator #";" = true
	   |isSeparator #"!" = true
	   |isSeparator #"\n" = true
	   |isSeparator _ = false
	   
	fun isPuncto #"?" = true
	   |isPuncto #"\n" = true
	   |isPuncto _ = false

	fun isUpper c = if (toUpper c = c) then true else false
	   
	fun isLower c = if (toLower c = c) then true else false

	fun tokens str = String.tokens isSeparator str
	
	fun filter str = concat (String.tokens isPuncto str) 

	fun tale str = substring (str, (size o hd o tokens) str, size str - (size o hd o tokens) str)
	
	fun head str = (hd o tokens) str
end