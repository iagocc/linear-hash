//
//  LinearHash.m
//  Hashing Linear
//
//  Created by Iago Chaves on 22/05/13.
//  Copyright (c) 2013 Iago Chaves. All rights reserved.
//

#import "LinearHash.h"

@implementation LinearHash

@synthesize buckets = _buckets;

- (id) init {
	self = [super init];
	if(self) {
		_buckets = [[NSMutableArray alloc] init];
		level = 1;
	}
	return self;
}

- (void) addBucket: (Bucket*) bucket {
	[_buckets addObject: bucket];
	
	if ([_buckets count] == 1) {
		next = 0;
	}
}

- (NSString *) getBits: (int) value forLevel: (int) numberOfLevel {
	byte *bytes = (byte*) malloc(sizeof(byte)*numberOfLevel+1);
	for (int i = numberOfLevel; i >= 0; i--) {
		// & = AND bit per bit
		bytes[i] = ((value & (1 << i)) ? '1' : '0');
	}
	return [NSString stringWithCString:bytes encoding:NSUTF8StringEncoding];
}

- (Bucket*__autoreleasing*) getRightBucketToInsert: (Page*) page forLevel: (int) numberOfLevel {
	Bucket __autoreleasing *b = nil;
	int i;
	for (i = 0; i < [_buckets count]; i++) {
		b = [_buckets objectAtIndex:i];
		NSString *identifier = [self getBits:*(page.value) forLevel:[b.level intValue]];
//		NSLog(@"%@ = %@", b.identifier, identifier);
		if ([b.identifier isEqualToString:identifier]) {
			break;
		}
	}
	if(i >= [_buckets count]) {
		return nil;
	}
	Bucket*__autoreleasing* bucket = &b;
	return bucket;
}

- (void) addPage: (Page*) page {
	NSLog(@"Trying to add the page: %@ with value: %d.", page, *page.value);
	Bucket *__autoreleasing* ptrBucket = [self getRightBucketToInsert:page forLevel:level];
	
	if(ptrBucket == nil) {
		NSLog(@"Error, bucket not found.");
		return;
	}
	
	Bucket *bucket = *ptrBucket;
	NSLog(@"Found %@ bucket (idenifier: %@).", bucket, bucket.identifier);
	
	if([bucket.pages count] < [bucket.numberOfPagesPerBucket intValue]) {
		[bucket.pages addObject: page];
		NSLog(@"Added.");
	} else {
		[bucket.pages addObject: page];
		NSLog(@"Added in overflow.");
		
		Bucket *_next = [_buckets objectAtIndex:next];
		NSString *newIdentifier = [NSString stringWithFormat:@"%@%@", @"0",_next.identifier];
		NSString *identifierForNewBucket = [NSString stringWithFormat:@"%@%@", @"1",_next.identifier];
		
		_next.identifier = newIdentifier;
		_next.level = [NSNumber numberWithInt:[_next.level intValue] + 1];
		
		Bucket *newBucket = [[Bucket alloc] initWithIdentifier:identifierForNewBucket andSizeOfBucket:_next.numberOfPagesPerBucket];
		newBucket.level = [NSNumber numberWithInt:[newBucket.level intValue] + 1];
		[self addBucket:newBucket];
		
		NSMutableArray *pages = [_next.pages mutableCopy];
		[_next.pages removeAllObjects];
		
		for (Page *p in pages) {
			
			NSString *bits = [self getBits:*(p.value) forLevel:[_next.level intValue]];
			if ([_next.identifier isEqualToString:bits]) {
				[_next.pages addObject: p];
			} else {
				[newBucket.pages addObject:p];
			}
			
		}
		
		if (next == pow(2, level+1)) {
			level++;
			next = 0;
		} else {
			next++;
		}
		NSLog(@"One bucket has splitted (at index: %d). Now we have %lu buckets.", (next-1), (unsigned long)[_buckets count]);
	}
	printf("\n");
}

@end
