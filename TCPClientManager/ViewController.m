//
//  ViewController.m
//  TCPClientManager
//
//  Created by liangjianfeng on 15/6/4.
//  Copyright (c) 2015年 MathewWang. All rights reserved.
//

#import "ViewController.h"
#import "DDTcpServer.h"
#import "LoginAPI.h"
#import "DDMsgServer.h"
#import "UIView+Positioning.h"
#import "SendMessageAPI.h"
#import "DDReceiveMessageAPI.h"
#import "DDMessageSendManager.h"
#import "MessageEntity.h"
#import "AppDelegate.h"
#import "DDClientStateMaintenanceManager.h"
#import "LoginModule.h"
#import "ReceiveServerHeartBeatAPI.h"

@interface ViewController (){
    UILabel* lbName;
    UILabel* lbPwd;
    UITextField* nameField;
    UITextField* pwdField;
    UIButton* confirmBtn;
    UITextField* receivedValue;
    UITextField* ipField;
    BOOL isMsg;
    NSString* loginName;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"请登录";
    
    AppDelegate * applicationDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    [applicationDelegate.controls setObject:self forKey:@"viewController"];
    
    CGRect mainRect = [UIScreen mainScreen].bounds;
    CGFloat screenWidth = mainRect.size.width;
    CGFloat screenHeight = mainRect.size.height;
    
    //接受到的消息
    receivedValue = [[UITextField alloc] initWithFrame:CGRectMake(15, 70, screenWidth - 30, 100)];
    receivedValue.layer.borderWidth = 0.5;
    receivedValue.text = @"收到数据：";
    
    [self.view addSubview:receivedValue];
    
    ipField = [[UITextField alloc] initWithFrame:CGRectMake(15, receivedValue.bottom + 5, screenWidth - 30, 20)];
    ipField.layer.borderWidth = 0.5;
    ipField.text = @"192.168.2.103";
    
    [self.view addSubview:ipField];
    
    //密码
    lbPwd = [[UILabel alloc] initWithFrame:CGRectMake(30, 0, 60, 40)];
    lbPwd.text = @"密码：";
    lbPwd.center = CGPointMake(lbPwd.centerX, screenHeight / 2.0);
    
    [self.view addSubview:lbPwd];
    
    //pwdField
    pwdField = [[UITextField alloc] initWithFrame:CGRectMake(lbPwd.right, lbPwd.y, screenWidth - 30 - 60 - 30, 40)];
    pwdField.layer.borderWidth = 0.5;
    
    [self.view addSubview:pwdField];
    
    //姓名
    lbName = [[UILabel alloc] initWithFrame:CGRectMake(lbPwd.x, lbPwd.y - 10 - 40, 60, 40)];
    lbName.text = @"姓名：";
    
    [self.view addSubview:lbName];
    
    //nameField
    nameField = [[UITextField alloc] initWithFrame:CGRectMake(lbName.right, lbName.y, screenWidth - 30 - 60 - 30, 40)];
    nameField.layer.borderWidth = 0.5;
    
    [self.view addSubview:nameField];
    
    //确定按钮
    confirmBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    confirmBtn.frame =  CGRectMake(0, lbPwd.bottom + 10, 100, 40);
    [confirmBtn setTitle:@"确定" forState:UIControlStateNormal];
    confirmBtn.layer.borderWidth = 0.5;
    confirmBtn.center = CGPointMake(screenWidth / 2.0, confirmBtn.centerY);
    [confirmBtn addTarget:self action:@selector(clickConfim) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:confirmBtn];
    
    //隐藏键盘
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]   initWithTarget:self action:@selector(dismissKeyBoard)];
    [self.view addGestureRecognizer:tap];
    
    //注册用户状态监测
    [DDClientStateMaintenanceManager shareInstance];
    //注册手消息回调
    [self registerReceiveMsg];
}

//触摸键盘以为的地方关闭键盘
-(void)dismissKeyBoard
{
    [nameField resignFirstResponder];
    [pwdField resignFirstResponder];
}

-(void)clickConfim{

    if (isMsg) {
        [self sendMsgToOther];
    }else{
        if (nameField.text.length <= 0 || pwdField.text.length <= 0) {
            return;
        }
        
        if (![pwdField.text intValue] || [pwdField.text intValue] <= 0) {
            return;
        }
        
        LoginModule* loginModule = [LoginModule instance];
        loginModule.priorIP = ipField.text;
        [loginModule loginWithUsername:nameField.text password:pwdField.text success:^(id object) {
            NSDictionary* dict = (NSDictionary*)object;
            receivedValue.text =[NSString stringWithFormat:@"收到数据：%@",[dict objectForKey:@"result"] ];
            loginName = nameField.text;
            NSLog(@"登录验证成功。。。。");
            
            pwdField.text = @"";
            nameField.text = @"";
            [confirmBtn setTitle:@"发送" forState:UIControlStateNormal];
            lbName.text = @"发送给:";
            lbPwd.text = @"数据:";
            isMsg = YES;
        } failure:^(NSString *error) {
            NSLog(@"登录验证失败");
        }];
    }
    
}

- (void)sendMsgToOther{
    MessageEntity* message = [[MessageEntity alloc] init];
    message.MsgType = MsgTypeMsgTypeSingleText;
    message.msgContent =  @[@"mathew",nameField.text,pwdField.text];
    
    [[DDMessageSendManager instance] sendMessage:message completion:^(MessageEntity* theMessage,NSError *error) {
        pwdField.text = @"";
        NSLog(@"发送消息成功。。。");
        
    } Error:^(NSError *error) {
        NSLog(@"发送消息失败。。。");
    }];
}

-(void)registerReceiveMsg{
    //注册收到消息
    DDReceiveMessageAPI* receiveMessageAPI = [[DDReceiveMessageAPI alloc] init];
    [receiveMessageAPI registerAPIInAPIScheduleReceiveData:^(id object, NSError *error) {
               receivedValue.text =[NSString stringWithFormat:@"收到数据：%@",object];
                NSLog(@"收到消息。。。。");
        }];
    
    //注册收到服务器心跳
    ReceiveServerHeartBeatAPI* serverHeartBeatAPI = [[ReceiveServerHeartBeatAPI alloc] init];
    [serverHeartBeatAPI registerAPIInAPIScheduleReceiveData:^(id object, NSError *error) {
        NSLog(@"收到服务器的心跳包。。。。。。");
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
