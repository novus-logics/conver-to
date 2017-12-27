//
//  NSObject+NewProperty.h
//  Novus LogicsAPI Example
//
//  Created by Novus Logics on 20/11/14.
//  Copyright © 2017 Holidaze Logics. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSObject (NewProperty)

-(void)setObject:(id)block forKey:(NSString *)key;
-(id)objectForKey:(NSString *)key;

-(void)setObject:(id)block forKeyPath:(NSString *)key;
-(id)objectForKeyPath:(NSString *)key;


-(void)addObject:(id)block forKey:(NSString *)key;



-(void)setInt:(int)integer forKey:(NSString *)key;
-(int)intForKey:(NSString *)key;

-(void)setInt:(int)integer forKeyPath:(NSString *)key;
-(id)intForKeyPath:(NSString *)key;


-(void)setInteger:(NSInteger)integer forKey:(NSString *)key;
-(NSInteger)integerForKey:(NSString *)key;

-(void)setInteger:(NSInteger)integer forKeyPath:(NSString *)key;
-(id)integerForKeyPath:(NSString *)key;


-(void)setFloat:(float)floatValue forKey:(NSString *)key;
-(float)floatForKey:(NSString *)key;

-(void)setFloat:(float)floatValue forKeyPath:(NSString *)key;
-(id)floatForKeyPath:(NSString *)key;



-(void)setDouble:(double)doubleValue forKey:(NSString *)key;
-(double)doubleForKey:(NSString *)key;

-(void)setDouble:(double)doubleValue forKeyPath:(NSString *)key;
-(id)doubleForKeyPath:(NSString *)key;


-(void)setBoolean:(BOOL)boolean forKey:(NSString *)key;
-(BOOL)booleanForKey:(NSString *)key;

-(void)setBoolean:(BOOL)boolean forKeyPath:(NSString *)key;
-(id)booleanForKeyPath:(NSString *)key;



-(id<UITextViewDelegate>)textViewDelegate;
-(id<UITextFieldDelegate>)textFieldDelegate;




-(void)performSelectorFromString:(NSString *)selector withInetger:(NSUInteger)object0;

-(void)performSelectorFromString:(NSString *)selector;
-(id)performSelectorFromStringWithReturnObject:(NSString *)selector;
-(BOOL)performSelectorFromStringWithReturnBoolean:(NSString *)selector;

-(void)performSelectorFromString:(NSString *)selector withObject:(id)object1;
-(id)performSelectorFromStringWithReturnObject:(NSString *)selector withObject:(id)object1;
-(BOOL)performSelectorFromStringWithReturnBoolean:(NSString *)selector withObject:(id)object1;

-(void)performSelectorFromString:(NSString *)selector withObject:(id)object1 withObject:(id)object2;
-(id)performSelectorFromStringWithReturnObject:(NSString *)selector withObject:(id)object1 withObject:(id)object2;
-(BOOL)performSelectorFromStringWithReturnBoolean:(NSString *)selector withObject:(id)object1 withObject:(id)object2;

-(void)performSelectorFromString:(NSString *)selector withObject:(id)object1 withObject:(id)object2 withObject:(id)object3;
-(id)performSelectorFromStringWithReturnObject:(NSString *)selector withObject:(id)object1 withObject:(id)object2 withObject:(id)object3;
-(BOOL)performSelectorFromStringWithReturnBoolean:(NSString *)selector withObject:(id)object1 withObject:(id)object2 withObject:(id)object3;

-(void)performSelectorFromString:(NSString *)selector withObject:(id)object1 withObject:(id)object2 withObject:(id)object3 withObject:(id)object4;
-(id)performSelectorFromStringWithReturnObject:(NSString *)selector withObject:(id)object1 withObject:(id)object2 withObject:(id)object3 withObject:(id)object4;
-(BOOL)performSelectorFromStringWithReturnBoolean:(NSString *)selector withObject:(id)object1 withObject:(id)object2 withObject:(id)object3 withObject:(id)object4;

-(void)performSelectorFromString:(NSString *)selector withObject:(id)object1 withObject:(id)object2 withObject:(id)object3 withObject:(id)object4 withObject:(id)object5;
-(id)performSelectorFromStringWithReturnObject:(NSString *)selector withObject:(id)object1 withObject:(id)object2 withObject:(id)object3 withObject:(id)object4 withObject:(id)object5;
-(BOOL)performSelectorFromStringWithReturnBoolean:(NSString *)selector withObject:(id)object1 withObject:(id)object2 withObject:(id)object3 withObject:(id)object4 withObject:(id)object5;


-(void)performSelectorFromString:(NSString *)selector withObject:(id)object1 withObject:(id)object2 withObject:(id)object3 withObject:(id)object4 withObject:(id)object5 withObject:(id)object6 withObject:(id)object7;
-(id)performSelectorFromStringWithReturnObject:(NSString *)selector withObject:(id)object1 withObject:(id)object2 withObject:(id)object3 withObject:(id)object4 withObject:(id)object5 withObject:(id)object6 withObject:(id)object7;
-(BOOL)performSelectorFromStringWithReturnBoolean:(NSString *)selector withObject:(id)object1 withObject:(id)object2 withObject:(id)object3 withObject:(id)object4 withObject:(id)object5 withObject:(id)object6 withObject:(id)object7;


-(void)performSelectorFromString:(NSString *)selector withObject:(id)object1 withObject:(id)object2 withObject:(id)object3 withObject:(id)object4 withObject:(id)object5 withObject:(id)object6 withObject:(id)object7 withObject:(id)object8 withObject:(id)object9;
-(id)performSelectorFromStringWithReturnObject:(NSString *)selector withObject:(id)object1 withObject:(id)object2 withObject:(id)object3 withObject:(id)object4 withObject:(id)object5 withObject:(id)object6 withObject:(id)object7 withObject:(id)object8 withObject:(id)object9;
-(BOOL)performSelectorFromStringWithReturnBoolean:(NSString *)selector withObject:(id)object1 withObject:(id)object2 withObject:(id)object3 withObject:(id)object4 withObject:(id)object5 withObject:(id)object6 withObject:(id)object7 withObject:(id)object8 withObject:(id)object9;


@end
