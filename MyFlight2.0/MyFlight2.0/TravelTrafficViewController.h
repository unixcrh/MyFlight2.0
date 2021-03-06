//
//  TravelTrafficViewController.h
//  MyFlight2.0
//
//  Created by apple on 12-12-20.
//  Copyright (c) 2012年 LIAN YOU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SVSegmentedControl.h"
#import "AirPortData.h"
#import "TrafficCell.h"
//#import "CoachTableViewController.h"
//#import "SubwayTableViewController.h"
//#import "TaxiTableViewController.h"

@interface TravelTrafficViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    AirPortData * _subAirPortData;
    NSString * _airPortCode;    //机场三字码
    NSInteger orientation;  //方向    0 = 去机场  ， 1 = 去市区
    NSInteger trfficType;   //交通类型  0 = 机场大巴，     1 = 出租车，   2 = 机场快轨
    
    NSInteger orientationCoach;     //大巴时方向
    NSInteger orientationSubway;    //快轨时方向
    NSInteger orientationTaxi;      //出租车时方向
    
    
    NSMutableData * myData;
    NSInteger mySegValue;   //seg值，作为交通类型
    UILabel * navgaitionLabel;
   
    SVSegmentedControl * segmented;
    
    //导航栏label
    UILabel * navLabel;
    UIImageView * navImageView;
    //大巴
    IBOutlet UIView * coachView;
    NSMutableDictionary * coachDic;
    NSMutableDictionary * coachDicFromAirPort;
    //机场快线
    IBOutlet UIView * subwayView;
    NSMutableDictionary * subwayDic;
    NSMutableDictionary * subwayDicFromAirPort;
    
    //出租车
    IBOutlet UIView * taxiView;
    NSMutableDictionary * taxiDic;
    NSMutableDictionary * taxiDicFromAirPort;
    
    NSInteger coachListCount;       //多少辆大巴
    IBOutlet UIView * coachSingleList;//机场大巴单个列表（包括详情）
    IBOutlet UILabel * coachPriceLabel;  //价格
    IBOutlet UIButton * coachOpenDetailBtn;  //三角型
    IBOutlet UIView * coachDetailView;   //详情view
    IBOutlet UILabel * coachDeptLabel;   //起点
    IBOutlet UILabel * coachTime;    //时间，7：00-次日1：00
    IBOutlet UILabel * coachDeptToArr;   //东直门-->首都机场
    IBOutlet UILabel * coachFirstCoachTime;  //首班车发车时间
    IBOutlet UILabel * coachLastCoachTime;   //末班车时间
    IBOutlet UILabel * coachIntvalTime;   //间隔时间
    IBOutlet UITextView * coachStopView; //经停站
    
    
    
    IBOutlet UIView * coachTelTotel;    //机场大巴列表（总）
    IBOutlet UIView * coachTel; //机场大巴电话（单个）
    
    
    IBOutlet UILabel * subWayPriceLabel;  //价格
    IBOutlet UILabel * subWayDeptLabel;   //起点
    IBOutlet UILabel * subWayTime;    //时间，7：00-次日1：00
    IBOutlet UILabel * subWayDeptToArr;   //东直门-->首都机场
    IBOutlet UILabel * subWayFirstCoachTime;  //首班车发车时间
    IBOutlet UILabel * subWayLastCoachTime;   //末班车时间
    IBOutlet UILabel * subWayIntvalTime;   //间隔时间
    IBOutlet UITextView * subWayStopView;   //经停站

    
    IBOutlet UIView * taxiRefLine; //参考路线view
    IBOutlet UIView * taxiAirportTaxiStopPart;  //机场出租车位置view
    IBOutlet UIView * taxiPrice;        //计价方式view
    IBOutlet UILabel * taxiRefFromPart; //参考路线地点（国贸）
    IBOutlet UILabel * taxiRange;   //距离
    IBOutlet UILabel * taxiPriceLabel;  //价格
    IBOutlet UIButton * taxiOpenDetailBtn1;  //三角型（参考路线）
    IBOutlet UIButton * taxiOpenDetailBtn2;  //三角型（机场出租车）
    IBOutlet UIButton * taxiOpenDetailBtn3;  //三角型（计价方式）
    IBOutlet UILabel * taxiPartT;   //航站楼
    
    IBOutlet UIView * taxiDetailView;   //taxi详情view
    
    
    UITableView * coachTableView;
    UITableView * subwayTableView;
    UITableView * taxiTableView;
    UIView * contentView;
    UITableView * currTableView;
    CGRect rightRect;
    CGRect centerRect;
    
    BOOL * flagOpenOrCloseCoach; //开关状态  (市区-机场)
    BOOL * flagOpenOrCloseCoachFromAirPort; //开关状态  (机场-市区)
    NSArray * sectionCountCoach; //一共有多少个section
    NSArray * sectionCountCoachFromAirPort; //机场到市区 一共有多少个section
    
    BOOL * flagOpenOrCloseSubway; //开关状态
    BOOL * flagOpenOrCloseSubwayFromAirPort; //开关状态
    NSArray * sectionCountSubway; //一共有多少个section
    NSArray * sectionCountSubwayFromAirPort;    //
    
    BOOL * flagOpenOrCloseTaxi; //开关状态
    BOOL * flagOpenOrCloseTaxiFromAirPort; //开关状态
    NSArray * sectionCountTaxi; //一共有多少个section
    NSArray * sectionCountTaxiFromAirPort;
    
    
    
    
    
    
    NSMutableArray * coachCellHeightArray;
    NSMutableArray * subwayCellHeightArray;
    NSMutableArray * taxiCellHeightArray;
    
    NSMutableArray * coachCellHeightArray1;
    NSMutableArray * subwayCellHeightArray1;
    NSMutableArray * taxiCellHeightArray1;
    
    
    
    
    UILabel * lineName;
    
    
    UILabel * firstBusTime;
    
    
    UILabel * lastBusTime;
    
    
    UILabel * lineIndex;
 
    
    UILabel * lineFares;
    UIScrollView * contentTaxiView;   //最后方案
    IBOutlet UILabel * taxiRuleTitleLast;
    IBOutlet UILabel * taxiRuleLabelLast;
    IBOutlet UILabel * taxiLineNameLast;
    IBOutlet UILabel * aboutRangeLast;
    IBOutlet UILabel * taxiPriceLast;
    IBOutlet UILabel * taxiPlaceLast;
    BOOL customViewIsCoach;
   
    UILabel * label1Last;   //XXX城市出租车计价方式
    UITextView * textViewLast;  //明细
    
    UILabel * taxiLineLast;     //参考路线
//    UILabel * taxiLineLast1;
    
    UILabel * taxiLineRangeLast;    //距离
//    UILabel * taxiLineRangeLast1;
    
    UILabel * taxiLinePriceLast;    //价格
//    UILabel * taxiLinePriceLast1;
    
    UILabel * taxiStopPlaceLast;    //机场出租车位置
    UILabel * taxiStopDetailPlaceLast;
}
@property(nonatomic,retain) NSString * airPortCode;
@property(nonatomic,retain)AirPortData * subAirPortData;
@property(nonatomic,retain) NSString * airPortName;
@property(nonatomic,retain)TrafficCell * myTrafficCell;
@end
