#xckd - displays an XKCD commic
# if no parametrs are passed shows the current one
# if paramter of "random" is passed, a random commic is shown
# if parameter of "curent" is passed the current commic is shown

sub xkcd
{
    if (sizeof(_) == 1)
    {
        var comic;
        var action = _[0];
        if (action=~"current")
        {
            comic=get ("https://xkcd.com/info.0.json");
            print comic->"img";
            print HTML "<img src='".comic->"img"."'/>";
        }
        else if (action=~"random")
        {
	    #get the number of the current comic to see how many
	    #comics are available to choose from
	    var total = get("https://xkcd.com/info.0.json")->"num";
            var number =  rand %(total);
            comic=get ("https://xkcd.com/".number."/info.0.json");
            print comic->"img";
            print HTML "<img src='".comic->"img"."'/>";
        }
        else
        {
            print "This extension accepts the following parameters: 'current', 'random', or nothing.";
        }
    }
    else if (sizeof(_) == 0)
    {
        var comic;
        comic=get ("https://xkcd.com/info.0.json");
        print comic->"img";
        print HTML "<img src='".comic->"img"."'/>";
    }
}
# vim: set filetype=perl :
