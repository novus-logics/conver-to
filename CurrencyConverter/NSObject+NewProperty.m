//
//  NSObject+NewProperty.m
//  Novus LogicsAPI Example
//
//  Created by Novus Logics on 20/11/14.
//  Copyright © 2017 Holidaze Logics. All rights reserved.
//



// Update on 64 bit crash
//
//id (*response)(id, SEL, id) = (id (*)(id, SEL, id)) objc_msgSend;
//response(self, NSSelectorFromString(selector), object1);
////    object = objc_msgSend(self, NSSelectorFromString(selector), object1);



#import "NSObject+NewProperty.h"
#import <objc/message.h>
#import <objc/runtime.h>

//#import "UIApplication+Extension.h"

@implementation NSObject (NewProperty)

// Defination of some fucntions Used in AFNetworking Extension

-(void)setObject:(id)block forKey:(NSString *)key
{
    objc_setAssociatedObject(self, (__bridge const void *)(key), block, OBJC_ASSOCIATION_RETAIN);
}

-(id)objectForKey:(NSString *)key
{
    return objc_getAssociatedObject(self, (__bridge const void *)(key));
}

-(void)setObject:(id)block forKeyPath:(NSString *)key
{
    NSArray *array = (NSArray *)self;
    
    for (int i=0; i<[array count]; i++)
    {
        objc_setAssociatedObject([array objectAtIndex:i], (__bridge const void *)(key), block, OBJC_ASSOCIATION_RETAIN);
    }
}

-(id)objectForKeyPath:(NSString *)key
{
    NSMutableArray *arrObjects = [[NSMutableArray alloc] init];
    
    NSArray *array = (NSArray *)self;
    
    for (int i=0; i<[array count]; i++)
    {
        [arrObjects addObject:objc_getAssociatedObject([array objectAtIndex:i], (__bridge const void *)(key))];
    }
    
    return arrObjects;
}



-(void)addObject:(id)block forKey:(NSString *)key
{
    NSArray *array = [(NSArray *)self objectForKey:key];

    if (!array)
    {
        [self setObject:[NSArray arrayWithObject:block] forKey:key];
    }
    else
    {
        NSMutableArray *arrayObjects = [[NSMutableArray alloc] initWithArray:array];
        [arrayObjects addObject:block];
        [self setObject:arrayObjects forKey:key];
    }
}






-(void)setInt:(int)integer forKey:(NSString *)key
{
    [self setObject:[NSNumber numberWithInt:integer] forKey:key];
}

-(int)intForKey:(NSString *)key
{
    return [[self objectForKey:key] intValue];
}

-(void)setInt:(int)integer forKeyPath:(NSString *)key
{
    [self setObject:[NSNumber numberWithInt:integer] forKeyPath:key];
}

-(id)intForKeyPath:(NSString *)key
{
    return [self objectForKeyPath:key];
}



-(void)setInteger:(NSInteger)integer forKey:(NSString *)key
{
    [self setObject:[NSNumber numberWithInteger:integer] forKey:key];
}

-(NSInteger)integerForKey:(NSString *)key
{
    return [[self objectForKey:key] integerValue];
}

-(void)setInteger:(NSInteger)integer forKeyPath:(NSString *)key
{
    [self setObject:[NSNumber numberWithInteger:integer] forKeyPath:key];
}

-(id)integerForKeyPath:(NSString *)key
{
    return [self objectForKeyPath:key];
}




-(void)setFloat:(float)floatValue forKey:(NSString *)key
{
    [self setObject:[NSNumber numberWithFloat:floatValue] forKey:key];
}

-(float)floatForKey:(NSString *)key
{
    return [[self objectForKey:key] floatValue];
}

-(void)setFloat:(float)floatValue forKeyPath:(NSString *)key
{
    [self setObject:[NSNumber numberWithFloat:floatValue] forKeyPath:key];
}

-(id)floatForKeyPath:(NSString *)key
{
    return [self objectForKeyPath:key];
}



