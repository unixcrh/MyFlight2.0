//
//  LoginInNetworkHelper.h
//  JOSNAndTableView
//
//  Created by Davidsph on 12/18/12.
//  Copyright (c) 2012 david. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ServiceDelegate.h"

@interface LoginInNetworkHelper : NSObject

//登录操作 
+ (BOOL) requestWithUrl:(NSDictionary *) bodyDic delegate:(id<ServiceDelegate>) delegate;

//注册操作 
+ (BOOL) registerWithUrl:(NSDictionary *) bodyDic delegate:(id<ServiceDelegate>) delegate;

//查看账号信息 
+ (BOOL) getAccountInfo:(NSDictionary *) bodyDic delegate:(id<ServiceDelegate>) delegate;

//编辑账号 
+ (BOOL) editAccountInfo:(NSDictionary *) bodyDic delegate:(id<ServiceDelegate>) delegate;


//获取手机验证码
+ (BOOL) getSecretCode:(NSDictionary *) bodyDic andDelegat:(id<ServiceDelegate>) delegate;

//查询常用联系人 
+(BOOL) getCommonPassenger:(NSDictionary *) bodyDic delegate:(id<ServiceDelegate>) delegate;

//增加常用联系人
+ (BOOL) addCommonPassenger:(NSDictionary *) bodyDic delegate:(id<ServiceDelegate>) delegate;

//编辑常用联系人
+ (BOOL) editCommonPassenger:(NSDictionary *) bodyDic delegate:(id<ServiceDelegate>) delegate;





//找回密码操作
//找回密码操作

+ (BOOL) findPasswd_getSecrectCode:(NSString *) mobile andDelegate:(id<ServiceDelegate>) delegate;
+ (BOOL) findPasswd_VerCodeIsRight:(NSString *) mobile code:(NSString *) code andDelegate:(id<ServiceDelegate>) delegate;

+ (BOOL) findPassWd_ResetPassWdWithNewPwd:(NSString *) newPwd mobile:(NSString *) mobile code:(NSString *) code andDelegate:(id<ServiceDelegate>) delegate;
@end
