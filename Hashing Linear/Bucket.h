//
//  Bucket.h
//  Hashing Linear
//
//  Created by Iago Chaves on 22/05/13.
//  Copyright (c) 2013 Iago Chaves. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Page.h"

typedef char byte;

@interface Bucket : NSObject

@property (nonatomic, retain) NSNumber *numberOfPagesPerBucket;
@property (nonatomic, retain) NSMutableArray *pages;
@property (nonatomic, retain) NSString *identifier;
@property (nonatomic, retain) NSNumber *level;

- (Bucket*) initWithIdentifier: (NSString*) identifier andSizeOfBucket: (NSNumber*) numberOfPagesPerBucket;

@end
