signature LEXER = sig
	type command
	val hear : string -> string * bool
	val processCommand : command -> string
end