setup() {
  DM_TMPDIR=$BATS_TMPDIR/dot-music
  musicfile=$DM_TMPDIR/.music
  dot_music=$PWD/bin/dot-music

  rm -rf $DM_TMPDIR
  mkdir -p $DM_TMPDIR
  cd $DM_TMPDIR
}

teardown() {
  echo $status: $output
}
