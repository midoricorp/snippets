#trump_insult - generates a random trump quote or insult
# parameters - if given, name of person to insult
#              random trump quote given otherwise


sub trump_insult
{
    if (sizeof (_)==0)
    {
	# no parameters passed get a random quote
        print get ("https://api.whatdoestrumpthink.com/api/v1/quotes/random")->"message";
    }
    else
    {
	# name specified pass it
        var person = url_encode (join (" ",_));
        print get ("https://api.whatdoestrumpthink.com/api/v1/quotes/personalized?q=".person)->"message";
    }
}
