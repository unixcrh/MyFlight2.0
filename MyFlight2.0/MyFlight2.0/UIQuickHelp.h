//
//  UIQuickHelp.h
//  MyFlight2.0
//
//  Created by Davidsph on 12/6/12.
//  Copyright (c) 2012 LIAN YOU. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>

//这是一个工具类 可以快速设置特定UI
@interface UIQuickHelp : NSObject


//以指定半径 为一个view设置圆角效果
+ (void)setRoundCornerForView:(UIView*)view
                   withRadius:(CGFloat)radius;
//填充view的边框颜色
+ (void)setBorderForView:(UIView*)view
               withWidth:(CGFloat)width
               withColor:(UIColor*)color;

+(void) showAlertViewWithTitle:(NSString *) title message:(NSString *) message delegate:(id) delgate  cancelButtonTitle:(NSString *) cancel otherButtonTitles:(NSString *) ok;

//+ (UIButton *)buttonWithType:(NSUInteger)type
//					   title:(NSString *)title
//					   frame:(CGRect)frame
//				   imageName:(NSString *)imageName
//			 tappedImageName:(NSString *)tappedImageName
//					  target:(id)target
//					  action:(SEL)selector
//						 tag:(NSInteger)tag;





+ (void) setTableViewCellBackGroundColorAndHighLighted:(UITableViewCell *) cell;

@end
