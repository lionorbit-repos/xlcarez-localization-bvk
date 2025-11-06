//
//  BIOMatHelper.h
//  BiosenseSignal
//
//  Created on 17/05/2023.
//

#import <Foundation/Foundation.h>
#import <BiosenseSignal/BIOMatWrapper.h>


@class BIOPpgData;
@class BIOGyroscopeData;
@class BIOAccelerometerData;

NS_ASSUME_NONNULL_BEGIN

@interface BIOMatHelper : NSObject

+ (BIOMatWrapper *)getMatWrapperFromPpgDataValues:(NSArray<BIOPpgData *> *)ppgDataValues;
+ (BIOMatWrapper *)getMatWrapperFromGyroscopeDataValues:(NSArray<BIOGyroscopeData *> *)gyroscopeDataValues;
+ (BIOMatWrapper *)getMatWrapperFromAccelerometerDataValues:(NSArray<BIOAccelerometerData *> *)accelerometerDataValues;

@end

NS_ASSUME_NONNULL_END
