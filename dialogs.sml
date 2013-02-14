structure Dialogs :> DIALOGS = struct

	fun beginDialog str = if ((Utils.tale str) = "") 
								then "Вы говорите сами с собой... Вы сумасшедший?"
								else "Но"^Utils.tale str^" не ответил Вам."
								
	fun answer num = Int.toString num

	fun isPers "молчун" = true
		|isPers x = false

	fun isPostfix "а" = true
		|isPostfix "у" = true
		|isPostfix "ом" = true
		|isPostfix x = false
end