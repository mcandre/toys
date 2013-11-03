#import <Foundation/Foundation.h>
#import "Fizzy.h"

@implementation Fizzy
+ (NSString*) fizzy: (NSInteger) n {
  BOOL div3 = (n % 3 == 0);
  BOOL div5 = (n % 5 == 0);

  if (div3 && div5) {
    return @"FizzBuzz";
  }
  else if (div3) {
    return @"Fizz";
  }
  else if (div5) {
    return @"Buzz";
  }
  else {
    return [NSString stringWithFormat:@"%ld", n];
  }
}

int main() {
  for (int i = 1; i < 101; i++) {
    NSLog(@"%@", [Fizzy fizzy:i]);
  }

  return 0;
}
@end
