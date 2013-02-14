(*^^^^^^^^^^^^ГГГГГГГ^^^^^^^^^^^^^^^^^^^^^^^^^*)
(*^^^^^^^^^__город___^^^^^^^^^^^^^^^^^^^^^^^^^*)
(*^^^озеро^^_______^^^^^^^^^^^^^^^^^^глиняная *)
(*^^утопленников^^^^^^^^^^^^^^^^^^^^^^поляна^^*)
(*^^^..............^^^^^^^^чудакова^^^^^^^^^^^*)
(*^^^^^............^^^^^^^деревня^^^^^^^^^^^^^*)
(*^^^^................^^^^^^^^^^^^^^^^^^^^^^^^*)
(*^^^....................^^^^^^^^^^^^^^^^^^^^^*)
(*^^........................^^^^^^^^верхняя^^^*)
(*^^........................^^^^^^^^деревня^^^*)
(*^^^^^^^^^^выселки ........^^^^^^^^^^^^^^^^^^*)
(*^^^^^^^^^^^^^^^^^^......^^^деревня^^^^^^^^^^*)
(*^^^^^^^^^^^^^^^^хлебная^^^^^Молчуна^^^^^^^^^*)
(*^^^^^^^^^^^^^^^^^лужа^^^^^^^^^^^^^^^^^^^^^^^*)
(*^^^^^^^^^^^^^^^^^^.....^^^^^^^^^^^^^^^^^^^^^*)
(*^^^^^^^^тростники^^^^^^^^^^^^^^^муравейники *)
(*^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^*)
(**********************************************)
(*              условные обозначения          *)
(* ^ - лес                                    *)
(* Г - скалы                                  *)
(* . - болота                                 *)
(**********************************************)

structure Locations :> LOCATIONS = struct
(* локации *)
datatype location = 
		    Forest
		  | Swamp
		 
(* сообщения в локациях *)		 
fun locationMessage Forest = "Вы находитесь в Лесу"
  | locationMessage Swamp = "Вы находитесь в Болоте" 
  
(* направления движения *)
datatype direction = 
	North
	|South
	|West
	|East
	
(* текущая локация *)
val currentLocation = ref Forest		   

fun whereAmI () = locationMessage (!currentLocation)

(* извлечение из строки направления*)
fun directionFromString "север" = North
	|directionFromString "юг" = South
	|directionFromString "запад" = West
	|directionFromString s(*"восток"*) = East
	
(*(* структра локации*)
type room = { location : location,
              description : string,
              exits : location option array }*)
			  
(* получение названия локации*)
fun locationToString City = "City"

(* получение описания локации*)
fun locationToDesc City = "This is city"

(* получение описания смежных локаций (переходов)*)
(*
(* добавление смежных локаций*)
fun add_room (location, 
			(exit_north, exit_east, exit_south, exit_west)) =
    let val exit_list = exit_north::exit_east
                         ::exit_south::exit_west::nil
    in
      update (rooms,  
              { location = location, 
                description = locationToDesc location,
                exits = list-toarray exit_list } : room)
    end
	
(* количество комнат*)
fun numOfLocations = 2
(* хэш-массив, удобненько*)
val room_map = hash-new (string-hash, string-equals, numOfLocations)

(* инициализация локаций*)
fun rooms-initialize chapter =
  let val no_exits = (NONE, NONE, NONE, NONE)
      fun north_exit n = (SOME n, NONE, NONE, NONE)
      fun east_exit e = (NONE, SOME e, NONE, NONE)
      fun south_exit s = (NONE, NONE, SOME s, NONE)
      fun west_exit w = (NONE, NONE, NONE, SOME w)
      fun north_east_exits n e = (SOME n, SOME e, NONE, NONE)
      fun north_south_exits n s = (SOME n, NONE, SOME s, NONE)
      fun north_west_exits n w = (SOME n, NONE, NONE, SOME w)
      fun east_south_exits e s = (NONE, SOME e, SOME s, NONE)
      fun east_west_exits e w = (NONE, SOME e, NONE, SOME w)
      fun south_west_exits s w = (NONE, NONE, SOME s, SOME w)
  in 
    add_room (City, no_exits);
						(*SOME Lake
                        SOME Lake,
                        NONE,
                        SOME HistoryExhibitEntrance),*)
    hash-put (room_map, locationToString location, City)
end
*)
end