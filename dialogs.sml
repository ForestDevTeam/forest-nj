structure Dialogs :> DIALOGS = struct

	fun beginDialog str = if ((Utils.tale str) = "") 
								then "�� ������ ᠬ� � ᮡ��... �� �㬠�襤訩?"
								else "��"^Utils.tale str^" �� �⢥⨫ ���."
								
	fun answer num = Int.toString num

	fun isPers "�����" = true
		|isPers x = false

	fun isPostfix "�" = true
		|isPostfix "�" = true
		|isPostfix "��" = true
		|isPostfix x = false
end