/**
 ** This command randomly picks one word from all words passed as arguments when calling the !pick command
 ** Eg: !pick 1 2 3
 ** Tags: [arguments, print, random]
 **/


!script sub pick
{
    print ​_[ rand %(sizeof _​)];
}
