//
//  main.m
//  Hashing Linear
//
//  Created by Iago Chaves on 22/05/13.
//  Copyright (c) 2013 Iago Chaves. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LinearHash.h"

int main(int argc, const char * argv[])
{

	@autoreleasepool {
	    
		LinearHash *lh = [[LinearHash alloc] init];
		
		Bucket *b0 = [[Bucket alloc] initWithIdentifier:@"00" andSizeOfBucket:@4];
		Bucket *b1 = [[Bucket alloc] initWithIdentifier:@"01" andSizeOfBucket:@4];
		Bucket *b2 = [[Bucket alloc] initWithIdentifier:@"10" andSizeOfBucket:@4];
		Bucket *b3 = [[Bucket alloc] initWithIdentifier:@"11" andSizeOfBucket:@4];
		[lh addBucket: b0];
		[lh addBucket: b1];
		[lh addBucket: b2];
		[lh addBucket: b3];
		
		Page *p0 = [[Page alloc] init];
		int v0 = 3;
		p0.value = &v0;
		[lh addPage:p0];
		
		Page *p1 = [[Page alloc] init];
		int v1 = 7;
		p1.value = &v1;
		[lh addPage:p1];
		
		Page *p2 = [[Page alloc] init];
		int v2 = 11;
		p2.value = &v2;
		[lh addPage:p2];
		
		Page *p3 = [[Page alloc] init];
		int v3 = 15;
		p3.value = &v3;
		[lh addPage:p3];
		
		Page *p4 = [[Page alloc] init];
		int v4 = 19;
		p4.value = &v4;
		[lh addPage:p4];
		
		Page *p5 = [[Page alloc] init];
		int v5 = 0;
		p5.value = &v5;
		[lh addPage:p5];
	    
	}
    return 0;
}

