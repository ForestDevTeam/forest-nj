structure Utils :> UTILS = struct 
	fun toLower #"�" = #"�"
	   |toLower #"�" = #"�"
	   |toLower #"�" = #"�"
	   |toLower #"�" = #"�"
	   |toLower #"�" = #"�"
	   |toLower #"�" = #"�"
	   |toLower #"�" = #"�"
	   |toLower #"�" = #"�"
	   |toLower #"�" = #"�"
	   |toLower #"�" = #"�"
	   |toLower #"�" = #"�"
	   |toLower #"�" = #"�"
	   |toLower #"�" = #"�"
	   |toLower #"�" = #"�"
	   |toLower #"�" = #"�"
	   |toLower #"�" = #"�"
	   |toLower #"�" = #"�"
	   |toLower #"�" = #"�"
	   |toLower #"�" = #"�"
	   |toLower #"�" = #"�"
	   |toLower #"�" = #"�"
	   |toLower #"�" = #"�"
	   |toLower #"�" = #"�"
	   |toLower #"�" = #"�"
	   |toLower #"�" = #"�"
	   |toLower #"�" = #"�"
	   |toLower #"�" = #"�"
	   |toLower #"�" = #"�"
	   |toLower #"�" = #"�"
	   |toLower #"�" = #"�"
	   |toLower #"�" = #"�"
	   |toLower #"�" = #"�"
	   |toLower #"�" = #"�"
	   |toLower c = Char.toLower c
	   
	fun toUpper #"�" = #"�"
	   |toUpper #"�" = #"�"
	   |toUpper #"�" = #"�"
	   |toUpper #"�" = #"�"
	   |toUpper #"�" = #"�"
	   |toUpper #"�" = #"�"
	   |toUpper #"�" = #"�"
	   |toUpper #"�" = #"�"
	   |toUpper #"�" = #"�"
	   |toUpper #"�" = #"�"
	   |toUpper #"�" = #"�"
	   |toUpper #"�" = #"�"
	   |toUpper #"�" = #"�"
	   |toUpper #"�" = #"�"
	   |toUpper #"�" = #"�"
	   |toUpper #"�" = #"�"
	   |toUpper #"�" = #"�"
	   |toUpper #"�" = #"�"
	   |toUpper #"�" = #"�"
	   |toUpper #"�" = #"�"
	   |toUpper #"�" = #"�"
	   |toUpper #"�" = #"�"
	   |toUpper #"�" = #"�"
	   |toUpper #"�" = #"�"
	   |toUpper #"�" = #"�"
	   |toUpper #"�" = #"�"
	   |toUpper #"�" = #"�"
	   |toUpper #"�" = #"�"
	   |toUpper #"�" = #"�"
	   |toUpper #"�" = #"�"
	   |toUpper #"�" = #"�"
	   |toUpper #"�" = #"�"
	   |toUpper #"�" = #"�"
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