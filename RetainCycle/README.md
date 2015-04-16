Environment
------
iOS8 & xcode6.2


Proble Description
------
内存不断增加，找不到原因。Instruments也不显示有memory leak。  
原因是：Retain cycle。  
在`-(void)dealloc { ... }`中，释放NStimer，实际上因为retain不为0，timer对象没有被deallac。

Solution
------
1. 
```
- (void)viewWillDisappear:(BOOL)animated
{
    [self stopTimer];
}
```

Reference
-----------------
- [Objective-C – NSTimerについて（alloc, release, invalidateとか）](http://programming-ios.com/nstimer-alloc-release-invalidate/) 
