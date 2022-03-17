#! /usr/bin/perl

    open(OF, ">/tmp/hexdat.bin");
    while ($l = <>) {
        chomp($l);

        while ($l =~ s/([0-9a-zA-Z]{2})//) {
            printf(OF "%c", hex($1));
        }
    }
    close(OF);
