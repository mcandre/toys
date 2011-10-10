// Compile:
//
// gcc -o hello -framework foundation hello.m

#import <Foundation/Foundation.h>

int main() {
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

	printf("%s", [@"Hello World!\n" UTF8String]);

	[pool drain];

	return 0;
}