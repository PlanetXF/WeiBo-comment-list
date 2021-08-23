//
//  CZWeibo.m
//  002微博评论
//
//  Created by 谢飞 on 2021/8/19.
//

#import "CZWeibo.h"

@implementation CZWeibo

- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self == [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+ (instancetype)weiboWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

@end
