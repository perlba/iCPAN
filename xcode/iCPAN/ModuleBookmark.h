//
//  ModuleBookmark.h
//  iCPAN
//
//  Created by Alders Olaf on 12-03-21.
//  Copyright (c) 2012 wundersolutions.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ModuleBookmark : NSObject

+ (NSDictionary *)getBookmarks;
+ (BOOL)isBookmarked:(NSString *)moduleName;
+ (void) addBookmark: (NSString *)moduleName;
+ (void) removeBookmark: (NSString *)moduleName;
+ (void) syncBookmarks: (NSMutableDictionary *) bookmarks;
@end
