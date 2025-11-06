//
//  BIOInternalVitalSign.h
//  BiosenseSignal
//
//  Created on 22/02/2023.
//

#import <BiosenseSignal/BIOVitalSignType.h>

#import <Foundation/Foundation.h>


@class BIOVitalSignConfidence;

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_NAME(InternalVitalSign)
@interface BIOInternalVitalSign : NSObject

@property (nonatomic) id value;
@property (nonatomic) BIOVitalSignType type;
@property (nonatomic, nullable) BIOVitalSignConfidence *confidence;

- (instancetype)init NS_UNAVAILABLE;
- (instancetype)new NS_UNAVAILABLE;

- (instancetype)initWithValue:(id)value
                         type:(BIOVitalSignType)type
                   confidence:(BIOVitalSignConfidence *_Nullable)confidence;

@end

NS_ASSUME_NONNULL_END
