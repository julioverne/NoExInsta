#import <dlfcn.h>
#import <objc/runtime.h>
#import <notify.h>
#import <substrate.h>

#define NSLog(...)

%hook IGTabBarController
- (void)viewWillAppear:(BOOL)arg1
{
	%orig;
	NSArray* _tabBarSurfaces = MSHookIvar<NSArray*>(self, "_tabBarSurfaces");
	NSArray* _viewControllers = MSHookIvar<NSArray*>(self, "_viewControllers");
	
	if(_tabBarSurfaces&&[_tabBarSurfaces count]>4) {
		NSMutableArray* retMut = [_tabBarSurfaces mutableCopy];
		[retMut removeObjectAtIndex:1];
		_tabBarSurfaces = retMut;
	}
	if(_viewControllers&&[_viewControllers count]>4) {
		NSMutableArray* retMut = [_viewControllers mutableCopy];
		[retMut removeObjectAtIndex:1];
		_viewControllers = retMut;
	}
	
	MSHookIvar<NSArray*>(self, "_tabBarSurfaces") = _tabBarSurfaces;
	MSHookIvar<NSArray*>(self, "_viewControllers") = _viewControllers;
}
%end


%hook IGTabBar
- (id)tabButtons
{
	NSArray* ret = %orig;
	if(ret&&[ret count]>4) {
		NSMutableArray* retMut = [ret mutableCopy];
		[retMut removeObjectAtIndex:1];
		ret = retMut;
		MSHookIvar<NSArray*>(self, "_tabButtons") = ret;
	}
	return ret;
}
%end



