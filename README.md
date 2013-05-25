Linear Hash
===========

## Overview
This is implementation of Linear Hash in Objective C, linear hash are most commonly used in DBMS to indexes.

##  Observations
We use [ARC](http://developer.apple.com/library/mac/#releasenotes/ObjectiveC/RN-TransitioningToARC/Introduction/Introduction.html).

## Usage
In `main.m` you have samples.

```objective-c
LinearHash *lh = [[LinearHash alloc] init];
Bucket *b0 = [[Bucket alloc] initWithIdentifier:@"00" andSizeOfBucket:@4];
[lh addBucket: b0];

Page *p0 = [[Page alloc] init];
int v0 = 3;
p0.value = &v0;
[lh addPage:p0];
```