-(void)setDouble:(double)doubleValue forKey:(NSString *)key
{
    [self setObject:[NSNumber numberWithDouble:doubleValue] forKey:key];
}

-(double)doubleForKey:(NSString *)key
{
    return [[self objectForKey:key] doubleValue];
}

-(void)setDouble:(double)doubleValue forKeyPath:(NSString *)key
{
    [self setObject:[NSNumber numberWithDouble:doubleValue] forKeyPath:key];
}

-(id)doubleForKeyPath:(NSString *)key
{
    return [self objectForKeyPath:key];
}



-(void)setBoolean:(BOOL)boolean forKey:(NSString *)key
{
    [self setObject:[NSNumber numberWithBool:boolean] forKey:key];
}

-(BOOL)booleanForKey:(NSString *)key
{
    return [[self objectForKey:key] boolValue];
}

-(void)setBoolean:(BOOL)boolean forKeyPath:(NSString *)key
{
    [self setObject:[NSNumber numberWithBool:boolean] forKeyPath:key];
}

-(id)booleanForKeyPath:(NSString *)key
{
    return [self objectForKeyPath:key];
}


#pragma mark - Delegate Objects

-(id<UITextViewDelegate>)textViewDelegate
{
    return self;
}

-(id<UITextFieldDelegate>)textFieldDelegate
{
    return self;
}



#pragma mark - performSelector method

-(void)performSelectorFromString:(NSString *)selector
{
    void (*msgSend)(id, SEL) = (void (*)(id, SEL)) objc_msgSend;
    msgSend(self, NSSelectorFromString(selector));
}

-(id)performSelectorFromStringWithReturnObject:(NSString *)selector
{
    id object;

    id (*msgSend)(id, SEL) = (id (*)(id, SEL)) objc_msgSend;
    object = msgSend(self, NSSelectorFromString(selector));
    
    return object;
}

-(BOOL)performSelectorFromStringWithReturnBoolean:(NSString *)selector
{
    BOOL object;

    BOOL (*msgSend)(id, SEL) = (BOOL (*)(id, SEL)) objc_msgSend;
    object = msgSend(self, NSSelectorFromString(selector));
    
    return object;
}




-(void)performSelectorFromString:(NSString *)selector withInetger:(NSUInteger)object0
{
    void (*msgSend)(id, SEL, NSUInteger) = (void (*)(id, SEL, NSUInteger)) objc_msgSend;
    msgSend(self, NSSelectorFromString(selector), object0);
}

-(void)performSelectorFromString:(NSString *)selector withObject:(id)object1
{
    void (*msgSend)(id, SEL, id) = (void (*)(id, SEL, id)) objc_msgSend;
    msgSend(self, NSSelectorFromString(selector), object1);
}

-(id)performSelectorFromStringWithReturnObject:(NSString *)selector withObject:(id)object1
{
    id object;
    
    id (*msgSend)(id, SEL, id) = (id (*)(id, SEL, id)) objc_msgSend;
    object = msgSend(self, NSSelectorFromString(selector), object1);

    return object;
}

-(BOOL)performSelectorFromStringWithReturnBoolean:(NSString *)selector withObject:(id)object1
{
    BOOL object;
    
    BOOL (*msgSend)(id, SEL, id) = (BOOL (*)(id, SEL, id)) objc_msgSend;
    object = msgSend(self, NSSelectorFromString(selector), object1);
    
    return object;
}



-(void)performSelectorFromString:(NSString *)selector withObject:(id)object1 withObject:(id)object2
{
    void (*msgSend)(id, SEL, id, id) = (void (*)(id, SEL, id, id)) objc_msgSend;
    msgSend(self, NSSelectorFromString(selector), object1, object2);
}

-(id)performSelectorFromStringWithReturnObject:(NSString *)selector withObject:(id)object1 withObject:(id)object2
{
    id object;
    
    id (*msgSend)(id, SEL, id, id) = (id (*)(id, SEL, id, id)) objc_msgSend;
    object = msgSend(self, NSSelectorFromString(selector), object1, object2);
    
    return object;
}

