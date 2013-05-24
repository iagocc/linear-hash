//
//  Bucket.m
//  Hashing Linear
//
//  Created by Iago Chaves on 22/05/13.
//  Copyright (c) 2013 Iago Chaves. All rights reserved.
//

#import "Bucket.h"

@implementation Bucket

@synthesize numberOfPagesPerBucket = _numberOfPagesPerBucket;
@synthesize pages = _pages;
@synthesize identifier = _identifier;
@synthesize level = _level;

- (Bucket*) initWithIdentifier: (NSString*) identifier andSizeOfBucket: (NSNumber*) numberOfPagesPerBucket {
	self = [super init];
	if(self) {
		_numberOfPagesPerBucket = numberOfPagesPerBucket;
		_pages = [[NSMutableArray alloc] init];
		_identifier = identifier;
		_level = @1;
	}
	return self;
}

@end
