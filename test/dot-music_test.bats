load test_helper

@test "it works" {
  run $dot_music

  [ $output == "dot-music" ]
  [ $status -eq 0 ]
}
