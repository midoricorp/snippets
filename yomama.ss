#prints a yomama joke
# no parameters

sub yomama 
{
	print get ("http://api.yomomma.info/")->"joke";
}

# vim: set filetype=perl :
