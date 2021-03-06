#import <Foundation/Foundation.h>

@interface NSString(NSString_TIUtils)
/**
 return an array of captured groups for the first match for `pattern` within the string, or nil if no match found
 */
- (NSArray *)matchForPattern:(NSString *)pattern;
- (NSArray *)matchForPattern:(NSString*)pattern withOptions:(NSRegularExpressionOptions)options;


- (NSString*)stringByTrimmingLeadingZeroes;

@end
