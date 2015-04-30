#!/usr/bin/perl

use strict;
use warnings;

use IO::Socket;

$|=1;

sub header() {
 print q (
  +---------------------------+
  |       Scanner - v0id      |
  |                           |
  |       Usando sockets      |
  +---------------------------+
  |       version 0.1         |
  +---------------------------+
 )
}

&header();

print " localhost : "; 
chomp (my $target=<STDIN>);
print "  start port: "; 
chomp (my $start_port=<STDIN>);
print "  end port  : "; 
chomp (my $end_port=<STDIN>);

my $port=0;

foreach($port=$start_port;$port<=$end_port;$port++){
 print "scanning $port now\n";
 my $socket = IO::Socket::INET->new(PeerAddr=>$target,PeerPort=>$port,Proto=>'tcp',Timeout=>1);
 if($socket){
  print "\r = port $port is open.\n"; 
 }
}
print "\nfinished scanning $target\n";
