#orly - generates a fake O'Riley book cover
#takes minimum 3 parameters
# param1 - title
# param2 - top text
# param3 - Author
# param4 - Image (optional, random chosen is omitted)
# param5 - color (optional, random chosen if omitted)
# param6 - Guide Text (optional, set to "The Definitive Guide" if omitted)

sub orly 
{
	if ( sizeof (_)<3)
	{
		print "orly Title TopText Author [image] [color] [guideText]";
		print "See https://dev.to/rly for image & color codes";
	}
	else 
	{
		var title = url_encode (_[0]);
		var top_text = url_encode (_[1]);
		var author = url_encode (_[2]);
		var image = ( rand %39)+1;
		var color = ( rand %16);
		var guide_text = url_encode ("The Definitive Guide");
		if ( sizeof (_)>=4)
		{
			image=_[3];
		}
		if ( sizeof (_)>=5)
		{
			color=_[4];
		}
		if ( sizeof (_)>=6)
		{
			guide_text=url_encode (_[5]);
		}
		var imgUrl = "https://orly-appstore.herokuapp.com/generate?title=".title."&top_text=".top_text."&author=".author."&image_code=".image."&theme=".color."&guide_text=".guide_text;
		print imgUrl;
		imgUrl=~"s/&/&amp;/";

		#for rich clients display the image directly
		print HTML "<img src='".imgUrl."' />";
		
		#for basic clients, just print the url
		print imgUrl;

	}
}
