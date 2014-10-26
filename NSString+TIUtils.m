#import "NSString+TIUtils.h"

@implementation NSString(NSString_TIUtils)

- (NSArray *)matchForPattern:(NSString*)pattern
{
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:pattern options:0 error:NULL];
    NSArray *matches = [regex matchesInString:self options:0 range:NSMakeRange(0, self.length)];
    if(!matches.count) {
        return nil;
    }
    NSTextCheckingResult *firstMatch = matches[0];
    NSMutableArray *capturedGroups = [NSMutableArray arrayWithCapacity:firstMatch.numberOfRanges];
    
    for(int i = 0; i < firstMatch.numberOfRanges; i++) {
        capturedGroups[i] = [self substringWithRange:[firstMatch rangeAtIndex:i]];
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
