//
//  SMSViewController.h
//  MyFlight2.0
//
//  Created by apple on 12-12-16.
//  Copyright (c) 2012年 LIAN YOU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AddressBook/AddressBook.h>
#import <AddressBookUI/AddressBookUI.h>
#import "AddLinkManViewController.h"
#import "FlightConditionDetailData.h"
@interface SMSViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,ABPeoplePickerNavigationControllerDelegate,UITextFieldDelegate,UIAlertViewDelegate>
{
//    IBOutlet UIButton * sendMessageButton;  //发送短信
    NSMutableArray * nameAndPhone;      //联系人名字和电话号码
    UIButton * sendMessageBtn;
    BOOL haveThisMan;
    UITextField * cusInputTextField;
    NSInteger delegateIndex;
    BOOL isHave;
    
    
    NSString * myString;
//    NSMutableData * myData;
    FlightConditionDetailData * subMyFlightConditionDetailData;
    
    BOOL flag;
    UITableView * myTableView;
    UILabel * cellNameLabel;
    UILabel * cellPhoneLabel;
}

@property(nonatomic,retain) FlightConditionDetailData * subMyFlightConditionDetailData;
//- (IBAction)sendMessageBtnClick:(id)sender;
@end
