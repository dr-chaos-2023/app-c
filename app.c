#include <stdio.h>
#include <assert.h>
#include "./libs/tests/utils/time/rtc_test.h"
#include "./libs/tests/utils/time/datetime_test.h"

int main()
{
   test_Platform_GetSystemTime();
   runAllTests();
   printf("All tests have passed");
   return 0;
}