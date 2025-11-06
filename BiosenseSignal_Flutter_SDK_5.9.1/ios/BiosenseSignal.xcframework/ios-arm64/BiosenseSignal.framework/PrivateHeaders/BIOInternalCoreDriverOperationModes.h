//
//  BIOInternalCoreDriverOperationModes.h
//  BiosenseSignal
//
//  Created on 23/02/2023.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef int BIOInternalCoreDriverOperationMode NS_SWIFT_NAME(InternalCoreDriverOperationMode);

NS_SWIFT_NAME(InternalCoreDriverOperationModes)
@interface BIOInternalCoreDriverOperationModes : NSObject

@property (class, nonatomic, readonly) BIOInternalCoreDriverOperationMode none;
@property (class, nonatomic, readonly) BIOInternalCoreDriverOperationMode measure;
@property (class, nonatomic, readonly) BIOInternalCoreDriverOperationMode signalLog;
@property (class, nonatomic, readonly) BIOInternalCoreDriverOperationMode recorder;
@property (class, nonatomic, readonly) BIOInternalCoreDriverOperationMode performance;
@property (class, nonatomic, readonly) BIOInternalCoreDriverOperationMode rgbTest;
@property (class, nonatomic, readonly) BIOInternalCoreDriverOperationMode videoTest;
@property (class, nonatomic, readonly) BIOInternalCoreDriverOperationMode objectDetectionLog;
@property (class, nonatomic, readonly) BIOInternalCoreDriverOperationMode vitalSignsSignalLog;
@property (class, nonatomic, readonly) BIOInternalCoreDriverOperationMode reportLog;
@property (class, nonatomic, readonly) BIOInternalCoreDriverOperationMode cameraMetadataLog;

@end

NS_ASSUME_NONNULL_END
