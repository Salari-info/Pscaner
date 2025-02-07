#!/usr/bin/perl
use strict;
use warnings;
use IO::Socket;


my $red   = "\e[31m";  # red color
my $green = "\e[32m";  # green color
my $white = "\e[37m";  # white color


my $host = shift || '192.168.1.1';  # ip addres defult 192.168.1.1
my $start_port = shift || 1;       # start port defulf 1
my $end_port = shift || 1024; # end port, defult 1024

my $ascii_art = <<'END_ART';

                     ^75B###G7          
     :5G5!.        ~G&&&&&&&&&G         
:YGBB&&&&&#:      ?&&&&&&&&&&&&5        
P##&&&&&&&&#.   ~G&&&&&&&&&&&&&&G:      
   Y&&&&&&&&: J#&&&&&&&&&&&&&&&&&&7     
  :#&&&&&&&B:G&&&&&&&&&&&&&&&&&&&&&J    
  ?&&&&&&&&~5&&&&&&&&&&&&&&&&&&&&&&&5.  
  7&&&&&&&&B&&&&&&&&&&&&&&&&&&&&&&&&&#7 
  :#&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&5#&~   
   .P&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&#.Y&P
     ~G#&&&&&&&&&&&&&&&&&&&&&&G!&&&B J&?
       .775?~B&&&#PP#&&&&?B&&#. J&&#.#5 
             G&&&B :&&&&G Y&&5   P&&~^  
             Y&&&7 ?&&&&: ~&&P    5&7   
             ^&&G  #&&5:  :&&Y    ~&P   
              #&5  ~B&!   J&7     .&P   
              P&!    ^5PJ5#:       #7   
              PB       !&&#7      .&?   
             .&J     :?B&YB&!     ?&#.  
            .G&~     :^^:  ^.    .PBB:  
          .5#&B.                        
END_ART

print $ascii_art;
print "${white} Scanning $host from port $start_port to $end_port...\n\n";

for (my $port = $start_port; $port <= $end_port; $port++) {
    # create socket
    my $socket = IO::Socket::INET->new(
        PeerAddr => $host,
        PeerPort => $port,
        Proto    => 'tcp',
        Timeout  => 1,  # Waiting time for connection
    );

    if ($socket) {
        print " ${green}[+] Port $port is open.\n";
        close($socket);
    } else {
        print " ${red}[-] Port $port is closed.\n";
    }
}
