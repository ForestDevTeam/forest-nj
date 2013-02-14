structure Lexer :> LEXER = struct
	
datatype command = 	ACTION of string
				   |OPERATION of string * string

fun isPrepos "с" = true
   |isPrepos _ = false 

fun getPostfixByPrepos "с" = "ом"
   |getPostfixByPrepos _ = ""

(*fun getCommand "говорить" withSubj = Commands.beginDialog withSubj
   |getCommand "3" _ = Commands.answer 3
   |getCommand "2" _ = Commands.answer 2
   |getCommand "1" _ = Commands.answer 1
   |getCommand "привет" _ = "А ответ - тишина."
   |getCommand _ "?" = "Комманды: где я, выход"
   |getCommand _ "кто здесь" = "Никого здесь нет."
   |getCommand _ "где я" = Locations.whereAmI ()
   |getCommand "выход" _ = "Вокруг сгустился розовый туман и Вы потеряли сознание..."
   |getCommand _ x = "Вы сказали '"^x^"', но Вы не волшебник и чуда не свершилось."
*)

fun rightCase a::(p::(op::[]) = if (isPrepos p andalso String.substring(op,String.length op - String.length p, String.length p) = p) then a::op else "ошибка ошибка"

fun getCommand sl = 
			case (List.length sl) of
				 1 => ACTION (List.hd sl)
		   		|2 => OPERATION (List.hd sl,List.hd (List.tl sl))
		   		|3 => let
		   				val rsl = rightCase (List.tl sl)
		   			  in
		   			  	OPERATION (List.hd rsl,List.hd (List.tl rsl))
		   			  end
		   		|_ => ACTION "ошибка"

fun processCommand (com : command) = 
	let 
		fun processAction "?" = "Команды: где я, выход, говорить, ?"
		   |processAction "осмотреться" = Commands.lookAround () 
		   |processAction "выйти" = "Вокруг сгустился розовый туман и Вы потеряли сознание..."
		   |processAction x = "Вы хотите '"^x^"', но даже маркиз де Сад о таком не слыхал."

		fun processOperation ("говорить",withSubj) = Commands.beginDialog withSubj
		   |processOperation (x,y) = "Вы хотите '"^x^"' c '"^y^"', но даже фон Захер-Мазох не захотел бы это делать."
	in
		case com 
		 	of	ACTION a => processAction a
		       |OPERATION (p,s) => processOperation (p,s)
	end

fun mustExit (ACTION ("выйти")) = true
   |mustExit (ACTION x) = false
   |mustExit (OPERATION (x,y)) = false

fun hear str = 	let
					val comStr = Utils.inLowerCase str
					val comTokens = Utils.tokens comStr
					val nt = List.length comTokens
				in
					if (nt>3 orelse nt=0) then 
						("Много говоришь", false)
					else let
							val com = getCommand comTokens
						in
							if (processCommand com, mustExit com)
						end
				end

end	