//
//  NSString+RemoveEmoji.h
//  MCCWYJ
//
//  Created by MC on 16/7/27.
//  Copyright © 2016年 MC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (RemoveEmoji)
- (BOOL)isIncludingEmoji;

- (instancetype)removedEmojiString;
@end
