//
//  DiscountCouponController.h
//  MyFlight2.0
//
//  Created by WangJian on 12-12-28.
//  Copyright (c) 2012年 LIAN YOU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UseGoldPay.h"
@class UseDiscountCell;
@class GoldCoinCell;
@interface DiscountCouponController : UIViewController <UITableViewDataSource,UITableViewDelegate>
@property (retain, nonatomic) IBOutlet UITableView *showDiscountTableView;
@property (retain, nonatomic) IBOutlet UIView *sectionHeadViewOne;
@property (retain, nonatomic) IBOutlet UIView *sectionHeadViewTwo;
@property (retain, nonatomic) IBOutlet UIView *sectionFootView;
@property (retain, nonatomic) IBOutlet UseDiscountCell *discountCell;
@property (retain, nonatomic) IBOutlet GoldCoinCell *goldCell;

@property (retain, nonatomic) UseGoldPay * gold;

@property (retain, nonatomic) NSString * accountAmount;  // 账户资金
@property (retain, nonatomic) NSString * goldAmount;     // 金币数目
@property (retain, nonatomic) NSString * silverAmount;   // 银币数目

- (IBAction)swithOFFOrON:(UISwitch *)sender;

@end