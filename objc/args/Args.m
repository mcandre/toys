#import <Foundation/Foundation.h>

int main(const int argc, const char **argv) {
  for (int i = 0; i < argc; i++) {
    NSLog(@"%@", [NSString stringWithCString:argv[i] encoding:
                  NSUTF8StringEncoding]);
  }

  return 0;
}
