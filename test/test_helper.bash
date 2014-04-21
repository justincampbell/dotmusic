setup() {
  DM_TMPDIR=$BATS_TMPDIR/dot-music

  rm -rf $DM_TMPDIR
  mkdir -p $DM_TMPDIR

  dot_music=bin/dot-music
}

teardown() {
  echo $status: $output
}