-(BOOL)performSelectorFromStringWithReturnBoolean:(NSString *)selector withObject:(id)object1 withObject:(id)object2
{
    BOOL object;
    
    BOOL (*msgSend)(id, SEL, id, id) = (BOOL (*)(id, SEL, id, id)) objc_msgSend;
    object = msgSend(self, NSSelectorFromString(selector), object1, object2);
    
    return object;
}



-(void)performSelectorFromString:(NSString *)selector withObject:(id)object1 withObject:(id)object2 withObject:(id)object3
{
    void (*msgSend)(id, SEL, id, id, id) = (void (*)(id, SEL, id, id, id)) objc_msgSend;
    msgSend(self, NSSelectorFromString(selector), object1, object2,object3);
}

-(id)performSelectorFromStringWithReturnObject:(NSString *)selector withObject:(id)object1 withObject:(id)object2 withObject:(id)object3
{
    id object;
    
    id (*msgSend)(id, SEL, id, id, id) = (id (*)(id, SEL, id, id, id)) objc_msgSend;
    object = msgSend(self, NSSelectorFromString(selector), object1, object2,object3);
    
    return object;
}

-(BOOL)performSelectorFromStringWithReturnBoolean:(NSString *)selector withObject:(id)object1 withObject:(id)object2 withObject:(id)object3
{
    BOOL object;
    
    BOOL (*msgSend)(id, SEL, id, id, id) = (BOOL (*)(id, SEL, id, id, id)) objc_msgSend;
    object = msgSend(self, NSSelectorFromString(selector), object1, object2,object3);
    
    return object;
}




-(void)performSelectorFromString:(NSString *)selector withObject:(id)object1 withObject:(id)object2 withObject:(id)object3 withObject:(id)object4
{
    void (*msgSend)(id, SEL, id, id, id, id) = (void (*)(id, SEL, id, id, id, id)) objc_msgSend;
    msgSend(self, NSSelectorFromString(selector), object1, object2,object3,object4);
}

-(id)performSelectorFromStringWithReturnObject:(NSString *)selector withObject:(id)object1 withObject:(id)object2 withObject:(id)object3 withObject:(id)object4
{
    id object;
    
    id (*msgSend)(id, SEL, id, id, id, id) = (id (*)(id, SEL, id, id, id, id)) objc_msgSend;
    object = msgSend(self, NSSelectorFromString(selector), object1, object2,object3,object4);
    
    return object;
}

-(BOOL)performSelectorFromStringWithReturnBoolean:(NSString *)selector withObject:(id)object1 withObject:(id)object2 withObject:(id)object3 withObject:(id)object4
{
    BOOL object;
    
    BOOL (*msgSend)(id, SEL, id, id, id, id) = (BOOL (*)(id, SEL, id, id, id, id)) objc_msgSend;
    object = msgSend(self, NSSelectorFromString(selector), object1, object2,object3,object4);
    
    return object;
}



-(void)performSelectorFromString:(NSString *)selector withObject:(id)object1 withObject:(id)object2 withObject:(id)object3 withObject:(id)object4 withObject:(id)object5
{
    void (*msgSend)(id, SEL, id, id, id, id, id) = (void (*)(id, SEL, id, id, id, id, id)) objc_msgSend;
    msgSend(self, NSSelectorFromString(selector), object1, object2,object3,object4,object5);
}

-(id)performSelectorFromStringWithReturnObject:(NSString *)selector withObject:(id)object1 withObject:(id)object2 withObject:(id)object3 withObject:(id)object4 withObject:(id)object5
{
    id object;
    
    id (*msgSend)(id, SEL, id, id, id, id, id) = (id (*)(id, SEL, id, id, id, id, id)) objc_msgSend;
    object = msgSend(self, NSSelectorFromString(selector), object1, object2,object3,object4,object5);
    
    return object;
}

