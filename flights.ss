sub flights
{
   var f = get ("https://rss2json.com/api.json?rss_url=https%3A%2F%2Fwww.secretflying.com%2Ffeed%2F")->"items";
   var i = 0;
   #check how many parameters have been passed
   var flength = sizeof (f);
   if (sizeof _==0){
	   #no parameters passed
           print HTML "<span style='color: #FF1C1C '>You can filter the results by categories by adding parameters, eg: !flights Central America</span><br />";
           print HTML "<span style='color: #FF1C1C '>Example categories include: 1 Stop, Non-Stop, Asia, Europe, Depart USA, Central America, North America, South America</span><br />";

         
	   #also provide a plain text output for endpoints that don't uspport rich formatting
           print TEXT "You can filter the results by categories by adding parameters, eg: !flights Central America";
           print TEXT "Example categories include: 1 Stop, Non-Stop, Asia, Europe, Depart USA, Central America, North America, South America";

           while (i<flength)
           {
               print HTML "<a href='".f[i]->"link"."'>".f[i]->"title"."</a>-- ".f[i]->"pubDate";
               print HTML "<br/>";
               print TEXT f[i]->"title"." -- ".f[i]->"pubDate";
               print TEXT f[i]->"link";
               i++;
           }
	   #exit after giving the output
	   return;
   }

   var query = join (" ",_); #take the parameters and turn it into a single string space delimited
   while(sizeof(f) >0) {
      var item = shift(f);
      var categories = item->"categories";
      while(sizeof(categories) > 0) {
          var category = shift(categories);
          if(category =~ ("/" . query . "/i")) {
		 print item->"title";
		 print HTML "<a href='".item->"link"."'>".item->"title"."</a>-- ".item->"pubDate";
		 print HTML "<br/>";
		 print TEXT item->"title"." -- ".item->"pubDate";
		 print TEXT item->"link";
		 break;
          }
      }
   }
}
