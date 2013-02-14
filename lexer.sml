structure Lexer :> LEXER = struct
	
datatype command = 	ACTION of string
				   |OPERATION of string * string

fun isPrepos "�" = true
   |isPrepos _ = false 

fun getPostfixByPrepos "�" = "��"
   |getPostfixByPrepos _ = ""

(*fun getCommand "�������" withSubj = Commands.beginDialog withSubj
   |getCommand "3" _ = Commands.answer 3
   |getCommand "2" _ = Commands.answer 2
   |getCommand "1" _ = Commands.answer 1
   |getCommand "�ਢ��" _ = "� �⢥� - �設�."
   |getCommand _ "?" = "��������: ��� �, ��室"
   |getCommand _ "�� �����" = "������ ����� ���."
   |getCommand _ "��� �" = Locations.whereAmI ()
   |getCommand "��室" _ = "����� ���⨫�� ஧��� �㬠� � �� ����﫨 ᮧ�����..."
   |getCommand _ x = "�� ᪠���� '"^x^"', �� �� �� ���襡��� � �㤠 �� ᢥ�訫���."
*)

fun rightCase a::(p::(op::[]) = if (isPrepos p andalso String.substring(op,String.length op - String.length p, String.length p) = p) then a::op else "�訡�� �訡��"

fun getCommand sl = 
			case (List.length sl) of
				 1 => ACTION (List.hd sl)
		   		|2 => OPERATION (List.hd sl,List.hd (List.tl sl))
		   		|3 => let
		   				val rsl = rightCase (List.tl sl)
		   			  in
		   			  	OPERATION (List.hd rsl,List.hd (List.tl rsl))
		   			  end
		   		|_ => ACTION "�訡��"

fun processCommand (com : command) = 
	let 
		fun processAction "?" = "�������: ��� �, ��室, �������, ?"
		   |processAction "�ᬮ������" = Commands.lookAround () 
		   |processAction "���" = "����� ���⨫�� ஧��� �㬠� � �� ����﫨 ᮧ�����..."
		   |processAction x = "�� ��� '"^x^"', �� ���� ��ન� �� ��� � ⠪�� �� ��堫."

		fun processOperation ("�������",withSubj) = Commands.beginDialog withSubj
		   |processOperation (x,y) = "�� ��� '"^x^"' c '"^y^"', �� ���� 䮭 ����-����� �� ���⥫ �� �� ������."
	in
		case com 
		 	of	ACTION a => processAction a
		       |OPERATION (p,s) => processOperation (p,s)
	end

fun mustExit (ACTION ("���")) = true
   |mustExit (ACTION x) = false
   |mustExit (OPERATION (x,y)) = false

fun hear str = 	let
					val comStr = Utils.inLowerCase str
					val comTokens = Utils.tokens comStr
					val nt = List.length comTokens
				in
					if (nt>3 orelse nt=0) then 
						("����� �������", false)
					else let
							val com = getCommand comTokens
						in
							if (processCommand com, mustExit com)
						end
				end

end	