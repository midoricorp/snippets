#pirate - turns what ever you pass it into pirate speak

sub pirate 
{
	# turn the parametrs passed back into a secntence
	var msg = join (" ",_);
	var url = "http://pirate.monkeyness.com/cgi-bin/translator.pl?english=".url_encode (msg); #always url encode strings when building a url!
	print get (url);
}
