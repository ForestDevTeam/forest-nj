(*^^^^^^^^^^^^�������^^^^^^^^^^^^^^^^^^^^^^^^^*)
(*^^^^^^^^^__��த___^^^^^^^^^^^^^^^^^^^^^^^^^*)
(*^^^����^^_______^^^^^^^^^^^^^^^^^^����ﭠ� *)
(*^^�⮯��������^^^^^^^^^^^^^^^^^^^^^^���ﭠ^^*)
(*^^^..............^^^^^^^^�㤠����^^^^^^^^^^^*)
(*^^^^^............^^^^^^^��ॢ��^^^^^^^^^^^^^*)
(*^^^^................^^^^^^^^^^^^^^^^^^^^^^^^*)
(*^^^....................^^^^^^^^^^^^^^^^^^^^^*)
(*^^........................^^^^^^^^������^^^*)
(*^^........................^^^^^^^^��ॢ��^^^*)
(*^^^^^^^^^^��ᥫ�� ........^^^^^^^^^^^^^^^^^^*)
(*^^^^^^^^^^^^^^^^^^......^^^��ॢ��^^^^^^^^^^*)
(*^^^^^^^^^^^^^^^^嫥����^^^^^����㭠^^^^^^^^^*)
(*^^^^^^^^^^^^^^^^^�㦠^^^^^^^^^^^^^^^^^^^^^^^*)
(*^^^^^^^^^^^^^^^^^^.....^^^^^^^^^^^^^^^^^^^^^*)
(*^^^^^^^^���⭨��^^^^^^^^^^^^^^^��ࠢ������ *)
(*^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^*)
(**********************************************)
(*              �᫮��� ������祭��          *)
(* ^ - ���                                    *)
(* � - ᪠��                                  *)
(* . - �����                                 *)
(**********************************************)

structure Locations :> LOCATIONS = struct
(* ����樨 *)
datatype location = 
		    Forest
		  | Swamp
		 
(* ᮮ�饭�� � ������� *)		 
fun locationMessage Forest = "�� ��室���� � ����"
  | locationMessage Swamp = "�� ��室���� � �����" 
  
(* ���ࠢ����� �������� *)
datatype direction = 
	North
	|South
	|West
	|East
	
(* ⥪��� ������ *)
val currentLocation = ref Forest		   

fun whereAmI () = locationMessage (!currentLocation)

(* �����祭�� �� ��ப� ���ࠢ�����*)
fun directionFromString "ᥢ��" = North
	|directionFromString "�" = South
	|directionFromString "�����" = West
	|directionFromString s(*"���⮪"*) = East
	
(*(* ������ ����樨*)
type room = { location : location,
              description : string,
              exits : location option array }*)
			  
(* ����祭�� �������� ����樨*)
fun locationToString City = "City"

(* ����祭�� ���ᠭ�� ����樨*)
fun locationToDesc City = "This is city"

(* ����祭�� ���ᠭ�� ᬥ���� ����権 (���室��)*)
(*
(* ���������� ᬥ���� ����権*)
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
	
(* ������⢮ ������*)
fun numOfLocations = 2
(* ���-���ᨢ, 㤮����쪮*)
val room_map = hash-new (string-hash, string-equals, numOfLocations)

(* ���樠������ ����権*)
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