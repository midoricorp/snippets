#If one parameter is present, finds a pony face that is taged with the first parameter
#If no parameter is present

sub ponyface 
{
	if ( sizeof _>0)
	{
		var faces = get ("https://ponyfaces.hpcodecraft.me/api.json/tag:".url_encode (_[0]))->"faces";
		if ( sizeof faces>0)
		{
			var index =  rand %( sizeof faces);
			#print the plain text version
			print "https:".faces[index]->"thumbnail".".jpeg";
			
			#print the XHTML version
			print HTML "<a href='https:".faces[index]->"image".".jpeg"."'>";
			print HTML "<img src='https:".faces[index]->"thumbnail".".jpeg"."'/>";
			print HTML "</a>";
		}
		 else 
		{
			print "No face available for "._[0];
		}
	}
	else 
	{
		var choice = (rand %162)+1;
		
		#print the plaintext version
		print "https://ponyfaces.hpcodecraft.me/".choice."/thumb.jpeg";

		#print the xhtml version
		print HTML "<a href='https://ponyfaces.hpcodecraft.me/".choice."/full.jpeg"."'>";
		print HTML "<img src='https://ponyfaces.hpcodecraft.me/".choice."/thumb.jpeg"."'/>";
		print HTML "</a>";
	}
}

# vim: set filetype=perl :
