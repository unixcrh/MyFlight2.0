//
//  PickSeatViewController.m
//  MyFlight2.0
//
//  Created by apple on 12-12-27.
//  Copyright (c) 2012年 LIAN YOU. All rights reserved.
//

#import "PickSeatViewController.h"

@interface PickSeatViewController ()

@end

@implementation PickSeatViewController

@synthesize tktno;
@synthesize segIndex;
@synthesize passName;
@synthesize airline;
@synthesize orgId;
@synthesize org;
@synthesize symbols;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void) requestForData
{
    NSURL *url = [NSURL URLWithString:GET_RIGHT_URL_WITH_Index(@"/web/phone/prod/flight/huet/getSeatMapHandler.jsp")];
    
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
    
    [request setRequestMethod:@"POST"];
    [request setDefaultResponseEncoding:NSUTF8StringEncoding];
    
    [request setPostValue:self.tktno forKey:@"tktno"];
    [request setPostValue:self.segIndex forKey:@"segIndex"];
    [request setPostValue:self.passName forKey:@"passName"];
    [request setPostValue:self.airline forKey:@"airline"];
    [request setPostValue:self.orgId forKey:@"orgId"];
    [request setPostValue:self.org forKey:@"org"];
    [request setPostValue:self.symbols forKey:@"symbols"];
    
    [request setPostValue:HWID_VALUE forKey:KEY_hwId];
    [request setPostValue:SOURCE_VALUE forKey:KEY_source];
    [request setPostValue:SERVICECode_VALUE forKey:KEY_serviceCode];
    [request setPostValue:EDITION_VALUE forKey:KEY_edition];
    
    [request setCompletionBlock:^(void){
        
        NSData *response = [request responseData];
        
        NSError *error = nil;
        
        [responseDictionary release];
        
        responseDictionary = [[response objectFromJSONDataWithParseOptions:JKSerializeOptionNone error:&error] retain];
        
        if(error != nil)
        {
            NSLog(@"JSON Parse Failed\n");
        }
        else
        {
            NSLog(@"JSON Parse Succeeded\n");
            
            NSDictionary *result = [responseDictionary objectForKey:@"result"];
            
            if([[result objectForKey:@"resultCode"] isEqualToString:@""])
            {
                for(NSString *string in [responseDictionary allKeys])
                {
                    NSLog(@"%@\n",string);
                }
                for(NSString *string in [responseDictionary allValues])
                {
                    NSLog(@"%@\n",string);
                }
                
                [self updateTitle];
                
                NSDictionary *seatMap = [responseDictionary objectForKey:@"seatMap"];
                
                NSString *cabinType = [NSString stringWithFormat:@"column%@", [seatMap objectForKey:@"baseCabin"]];
                
                NSArray *stringArray = [[seatMap objectForKey:cabinType] objectForKey:@"string"];
                
                NSArray *rowArray = [[seatMap objectForKey:@"row"] objectForKey:@"_int"];
                
                map.sectionX = [stringArray count];
                map.sectionY = [rowArray count];
                
                map.frame = CGRectMake(0, 0, map.sectionX * 30 + 30, map.sectionY * 30);
                
                scroll.contentSize = CGSizeMake(map.sectionX * 30 + 30, map.sectionY * 30);
                
                [map drawSeatMap:seatMap];
            }
            else
            {
                alertMessage = [[UIAlertView alloc] initWithTitle:[result objectForKey:@"resultCode"] message:[result objectForKey:@"message"] delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
                [alertMessage show];
                [alertMessage release];
            }
        }
    }];
    
    [request setFailedBlock:^(void){
        alertMessage = [[UIAlertView alloc] initWithTitle:@"" message:@"网络无响应，请稍后再试" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [alertMessage show];
        [alertMessage release];
    }];
    
    [request setDelegate:self];
    [request startAsynchronous];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self requestForData];
    
    self.navigationItem.title = @"选择座位";
    
    UIView *header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 30)];
    
    header.backgroundColor = [UIColor colorWithRed:212.0f/255.0f green:218.0f/255.0f blue:229.0f/255.0f alpha:1.0f];
    
    title = [[UILabel alloc] initWithFrame:CGRectMake(10, 8, 300, 14)];

    title.textColor = FONT_COLOR_BLUE;
    title.font = [UIFont systemFontOfSize:14.0f];
    title.textAlignment = UITextAlignmentLeft;
    title.backgroundColor = [UIColor clearColor];
    
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, 29, 320, 1)];
    
    line.backgroundColor = [UIColor colorWithRed:151.0f/255.0f green:168.0f/255.0f blue:196.0f/255.0f alpha:1.0f];
    
    [header addSubview:line];
    [line release];
    
    [header addSubview:title];
    [title release];
    
    [self.view addSubview:header];
    [header release];
    
    scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(10, 30, 320, [UIScreen mainScreen].bounds.size.height < 500 ? 310:390)];
    
    map = [[SeatMapView alloc] initWithFrame:CGRectMake(0, 0, 320, [UIScreen mainScreen].bounds.size.height < 500 ? 310:390)];
    
    [scroll addSubview:map];
    [map release];
    
    [self.view addSubview:scroll];
    [scroll release];
    
    UIView *footer = [[UIView alloc] initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height < 500 ? 340:420, 320, 100)];
    
    footer.backgroundColor = BACKGROUND_COLOR;
    
    UILabel *label;
    
    label = [[UILabel alloc] initWithFrame:CGRectMake(10, 9, 50, 12)];
    
    label.text = @"紧急出口";
    label.font = [UIFont systemFontOfSize:12.0f];
    label.textColor = FONT_COLOR_DEEP_GRAY;
    label.textAlignment = UITextAlignmentCenter;
    label.backgroundColor = [UIColor clearColor];
    
    [footer addSubview:label];
    [label release];
    
    UIImageView *icon;
    
    icon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"e.png"]];
    
    icon.frame = CGRectMake(65, 9.25f, 6.5, 11.5);
    
    [footer addSubview:icon];
    [icon release];
    
    label = [[UILabel alloc] initWithFrame:CGRectMake(90, 9, 40, 12)];
    
    label.text = @"可选";
    label.font = [UIFont systemFontOfSize:12.0f];
    label.textColor = FONT_COLOR_DEEP_GRAY;
    label.textAlignment = UITextAlignmentCenter;
    label.backgroundColor = [UIColor clearColor];
    
    [footer addSubview:label];
    [label release];
    
    icon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"seat1.png"]];
    
    icon.frame = CGRectMake(134, 4, 22, 22);
    
    [footer addSubview:icon];
    [icon release];
    
    label = [[UILabel alloc] initWithFrame:CGRectMake(165, 9, 40, 12)];
    
    label.text = @"已占";
    label.font = [UIFont systemFontOfSize:12.0f];
    label.textColor = FONT_COLOR_DEEP_GRAY;
    label.textAlignment = UITextAlignmentCenter;
    label.backgroundColor = [UIColor clearColor];
    
    [footer addSubview:label];
    [label release];
    
    icon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"no_seat.png"]];
    
    icon.frame = CGRectMake(209, 4, 22, 22);
    
    [footer addSubview:icon];
    [icon release];
    
    label = [[UILabel alloc] initWithFrame:CGRectMake(240, 9, 40, 12)];
    
    label.text = @"选中";
    label.font = [UIFont systemFontOfSize:12.0f];
    label.textColor = FONT_COLOR_DEEP_GRAY;
    label.textAlignment = UITextAlignmentCenter;
    label.backgroundColor = [UIColor clearColor];
    
    [footer addSubview:label];
    [label release];
    
    icon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pitch_on.png"]];
    
    icon.frame = CGRectMake(284, 4, 22, 22);
    
    [footer addSubview:icon];
    [icon release];
    
    [self.view addSubview:footer];
    [footer release];
    
    UIButton *checkIn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    checkIn.frame = CGRectMake(10, [UIScreen mainScreen].bounds.size.height < 500 ? 370:450, 300, 40);
    
    [checkIn setBackgroundImage:[UIImage imageNamed:@"orange_btn.png"] forState:UIControlStateNormal];
    [checkIn setBackgroundImage:[UIImage imageNamed:@"orange_btn_click.png"] forState:UIControlStateHighlighted];
    
    [checkIn setTitle:@"确定" forState:UIControlStateNormal];
    [checkIn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    checkIn.titleLabel.font = [UIFont systemFontOfSize:20];
    checkIn.titleLabel.textAlignment = UITextAlignmentCenter;
    
    [checkIn addTarget:self action:@selector(checkIn) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:checkIn];
    
    self.view.backgroundColor = FOREGROUND_COLOR;
}

