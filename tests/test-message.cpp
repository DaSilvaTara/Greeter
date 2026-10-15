#include "check.h"

#include <greeter/message.h>

int main()
{
    int errors = 0;
    errors += check_equal( greeter::get_message(), "Hello World!" );
    errors += check_equal( greeter::get_message( "Nya" ), "Hello Alice!" );
    return errors;
}
