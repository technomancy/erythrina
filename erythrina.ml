let rec read_lines lines =
  try read_lines (read_line () :: lines)
  with End_of_file -> lines

let lines = read_lines []

let lines_matching pattern matched line =
  try let _ = Str.search_forward pattern line 0 in 
      line :: matched
    with Not_found -> matched

let escape = function
  | ' ' -> ".*"
  | c -> Char.escaped c

let pattern input =
  Str.regexp (String.concat "" (List.map escape input))

let matched input lines =
  List.fold_left (lines_matching (pattern input)) [] lines

let rec draw_matches matches =
  Graphics.open_graph " 1440x15";
  Graphics.set_window_title "erythrina";
  Graphics.draw_string (String.concat " | " matches)

let finish input lines =
  Graphics.close_graph ();
  match matched input lines with
    | f :: _ -> print_string f
    | [] -> ()

let butlast input =
  match List.rev input with
    | [] -> []
    | _ :: rest -> List.rev rest

let rec main input =
  draw_matches (matched input lines);
  match Graphics.read_key ()  with
    | (* enter *) '\r' -> finish input lines
    | (* escape *) '\027' -> Graphics.close_graph ()
    | (* backspace *) '\b' -> main (butlast input)
    | (* any other *) c -> main (List.append input [c])

let _ = main []
