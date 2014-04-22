load test_helper

@test "writes the current iTunes artist to .music" {
  stub dot-music-itunes "echo Radiohead"
  run $dot_music

  cat $musicfile | grep "Radiohead"
  [ $status -eq 0 ]
}