- (void) viewDidUnload
{
    [super viewDidUnload];
    
    [responseDictionary release];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) updateTitle
{
    title.text = [NSString stringWithFormat:@"%@   %@-%@   %@-%@-%@",[[responseDictionary objectForKey:@"segment"] objectForKey:@"flightNo"], [[responseDictionary objectForKey:@"segment"] objectForKey:@"depAirportCode"], [[responseDictionary objectForKey:@"segment"] objectForKey:@"arrAirportCode"], [[[responseDictionary objectForKey:@"segment"] objectForKey:@"depTime"] objectForKey:@"year"], [[[responseDictionary objectForKey:@"segment"] objectForKey:@"depTime"] objectForKey:@"month"], [[[responseDictionary objectForKey:@"segment"] objectForKey:@"depTime"] objectForKey:@"day"]];
}

- (void) checkIn
{
    if([map currentSelected] == nil)
    {
        alertMessage = [[UIAlertView alloc] initWithTitle:@"" message:@"请选择一个座位" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [alertMessage show];
        [alertMessage release];
        return;
    }
    
    NSURL *url = [NSURL URLWithString:GET_RIGHT_URL_WITH_Index(@"/web/phone/prod/flight/huet/getPaHandler.jsp")];
    
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
    
    [request setRequestMethod:@"POST"];
    [request setDefaultResponseEncoding:NSUTF8StringEncoding];
    
    NSDictionary *dictionary;
    
    dictionary = [responseDictionary objectForKey:@"cussRequest"];
    
    [request setPostValue:[dictionary objectForKey:@"tktno"] forKey:@"cussRequest.tktno"];
    [request setPostValue:[dictionary objectForKey:@"segIndex"] forKey:@"cussRequest.segIndex"];
    [request setPostValue:[dictionary objectForKey:@"passName"] forKey:@"cussRequest.passName"];
    [request setPostValue:[dictionary objectForKey:@"org"] forKey:@"cussRequest.org"];
    [request setPostValue:[dictionary objectForKey:@"airline"] forKey:@"cussRequest.airline"];
    [request setPostValue:[dictionary objectForKey:@"orgId"] forKey:@"cussRequest.orgId"];
    [request setPostValue:[dictionary objectForKey:@"symbols"] forKey:@"cussRequest.symbols"];
    
    [request setPostValue:[[[[[responseDictionary objectForKey:@"idInfo"] objectForKey:@"arrayOfXsdString"] objectAtIndex:0] objectForKey:@"string"] objectAtIndex:1] forKey:@"cussRequest.userId"];
    
    dictionary = [[[responseDictionary objectForKey:@"pass"] objectForKey:@"wsPrPassenger"] objectAtIndex:0];
    
    [request setPostValue:[dictionary objectForKey:@"nameCh"] forKey:@"pass.nameCh"];
    [request setPostValue:[dictionary objectForKey:@"name"] forKey:@"pass.name"];
    [request setPostValue:[dictionary objectForKey:@"ffpNumber"] forKey:@"pass.ffpNumber"];
    [request setPostValue:[dictionary objectForKey:@"seatNo"] forKey:@"pass.seatNo"];
    [request setPostValue:[dictionary objectForKey:@"um"] forKey:@"pass.um"];
    
    [request setPostValue:[dictionary objectForKey:@"ffpNumber"] forKey:@"ffpNum"];
    
    dictionary = [responseDictionary objectForKey:@"segment"];
    
    [request setPostValue:[dictionary objectForKey:@"depAirportCode"] forKey:@"segment.depAirportCode"];
    [request setPostValue:[dictionary objectForKey:@"arrAirportCode"] forKey:@"segment.arrAirportCode"];
    [request setPostValue:[dictionary objectForKey:@"flightNo"] forKey:@"segment.flightNo"];
    [request setPostValue:[dictionary objectForKey:@"cabin"] forKey:@"segment.cabin"];
    
    dictionary = [dictionary objectForKey:@"depTime"];
    
    NSNumber *year = [dictionary objectForKey:@"year"];
    NSNumber *month = [dictionary objectForKey:@"month"];
    NSNumber *day = [dictionary objectForKey:@"day"];
    NSNumber *hour = [dictionary objectForKey:@"hour"];
    NSNumber *minute = [dictionary objectForKey:@"minute"];
    NSNumber *second = [dictionary objectForKey:@"second"];
    NSNumber *fractionalSecond = [dictionary objectForKey:@"fractionalSecond"];
    NSNumber *timezone = [dictionary objectForKey:@"timezone"];
    
    NSString *string = [NSString stringWithFormat:@"%.2ld-%.2d-%.2ldT%.2ld:%.2ld:%.2d%.2f%dZ", [year longValue], [month intValue], [day longValue], [hour longValue], [minute longValue], [second intValue], [fractionalSecond floatValue], [timezone intValue]];
    
    [request setPostValue:string forKey:@"segment.depTime"];
    
    [request setPostValue:[map currentSelected] forKey:@"seatNos"];
    
    [request setPostValue:@"HU" forKey:@"ffpAirline"];
    
    [request setPostValue:[[responseDictionary objectForKey:@"seatMap"] objectForKey:@"baseCabin"] forKey:@"baseCabin"];
    [request setPostValue:[[[[[responseDictionary objectForKey:@"idInfo"] objectForKey:@"arrayOfXsdString"] objectAtIndex:0] objectForKey:@"string"] objectAtIndex:0] forKey:@"idInfoType"];
    [request setPostValue:[[[[[responseDictionary objectForKey:@"idInfo"] objectForKey:@"arrayOfXsdString"] objectAtIndex:0] objectForKey:@"string"] objectAtIndex:1] forKey:@"idInfo"];
    
    [request setPostValue:HWID_VALUE forKey:KEY_hwId];
    [request setPostValue:SOURCE_VALUE forKey:KEY_source];
    [request setPostValue:SERVICECode_VALUE forKey:KEY_serviceCode];
    [request setPostValue:EDITION_VALUE forKey:KEY_edition];
    
    [request setCompletionBlock:^(void){
        
        NSData *response = [request responseData];
        
        NSString *re = [request responseString];
        NSLog(@"%@\n", re);
        
        NSError *error = nil;
        
        NSDictionary *responseDict = [response objectFromJSONDataWithParseOptions:JKParseOptionNone error:&error];
        
        if(error != nil)
        {
            NSLog(@"JSON Parse Failed\n");
        }
        else
        {
            NSDictionary *result = [responseDict objectForKey:@"result"];
            
            if([[result objectForKey:@"resultCode"] isEqualToString:@""])
            {
                for(NSString *string in [responseDict allKeys])
                {
                    NSLog(@"%@\n",string);
                }
                for(NSString *string in [responseDict allValues])
                {
                    NSLog(@"%@\n",string);
                }
                
                FlightInformationViewController *flightInfo = [[FlightInformationViewController alloc] init];
                
                flightInfo.org = self.org;
                flightInfo.passName = self.passName;
                flightInfo.idNo = @"";
                
                [self.navigationController pushViewController:flightInfo animated:YES];
                [flightInfo release];
            }
            else
            {
                alertMessage = [[UIAlertView alloc] initWithTitle:[result objectForKey:@"resultCode"] message:[result objectForKey:@"message"] delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
                [alertMessage show];
                [alertMessage release];
            }
        }
    }];
    
    [request setFailedBlock:^(void){
        alertMessage = [[UIAlertView alloc] initWithTitle:@"" message:@"网络无响应，请稍后再试" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [alertMessage show];
        [alertMessage release];
    }];
    
    [request setDelegate:self];
    [request startAsynchronous];
}

@end
