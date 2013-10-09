//
//  MacroDefinition.h
//  MacroDefinition
//
//  Created by CouldHll on 13-9-22.
//  Copyright (c) 2013年 CouldHll. All rights reserved.
//

#ifndef MacroDefinition_h
#define MacroDefinition_h


#pragma mark - Size

// screen size
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

// control size
#define UI_NAVIGATION_BAR_HEIGHT        44
#define UI_TOOL_BAR_HEIGHT              44
#define UI_TAB_BAR_HEIGHT               49
#define UI_STATUS_BAR_HEIGHT            20

#pragma mark - Log

//// print log with line&function
//#ifdef DEBUG
//    #define NSLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
//#else
//    #define NSLog(...)
//#endif

// print log with line&function without time
#if DEBUG
    #define NSLog(FORMAT, ...) fprintf(stderr,"\nfunction:%s line:%d content:%s\n", __FUNCTION__, __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
    #define NSLog(FORMAT, ...) nil
#endif

// print&alert log
#ifdef DEBUG
    #   define ULog(fmt, ...)  { UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"%s\n [Line %d] ", __PRETTY_FUNCTION__, __LINE__] message:[NSString stringWithFormat:fmt, ##__VA_ARGS__]  delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil]; [alert show]; }
#else
    #   define ULog(...)
#endif


// itt debug
#define ITTDEBUG
#define ITTLOGLEVEL_INFO     10
#define ITTLOGLEVEL_WARNING  3
#define ITTLOGLEVEL_ERROR    1

#ifndef ITTMAXLOGLEVEL

#ifdef DEBUG
    #define ITTMAXLOGLEVEL ITTLOGLEVEL_INFO
#else
    #define ITTMAXLOGLEVEL ITTLOGLEVEL_ERROR
#endif

#endif

// The general purpose logger. This ignores logging levels.
#ifdef ITTDEBUG
#define ITTDPRINT(xx, ...)  NSLog(@"%s(%d): " xx, __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#else
#define ITTDPRINT(xx, ...)  ((void)0)
#endif

// Prints the current method's name.
#define ITTDPRINTMETHODNAME() ITTDPRINT(@"%s", __PRETTY_FUNCTION__)

// Log-level based logging macros.
#if ITTLOGLEVEL_ERROR <= ITTMAXLOGLEVEL
#define ITTDERROR(xx, ...)  ITTDPRINT(xx, ##__VA_ARGS__)
#else
#define ITTDERROR(xx, ...)  ((void)0)
#endif

#if ITTLOGLEVEL_WARNING <= ITTMAXLOGLEVEL
#define ITTDWARNING(xx, ...)  ITTDPRINT(xx, ##__VA_ARGS__)
#else
#define ITTDWARNING(xx, ...)  ((void)0)
#endif

#if ITTLOGLEVEL_INFO <= ITTMAXLOGLEVEL
#define ITTDINFO(xx, ...)  ITTDPRINT(xx, ##__VA_ARGS__)
#else
#define ITTDINFO(xx, ...)  ((void)0)
#endif

#ifdef ITTDEBUG
#define ITTDCONDITIONLOG(condition, xx, ...) { if ((condition)) { \
ITTDPRINT(xx, ##__VA_ARGS__); \
} \
} ((void)0)
#else
#define ITTDCONDITIONLOG(condition, xx, ...) ((void)0)
#endif

#define ITTAssert(condition, ...)                                       \
do {                                                                      \
if (!(condition)) {                                                     \
[[NSAssertionHandler currentHandler]                                  \
handleFailureInFunction:[NSString stringWithUTF8String:__PRETTY_FUNCTION__] \
file:[NSString stringWithUTF8String:__FILE__]  \
lineNumber:__LINE__                                  \
description:__VA_ARGS__];                             \
}                                                                       \
} while(0)


#pragma mark - System

// get system info
#define CurrentSystemVersion [[UIDevice currentDevice] systemVersion]
#define CurrentLanguage ([[NSLocale preferredLanguages] objectAtIndex:0])

