load test_helper

@test "writes the current iTunes artist to .music" {
  stub dot-music-itunes "echo Radiohead"
  run $dot_music

  cat $musicfile | grep "Radiohead"
  [ $status -eq 0 ]
}

@test "stores multiple artists" {
  stub dot-music-itunes "echo Radiohead"
  run $dot_music
  stub dot-music-itunes "echo The Beatles"
  run $dot_music

  cat $musicfile | line 1 | grep "Radiohead"
  cat $musicfile | line 2 | grep "The Beatles"
  [ $status -eq 0 ]
}

@test "creates multiple artists for partial matches" {
  stub dot-music-itunes "echo Radiohead"
  run $dot_music
  stub dot-music-itunes "echo Radiohead Coverband"
  run $dot_music

  cat $musicfile | line 1 | grep "Radiohead"
  cat $musicfile | line 2 | grep "Radiohead Coverband"
  [ $status -eq 0 ]
}

@test "does not create duplicates" {
  stub dot-music-itunes "echo Radiohead"
  run $dot_music
  run $dot_music

  cat $musicfile | wc -l | grep "1"
  [ $status -eq 0 ]
}

@test "does not create .music with no artist" {
  stub dot-music-itunes "echo"
  run $dot_music

  [ ! -f $musicfile ]
  [ $status -eq 0 ]
}

@test "does not append .music with no artist" {
  touch $musicfile
  stub dot-music-itunes "echo"
  run $dot_music

  cat $musicfile | wc -l | grep "0"
  [ $status -eq 0 ]
}
