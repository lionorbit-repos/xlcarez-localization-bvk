//
//  BIOSubjectMonitorTypesBitmaskCode.h
//  BiosenseSignal
//
//  Created on 11/02/2024.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef int64_t BIOSubjectMonitorTypeBitmaskCode NS_SWIFT_NAME(SubjectMonitorTypeBitmaskCode);

NS_SWIFT_NAME(SubjectMonitorTypesBitmaskCode)
@interface BIOSubjectMonitorTypesBitmaskCode : NSObject

@property (class, nonatomic, readonly) BIOSubjectMonitorTypeBitmaskCode none;
@property (class, nonatomic, readonly) BIOSubjectMonitorTypeBitmaskCode fallDetection;
@property (class, nonatomic, readonly) BIOSubjectMonitorTypeBitmaskCode activity;

@end

NS_ASSUME_NONNULL_END
