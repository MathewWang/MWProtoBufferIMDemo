//
//  NotificationHelp.m
//
//  Created by MathewWang on 15/6/4.
//  Copyright (c) 2015年 Jiamian. All rights reserved.
//

#import "DDNotificationHelp.h"

NSString* const DDNotificationRemoveSession = @"Notification_Remove_Session";
NSString* const DDNotificationTcpLinkConnectComplete = @"Notification_Tcp_Link_connect_complete";
NSString* const DDNotificationTcpLinkConnectFailure = @"Notification_Tcp_Link_conntect_Failure";
NSString* const DDNotificationTcpLinkDisconnect = @"Notification_Tcp_link_Disconnect";
NSString* const DDNotificationStartLogin = @"Notification_Start_login";
NSString* const DDNotificationServerHeartBeat = @"Notification_Server_heart_beat";
NSString* const DDNotificationUserLoginSuccess = @"Notification_user_login_success";

NSString *const DDNotificationLogout =
    @"Notification_user_logout";
NSString* const DDNotificationUserLoginFailure = @"Notification_user_login_failure";
NSString* const DDNotificationUserReloginSuccess = @"Notification_user_relogin_success";
NSString* const DDNotificationUserOffline = @"Notification_user_off_line";
NSString* const DDNotificationUserKickouted = @"Notification_user_kick_out";
NSString* const DDNotificationUserInitiativeOffline = @"Notification_user_initiative_Offline";
NSString* const DDNotificationReloadTheRecentContacts = @"Notification_reload_recent_contacts";

NSString* const DDNotificationReceiveMessage = @"Notification_receive_message";
NSString* const DDNotificationReceiveP2PShakeMessage = @"Notification_receive_P2P_Shake_message";
NSString* const DDNotificationReceiveP2PInputingMessage = @"Notifictaion_receive_P2P_Inputing_message";
NSString* const DDNotificationReceiveP2PStopInputingMessage = @"Notification_receive_P2P_StopInputing_message";
NSString* const DDNotificationLoadLocalGroupFinish = @"Notification_local_group";

//---------------------------------------------------------------------------------------------------
NSString* const DDNotificationRecentContactsUpdate = @"Notification_RecentContactsUpdate";
@implementation DDNotificationHelp
+ (void)postNotification:(NSString*)notification userInfo:(NSDictionary*)userInfo object:(id)object
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [[NSNotificationCenter defaultCenter] postNotificationName:notification object:object userInfo:userInfo];
    });
}
@end
