//
//  BIOErrorFactory.h
//  BiosenseSignal
//
//  Created on 18/01/2023.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BIOErrorFactory : NSObject

+ (NSError *_Nonnull)errorForCode:(NSInteger)code;

+ (NSError *_Nonnull)errorForCode:(NSInteger)code
                   customUserInfo:(NSDictionary *_Nullable)customUserInfo
                  underlyingError:(NSError *_Nullable)underlyingError;

@end

NS_ASSUME_NONNULL_END