// Retina iPhone iPod iPad
#define IS_IPHONE ( [[[UIDevice currentDevice] model] isEqualToString:@"iPhone"] )
#define IS_IPOD   ( [[[UIDevice currentDevice ] model] isEqualToString:@"iPod touch"] )
#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_RETINA ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)
#define IS_IPHONE5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

// system directory
#define DocumentsDirectory [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES) objectAtIndex:0]
#define LibraryDirectory [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory,NSUserDomainMask, YES) objectAtIndex:0]
#define DocumentsSubDirectory(dir) [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:dir]
#define LibrarySubDirectory(dir) [[NSSearchPathForDirectoriesInDomains(NSLibraryDirectory,NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:dir]
#define CacheDirectory [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0]
#define CacheSubDirectory(dir) [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:dir]
#define TempDirectory NSTemporaryDirectory()
#define TempSubDirectory(dir) [NSTemporaryDirectory() stringByAppendingPathComponent:dir]

// ios version
#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

// device or simulator
#if TARGET_OS_IPHONE
//iPhone Device
#endif
#if TARGET_IPHONE_SIMULATOR
//iPhone Simulator
#endif


#pragma mark - Memory

// use or not use ARC
#if __has_feature(objc_arc)
    // compiling with ARC
#else
    // compiling without ARC
#endif

// safely release
#define RELEASE_SAFELY(P) if(P) { [P release], P = nil; }


#pragma mark - Image

// load image with file
#define LoadImagewithFile(file,type) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:file ofType:type]]

// load image with name
#define LoadImageWithName(fileName) [UIImage imageNamed:[UIUtil imageName:fileName]]


#pragma mark - Color

// 16hex
#define HexRGBA(rgb,a) [UIColor colorWithRed:((float)((rgb & 0xFF0000) >> 16))/255.0 green:((float)((rgb & 0xFF00) >> 8))/255.0 blue:((float)(rgb & 0xFF))/255.0 alpha:1.0]
#define HexRGB(rgb) HexRGBA(rgb,1.0f)

// RGBA
#define RGBA(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
#define RGB(r,g,b) RGBA(r,g,b,1.0f)


#pragma mark - Analytics

// google analytics
#define GA_TRACKPAGE(PAGE) { NSError *error; if (![[GANTracker sharedTracker]trackPageview:[NSString stringWithFormat:@&quot;/%@&quot;, PAGE] withError:&amp;error]) { LOG(@&quot;%@&quot;,error.helpAnchor); } LOG(@&quot;GA /%@&quot;, PAGE); };
#define GA_TRACKEVENT(EVENT,ACTION,LABEL,VALUE) { NSError *error; if (![[GANTracker sharedTracker] trackEvent:EVENT action:ACTION label:LABEL value:VALUE withError:&amp;error]){ LOG(@&quot;%@&quot;,error.helpAnchor); } LOG(@&quot;GA %@/%@/%@&quot;, EVENT, ACTION, LABEL); };
#define GA_TRACK_CLASS GA_TRACKPAGE(NSStringFromClass([self class]));
#define GA_TRACK_METHOD GA_TRACKEVENT(NSStringFromClass([self class]),NSStringFromSelector(_cmd), @&rdquo;&rdquo;, -1); }


#pragma mark - Other

// GCD
#define BACK(block) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block)
#define MAIN(block) dispatch_async(dispatch_get_main_queue(),block)

// degree radian charge
#define degreesToRadian(x) (M_PI * (x) / 180.0)
#define radianToDegrees(radian) (radian*180.0)/(M_PI)

// singleton a class
#define SYNTHESIZE_SINGLETON_FOR_CLASS(classname) \
\
static classname *shared##classname = nil; \
\
+ (classname *)shared##classname \
{ \
@synchronized(self) \
{ \
if (shared##classname == nil) \
{ \
shared##classname = [[self alloc] init]; \
} \
} \
\
return shared##classname; \
} \
\
+ (id)allocWithZone:(NSZone *)zone \
{ \
@synchronized(self) \
{ \
if (shared##classname == nil) \
{ \
shared##classname = [super allocWithZone:zone]; \
return shared##classname; \
} \
} \
\
return nil; \
} \
\
- (id)copyWithZone:(NSZone *)zone \
{ \
return self; \
}


#endif
