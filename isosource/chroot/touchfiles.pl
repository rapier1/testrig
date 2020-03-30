while (<>) {
  chomp $_; 
  $command = "touch $_/.ignoreme";
  print "$command\n";
  system($command);
}
