#import "NSString+TIUtils.h"

@implementation NSString(NSString_TIUtils)

- (NSArray *)matchForPattern:(NSString*)pattern {
    return [self matchForPattern:pattern withOptions:0];
}

- (NSArray *)matchForPattern:(NSString*)pattern withOptions:(NSRegularExpressionOptions)options
{
    NSError *err;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:pattern options:options error:&err];
    if (err) {
        NSLog(@"Regex error for pattern (%@): %@", pattern, err);
    }
    NSArray *matches = [regex matchesInString:self options:0 range:NSMakeRange(0, self.length)];
    if(!matches.count) {
        return nil;
    }
    NSTextCheckingResult *firstMatch = matches[0];
    NSMutableArray *capturedGroups = [NSMutableArray arrayWithCapacity:firstMatch.numberOfRanges];
    
    for (NSUInteger i = 0; i < firstMatch.numberOfRanges; i++) {
        NSRange range = [firstMatch rangeAtIndex:i];
        if (range.location != NSNotFound) {
            capturedGroups[i] = [self substringWithRange:range];
        } else {
            capturedGroups[i] = @"";
        }
    }
    return capturedGroups;
}

- (NSString *)stringByTrimmingLeadingZeroes
{
    NSUInteger firstNonZero = 0;
    while (firstNonZero < self.length && [self characterAtIndex:firstNonZero] == '0') {
        firstNonZero++;
    }
    return [self substringFromIndex:firstNonZero];
}

@end
