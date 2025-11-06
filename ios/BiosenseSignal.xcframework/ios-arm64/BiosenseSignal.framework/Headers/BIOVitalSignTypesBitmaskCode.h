//
//  BIOVitalSignTypesBitmaskCode.h
//  BiosenseSignal
//
//  Created on 20/02/2022.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef int64_t BIOVitalSignTypeBitmaskCode NS_SWIFT_NAME(VitalSignTypeBitmaskCode);

NS_SWIFT_NAME(VitalSignTypesBitmaskCode)
@interface BIOVitalSignTypesBitmaskCode : NSObject

@property (class, nonatomic, readonly) BIOVitalSignTypeBitmaskCode none;
@property (class, nonatomic, readonly) BIOVitalSignTypeBitmaskCode pulseRate;
@property (class, nonatomic, readonly) BIOVitalSignTypeBitmaskCode respirationRate;
@property (class, nonatomic, readonly) BIOVitalSignTypeBitmaskCode oxygenSaturation;
@property (class, nonatomic, readonly) BIOVitalSignTypeBitmaskCode sdnn;
@property (class, nonatomic, readonly) BIOVitalSignTypeBitmaskCode stressLevel;
@property (class, nonatomic, readonly) BIOVitalSignTypeBitmaskCode rri;
@property (class, nonatomic, readonly) BIOVitalSignTypeBitmaskCode stressIndex;
@property (class, nonatomic, readonly) BIOVitalSignTypeBitmaskCode bloodPressure;
@property (class, nonatomic, readonly) BIOVitalSignTypeBitmaskCode meanRri;
@property (class, nonatomic, readonly) BIOVitalSignTypeBitmaskCode rmssd;
@property (class, nonatomic, readonly) BIOVitalSignTypeBitmaskCode sd1;
@property (class, nonatomic, readonly) BIOVitalSignTypeBitmaskCode sd2;
@property (class, nonatomic, readonly) BIOVitalSignTypeBitmaskCode prq;
@property (class, nonatomic, readonly) BIOVitalSignTypeBitmaskCode pnsIndex;
@property (class, nonatomic, readonly) BIOVitalSignTypeBitmaskCode pnsZone;
@property (class, nonatomic, readonly) BIOVitalSignTypeBitmaskCode snsIndex;
@property (class, nonatomic, readonly) BIOVitalSignTypeBitmaskCode snsZone;
@property (class, nonatomic, readonly) BIOVitalSignTypeBitmaskCode wellnessIndex;
@property (class, nonatomic, readonly) BIOVitalSignTypeBitmaskCode wellnessLevel;
@property (class, nonatomic, readonly) BIOVitalSignTypeBitmaskCode lfhf;
@property (class, nonatomic, readonly) BIOVitalSignTypeBitmaskCode hemoglobin;
@property (class, nonatomic, readonly) BIOVitalSignTypeBitmaskCode hemoglobinA1C;
@property (class, nonatomic, readonly) BIOVitalSignTypeBitmaskCode highHemoglobinA1CRisk;
@property (class, nonatomic, readonly) BIOVitalSignTypeBitmaskCode highBloodPressureRisk;
@property (class, nonatomic, readonly) BIOVitalSignTypeBitmaskCode ascvdRisk;
@property (class, nonatomic, readonly) BIOVitalSignTypeBitmaskCode normalizedStressIndex;
@property (class, nonatomic, readonly) BIOVitalSignTypeBitmaskCode heartAge;
@property (class, nonatomic, readonly) BIOVitalSignTypeBitmaskCode lowHemoglobinRisk;
@property (class, nonatomic, readonly) BIOVitalSignTypeBitmaskCode highTotalCholesterolRisk;
@property (class, nonatomic, readonly) BIOVitalSignTypeBitmaskCode highFastingGlucoseRisk;
@property (class, nonatomic, readonly) BIOVitalSignTypeBitmaskCode cardiacWorkload;
@property (class, nonatomic, readonly) BIOVitalSignTypeBitmaskCode ascvdRiskLevel;
@property (class, nonatomic, readonly) BIOVitalSignTypeBitmaskCode meanArterialPressure;
@property (class, nonatomic, readonly) BIOVitalSignTypeBitmaskCode pulsePressure;
@property (class, nonatomic, readonly) BIOVitalSignTypeBitmaskCode bodyTensionScore;

@end

NS_ASSUME_NONNULL_END
