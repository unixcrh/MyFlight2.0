//
//  WriteOrderViewController.h
//  MyFlight2.0
//
//  Created by sss on 12-12-6.
//  Copyright (c) 2012年 LIAN YOU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AddressBook/AddressBook.h>
#import "WriteOrderCell.h"
#import "WriteOrderDetailsCell.h"
#import "WirterOrderTwoLineCell.h"
#import "WriterOrderCommonCell.h"
#import "SearchFlightData.h"
#import "flightItineraryVo.h"
#import "ServiceDelegate.h"
#import "SalesCell.h"
#import "WriteOrderGreenCell.h"
#import "UseGoldPay.h"
#import <AddressBookUI/AddressBookUI.h>
#import "Umpay.h"
#import "OrderDetaile.h"
@interface WriteOrderViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,ABPersonViewControllerDelegate,ABNewPersonViewControllerDelegate,ABPeoplePickerNavigationControllerDelegate,UITextFieldDelegate,ServiceDelegate,UmpayDelegate>
{
    IBOutlet UILabel *orderMoney;
    NSString * stringAfterJoin ;  // 拼接好的string
    
    NSString * firstCellText;
    
    flightItineraryVo * flightItinerary;
    
    NSMutableArray * nameAndPhone;      //联系人名字和电话号码
    UIButton * sendMessageBtn;
    BOOL haveThisMan;
}
@property (retain, nonatomic) IBOutlet UIView *bigHeadView;
@property (retain, nonatomic) IBOutlet UIView *headView;

@property (retain, nonatomic) IBOutlet UITableView *orderTableView;
@property (retain, nonatomic) IBOutlet WriteOrderCell *writeOrderCell;
@property (retain, nonatomic) IBOutlet WriteOrderDetailsCell *writeOrderDetailsCell;
@property (retain, nonatomic) IBOutlet WriterOrderCommonCell *writerOrderCommonCell;
@property (retain, nonatomic) IBOutlet WriteOrderGreenCell *greenCell;
@property (retain, nonatomic) IBOutlet WirterOrderTwoLineCell *wirterOrderTwoLineCell;
@property (retain, nonatomic) IBOutlet SalesCell *salesCell;

@property (retain, nonatomic) OrderDetaile *  order;

@property (retain, nonatomic) NSMutableArray * passengerIDArr;
@property (retain, nonatomic) NSMutableArray * cerNO;
@property (retain, nonatomic) NSMutableArray * cerTYPE;
@property (retain, nonatomic) NSMutableArray * passengeNAME;
@property (retain, nonatomic) NSMutableArray * passengerTYPE;


//@property (retain, nonatomic) NSMutableArray * addPersonArr;


@property (retain, nonatomic) UseGoldPay * useGoldPay ;

@property (retain, nonatomic) NSString * goAirPortName;  // 去成公司二字码
@property (retain, nonatomic) NSString * backAirPortName;  // 返程公司二字码

@property (retain, nonatomic) IBOutlet UIScrollView *orderScrollView;
@property (retain, nonatomic) IBOutlet UILabel *allPay;   // 底部的显示还有多少钱的按钮

@property (retain, nonatomic) NSMutableArray * stringArr;  // 存放添加联系人返回回来的字符串

@property (retain, nonatomic) SearchFlightData * searchDate;
@property (retain, nonatomic) SearchFlightData * searchBackDate;

@property (assign, nonatomic) int flag;
@property (retain, nonatomic) NSMutableArray * firstCelTextArr;

@property (retain, nonatomic) NSMutableArray * indexArr;


@property (retain, nonatomic) NSString * discountName;  //   促销活动的名字
@property (retain, nonatomic) NSArray * discountListArr;// 促销活动arr


///  cell属性的定义
@property (retain, nonatomic) IBOutlet UILabel *upPayMoney;
@property (retain, nonatomic) IBOutlet UILabel *bigUpPayMoney;


@property (retain, nonatomic) NSString * searchType;



@property (retain, nonatomic) NSString * passWord;   // 支付密码
@property (retain, nonatomic) NSString * captchaID;  // 优惠券ID




//*****headView  property
@property (retain, nonatomic) IBOutlet UILabel *PerStanderPrice;
@property (retain, nonatomic) IBOutlet UILabel *PersonConstructionFee;
@property (retain, nonatomic) IBOutlet UILabel *personAdultBaf;
@property (retain, nonatomic) IBOutlet UILabel *personMuber;
@property (retain, nonatomic) IBOutlet UILabel *Personinsure;


@property (retain, nonatomic) IBOutlet UILabel *backLabel;
@property (retain, nonatomic) IBOutlet UILabel *childStanderPrice;
@property (retain, nonatomic) IBOutlet UILabel *childConstructionFee;
@property (retain, nonatomic) IBOutlet UILabel *childBaf;
@property (retain, nonatomic) IBOutlet UILabel *childMunber;
@property (retain, nonatomic) IBOutlet UILabel *childInsure;



@property (retain, nonatomic) NSString * goPay;
@property (retain, nonatomic) NSString * goCabin;
@property (retain, nonatomic) NSString * backPay;
@property (retain, nonatomic) NSString * backCabin;
@property (retain, nonatomic) NSString * childGopay; // 儿童去程价格
@property (retain, nonatomic) NSString * childBackPay; 

@property (nonatomic,retain) UIView * tempView;
@property (nonatomic,assign) float headViewHegiht;

@property (nonatomic,retain) NSString * swithTypeForGold; // 资金账户的开关状态
@property (nonatomic,retain) NSString * swithType;  // 记录填写保险的状态
@property (nonatomic,assign) int traveType;  // 记录填写行程单状态


@property (nonatomic,retain) NSMutableArray * indexGoldArr;  // 记录使用优惠券是选择的那个个选项

@property (nonatomic,retain) NSMutableArray * personArray;


@property (nonatomic,retain)  NSString * postType;
@property (nonatomic,retain)  NSString * postSchuduel;

- (IBAction)payMoney:(id)sender;  // 去支付订单
- (IBAction)changeToBigHeadView:(id)sender;
- (IBAction)changeToSmallHeadView:(id)sender;

@end
