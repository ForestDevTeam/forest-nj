structure Main :> MAIN = struct

fun out x = print (x^"\n")   
   
fun outPlace () = out (Locations.whereAmI ())    
   
fun hear () = let 
            val (result, mustExit) = Lexer.hear (TextIO.input TextIO.stdIn)
			in
				out result;
				mustExit
			end

fun loop () = (if hear() then () else loop()) 
			   
fun beginGame () = (out "Forest"; outPlace(); loop())			   
			   
(*val entryPoint = main ()*)

end