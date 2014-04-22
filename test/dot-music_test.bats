load test_helper

@test "writes the current iTunes artist to .music" {
  run $dot_music

  cat $musicfile | grep "dot-music"
  [ $status -eq 0 ]
}