-(BOOL)performSelectorFromStringWithReturnBoolean:(NSString *)selector withObject:(id)object1 withObject:(id)object2 withObject:(id)object3 withObject:(id)object4 withObject:(id)object5
{
    BOOL object;
    
    BOOL (*msgSend)(id, SEL, id, id, id, id, id) = (BOOL (*)(id, SEL, id, id, id, id, id)) objc_msgSend;
    object = msgSend(self, NSSelectorFromString(selector), object1, object2,object3,object4,object5);
    
    return object;
}




-(void)performSelectorFromString:(NSString *)selector withObject:(id)object1 withObject:(id)object2 withObject:(id)object3 withObject:(id)object4 withObject:(id)object5 withObject:(id)object6 withObject:(id)object7
{
    void (*msgSend)(id, SEL, id, id, id, id, id, id, id) = (void (*)(id, SEL, id, id, id, id, id, id, id)) objc_msgSend;
    msgSend(self, NSSelectorFromString(selector), object1, object2,object3,object4,object5,object6,object7);
}

-(id)performSelectorFromStringWithReturnObject:(NSString *)selector withObject:(id)object1 withObject:(id)object2 withObject:(id)object3 withObject:(id)object4 withObject:(id)object5 withObject:(id)object6 withObject:(id)object7
{
    id object;
    
    id (*msgSend)(id, SEL, id, id, id, id, id, id, id) = (id (*)(id, SEL, id, id, id, id, id, id, id)) objc_msgSend;
    object = msgSend(self, NSSelectorFromString(selector), object1, object2,object3,object4,object5,object6,object7);
    
    return object;
}

-(BOOL)performSelectorFromStringWithReturnBoolean:(NSString *)selector withObject:(id)object1 withObject:(id)object2 withObject:(id)object3 withObject:(id)object4 withObject:(id)object5 withObject:(id)object6 withObject:(id)object7
{
    BOOL object;
    
    BOOL (*msgSend)(id, SEL, id, id, id, id, id, id, id) = (BOOL (*)(id, SEL, id, id, id, id, id, id, id)) objc_msgSend;
    object = msgSend(self, NSSelectorFromString(selector), object1, object2,object3,object4,object5,object6,object7);
    
    return object;
}





-(void)performSelectorFromString:(NSString *)selector withObject:(id)object1 withObject:(id)object2 withObject:(id)object3 withObject:(id)object4 withObject:(id)object5 withObject:(id)object6 withObject:(id)object7 withObject:(id)object8 withObject:(id)object9
{
    void (*msgSend)(id, SEL, id, id, id, id, id, id, id, id, id) = (void (*)(id, SEL, id, id, id, id, id, id, id, id, id)) objc_msgSend;
    msgSend(self, NSSelectorFromString(selector), object1, object2,object3,object4,object5,object6,object7,object8,object9);
}

-(id)performSelectorFromStringWithReturnObject:(NSString *)selector withObject:(id)object1 withObject:(id)object2 withObject:(id)object3 withObject:(id)object4 withObject:(id)object5 withObject:(id)object6 withObject:(id)object7 withObject:(id)object8 withObject:(id)object9
{
    id object;
    
    id (*msgSend)(id, SEL, id, id, id, id, id, id, id, id, id) = (id (*)(id, SEL, id, id, id, id, id, id, id, id, id)) objc_msgSend;
    object = msgSend(self, NSSelectorFromString(selector), object1, object2,object3,object4,object5,object6,object7,object8,object9);
    
    return object;
}

-(BOOL)performSelectorFromStringWithReturnBoolean:(NSString *)selector withObject:(id)object1 withObject:(id)object2 withObject:(id)object3 withObject:(id)object4 withObject:(id)object5 withObject:(id)object6 withObject:(id)object7 withObject:(id)object8 withObject:(id)object9
{
    BOOL object;
    
    BOOL (*msgSend)(id, SEL, id, id, id, id, id, id, id, id, id) = (BOOL (*)(id, SEL, id, id, id, id, id, id, id, id, id)) objc_msgSend;
    object = msgSend(self, NSSelectorFromString(selector), object1, object2,object3,object4,object5,object6,object7,object8,object9);
    
    return object;
}


@end
