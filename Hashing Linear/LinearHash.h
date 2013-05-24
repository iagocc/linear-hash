//
//  LinearHash.h
//  Hashing Linear
//
//  Created by Iago Chaves on 22/05/13.
//  Copyright (c) 2013 Iago Chaves. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Bucket.h"
#import "Page.h"

@interface LinearHash : NSObject {
	int next;
	int level;
}

@property (nonatomic, retain) NSMutableArray *buckets;

- (void) addBucket: (Bucket*) bucket;
- (void) addPage: (Page*) page;

@end
