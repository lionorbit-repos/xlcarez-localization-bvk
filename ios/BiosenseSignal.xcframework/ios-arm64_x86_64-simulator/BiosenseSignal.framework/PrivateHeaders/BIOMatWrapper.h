//
//  BIOMatWrapper.h
//  BiosenseSignal
//
//  Created on 09/01/2023.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


#ifndef ANY_IOS_SIMULATOR

NS_ASSUME_NONNULL_BEGIN

@interface BIOMatWrapper : NSObject

@property (nonatomic, readonly) NSObject *matObj;

- (instancetype)init NS_UNAVAILABLE;
- (instancetype)new NS_UNAVAILABLE;
- (instancetype)initWithMat:(NSObject *)matObj;

@end

NS_ASSUME_NONNULL_END

#else

@interface BIOMatWrapper : NSObject

@end

#endif
