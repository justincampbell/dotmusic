load test_helper

@test "writes the current iTunes artist to .music" {
  stub dotmusic-itunes "echo Radiohead"
  run $dotmusic

  cat $musicfile | grep "Radiohead"
  [ $status -eq 0 ]
}

@test "stores multiple artists" {
  stub dotmusic-itunes "echo Radiohead"
  run $dotmusic
  stub dotmusic-itunes "echo The Beatles"
  run $dotmusic

  cat $musicfile | line 1 | grep "Radiohead"
  cat $musicfile | line 2 | grep "The Beatles"
  [ $status -eq 0 ]
}

@test "creates multiple artists for partial matches" {
  stub dotmusic-itunes "echo Radiohead Coverband"
  run $dotmusic
  stub dotmusic-itunes "echo Radiohead"
  run $dotmusic

  cat $musicfile | line 1 | grep -x "Radiohead Coverband"
  cat $musicfile | line 2 | grep -x "Radiohead"
  [ $status -eq 0 ]
}

@test "ignores case" {
  stub dotmusic-itunes "echo Radiohead"
  run $dotmusic
  stub dotmusic-itunes "echo radiohead"
  run $dotmusic

  cat $musicfile | line 1 | grep -x "Radiohead"
  cat $musicfile | wc -l | grep "1"
  [ $status -eq 0 ]
}


@test "does not create duplicates" {
  stub dotmusic-itunes "echo Radiohead"
  run $dotmusic
  run $dotmusic

  cat $musicfile | wc -l | grep "1"
  [ $status -eq 0 ]
}

@test "does not create .music with no artist" {
  stub dotmusic-itunes "echo"
  run $dotmusic

  [ ! -f $musicfile ]
  [ $status -eq 0 ]
}

@test "does not append .music with no artist" {
  touch $musicfile
  stub dotmusic-itunes "echo"
  run $dotmusic

  cat $musicfile | wc -l | grep "0"
  [ $status -eq 0 ]
}

@test "is silent" {
  echo "Radiohead" >> $musicfile
  echo "The Beatles" >> $musicfile
  stub dotmusic-itunes "echo The Beatles"
  run $dotmusic

  [ "$output" = "" ]
  [ $status -eq 0 ]
}
