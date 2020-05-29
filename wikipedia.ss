#This command retrieves the Wikipedia summary of the passed word
#Eg: !wikipedia John Doe

sub wikipedia
{
    #Wikipedia uses _ between words, so we merge the parameters that way
    var query = join ("_",_);
    var def = get ("https://en.wikipedia.org/api/rest_v1/page/summary/".url_encode (query));
    print def->"extract";
}
