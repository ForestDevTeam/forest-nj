structure Commands :> COMMANDS = struct

	fun beginDialog str = Dialogs.beginDialog str
								
	fun answer num = Dialogs.answer num

	fun lookAround () = "Никого здесь нет."

end