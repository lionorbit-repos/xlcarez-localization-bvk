//
//  BIOKeychain.h
//  BiosenseSignal
//
//  Created on 14/04/2020.
//

@import Foundation;

NS_ASSUME_NONNULL_BEGIN

@interface BIOKeychain : NSObject

/*!
 @abstract Saves the object to the Keychain.
 @param object The object to save. Must be an object that could be archived with NSKeyedArchiver.
 @param key The key identifying the object to save.
 @return @p YES if saved successfully, @p NO otherwise.
 */
+ (BOOL)saveObject:(id)object forKey:(NSString *)key;

/*!
 @abstract Loads the string object with specified @p key from the Keychain.
 @param key The key identifying the string object to load.
 @return The sting object identified by @p key or nil if it doesn't exist.
 */
+ (nullable NSString *)loadObjectForKey:(NSString *)key;

/*!
 @abstract Loads the object with specified @p key from the Keychain.
 @param key The key identifying the object to load.
 @param cls The class of the object to load.
 @return The object identified by @p key or nil if it doesn't exist.
 */
+ (nullable id)loadObjectForKey:(NSString *)key unarchivedObjectOfClass:(Class)cls;

/*!
 @abstract Deletes the object with specified @p key from the Keychain.
 @param key The key identifying the object to delete.
 @return @p YES if deletion was successful, @p NO if the object was not found or some other error ocurred.
 */
+ (BOOL)deleteObjectForKey:(NSString *)key;

@end

NS_ASSUME_NONNULL_END
