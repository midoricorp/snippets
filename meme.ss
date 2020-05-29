#meme generate a meme from imgflip
#requires 3 parameters
# param1: meme name (if popular) or meme id
# param2: top text
# param3: bottom text
# paramX: some memes have more than 2 text boxes, add the extra parameters as extra values
#
# Note: this requires getting an api key from imgflip, don't forget to get one!

sub meme 
{
	var api_username="setme";  #please get your own API key and set it HERE
	var api_password="setme";
	if ( sizeof (_)>2)
	{
		var params = _."";
		var template_id = 0;
		var type = shift params;
		if (type=~"/[0-9]+/")
		{
			#first parameter is already a number
			template_id=type;
		}
		else 
		{
			#not a number given, try to find the id of the meme
			var memes = get ("https://api.imgflip.com/get_memes")->"data"->"memes";
			while ( sizeof (memes)>0&&template_id==0)
			{
				var memeItm = shift (memes);
				if (memeItm->"name"=~("/".type."/i"))
				{
					template_id=memeItm->"id";
				}
			}
		}
		var map = "{}";
		map->"username"=api_username;
		map->"password"=api_password;
		var boxes = "[]";
		while ( sizeof (params)>0)
		{
			var box = "{}";
			box->"text"=shift (params);
			push (boxes,box);
		}
		map->"boxes"=boxes;
		map->"template_id"=template_id;
		if (template_id!=0)
		{
			var result = post ("https://api.imgflip.com/caption_image",map);
			if (result->"success")
			{
				print result->"data"->"url";
				print HTML "<img src='".result->"data"->"url"."'/>";
			}
			else 
			{
				print result->"error_message";
			}
		}
		else 
		{
			print "No meme of type ".type." found!";
			print "Goto: https://api.imgflip.com/popular_meme_ids for meme names";
		}
	}
	else 
	{
		print "meme: type text1 text2 [text3]+";
	}
}
