
#       Chop blubber off full version to make lean version

    use strict;
    use warnings;

    my $xhtml = 1;              # Quote JavaScript for XHTML ?

    my ($sbegin, $send);

    $sbegin = $xhtml ? '/* <![CDATA[ */' : '<!--';
    $send = $xhtml ? '/* ]]> */' : '// -->';

    while (my $l = <>) {

        #   Elide text which belongs exclusively to the FULL version

if (1) {
        if ($l =~ m/<!-- \+FULL -->/) {
            while (<>) {
                if (m/<!-- -FULL -->/) {
                    last;
                }
            }
            next;
        }
}

        #   Interpolate compressed script to replace browser include

        if ($l =~ m-<script type="text/javascript" src="([\w\-]+\.js)"></script>-) {
            print("<script type=\"text/javascript\" >\n$sbegin\n");
            open(IF, "<$1C") || die("Cannot open compressed script $1C");
            while (<IF>) {
                print;
            }
            close(IF);
            print("$send\n</script>\n");
            next;
        }

    #   Interpolate compressed CSS to replace browser include

        if ($l =~ m-<link rel="stylesheet" type="text/css" href="([\w\-]+\.css)" />-) {
            print("<style type=\"text/css\">\n");
            open(IF, "<$1C") || die("Cannot open compressed CSS $1C");
            while (<IF>) {
                print;
            }
            close(IF);
            print("</style>\n");
            next;
        }


        #   Drop blank lines and lines consisting only of comments

        if (($l =~ m/^\s*$/) || ($l =~ m/\s*<!--\s.*-->\s*$/)) {
            next;
        }

        #   Delete leading spaces (assumes no <pre> material, etc.)

        $l =~ s/^\s+//;

        print($l);
    }
