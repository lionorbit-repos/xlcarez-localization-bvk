//
//  BIOInternalCoreProcessResult.h
//  BiosenseSignal
//
//  Created on 23/02/2023.
//

#import <Foundation/Foundation.h>

@class BIORoiData;
@class BIOFaceAngles;


NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_NAME(InternalCoreProcessResult)
@interface BIOInternalCoreProcessResult : NSObject

@property (nonatomic) CGRect roi;
@property (nonatomic) NSInteger imageValidity;
@property (nonatomic, nullable) BIOFaceAngles *angles;
@property (nonatomic, nullable) NSNumber *faceDistance;

- (instancetype)init NS_UNAVAILABLE;
- (instancetype)new NS_UNAVAILABLE;

- (instancetype)initWithROI:(CGRect)roi
               imageVailidy:(NSInteger)imageValidity
                 faceAngles:(BIOFaceAngles *_Nullable)angles
               faceDistance:(NSNumber *_Nullable)faceDistance;

@end

NS_ASSUME_NONNULL_END
