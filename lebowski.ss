#lebowski - generate a random lebowski quote
# this script takes no parameters


sub lebowski
{
    var lines = get ("https://lebowski.me/api/quotes/random")->"quote"->"lines";
    while ( sizeof (lines)>0)
    {
	#take the first element off the result array
        var line = shift lines;

	#plain text output
        print line->"character"->"name".": ".line->"text";

	#rich text puts caracter name in bold
	#be sure to html_encode text in xhtml to avoid making
	#xml violations
        print HTML "<b>".html_encode (line->"character"->"name").":</b> ".html_encode (line->"text");
    }
}

# vim: set filetype=perl :
