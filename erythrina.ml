let rec read_lines lines =
  try read_lines (read_line () :: lines)
      with End_of_file -> lines

let lines = read_lines []

let matcher input matched line =
  if input = line then
    line :: matched
  else
    matched

let pat = "hello"

let matched = List.fold_left (matcher pat) [] lines

let matched_string = String.concat "\n" matched

;; print_string matched_string
