
INSTDIR = /tmp/javascrypt

PAGES = index.html javascrypt.html jscrypt.html pass_phrase.html stego.html \
	distribution.html example.html log.html aesprng_test.html javascrypt.css

#   The following JavaScript code is used by the javascrypt.html
#   page and, compressed into .jsC files, is embedded into the
#   "lean" jscrypt.html page.  Compressed versions of these
#   programs must be maintained in synchronism with the original
#   files.
JSCRYPT_SCRIPTS = aes.js armour.js entropy.js jscrypt.js \
	lecuyer.js md5.js utf-8.js externalLinks.js

#  The additional JavaScript files named below are not included
#  in jscrypt.html and compressed versions of them need not be
#  maintained.
SCRIPTS = $(JSCRYPT_SCRIPTS) stegodict.js wordtab.js sha256.js aesprng.js

ARCHIVE = $(PAGES) $(SCRIPTS)

webdist:
	tar cfv $(INSTDIR)_dist.tar $(ARCHIVE)

archive: jscrypt.html
	rm -f javascrypt.zip
	zip javascrypt.zip $(ARCHIVE)

jscrypt.html:  javascrypt.html TOOLS/flense.pl $(JSCRYPT_SCRIPTS:%.js=%.jsC)
	perl TOOLS/flense.pl <javascrypt.html >jscrypt.html

.js.jsC:
	@echo Please remake $*.jsC from $*.js using TOOLS/jcrunch.html ; exit 1

.SUFFIXES: .js .jsC
