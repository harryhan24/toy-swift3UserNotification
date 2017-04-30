//
//  AppDelegate.swift
//  userNoti
//
//  Created by harry on 2017. 4. 30..
//  Copyright © 2017년 harry. All rights reserved.
//

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //이걸 해주면 UserNoti를 앱 안에서 볼 수 있다.
        UNUserNotificationCenter.current().delegate = self
        
        //하단 정의한 notification category 추가 함수
        configureUserNotifications()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    private func configureUserNotifications(){
        
        //액션 추가
        let favAction = UNNotificationAction(identifier: "confirm", title: "😃 맘에드나요?", options: [])
        let dismissAction = UNNotificationAction(identifier: "dismiss", title: "마음에 들지 않아요!", options: [])
        
        
        //커스텀 형태의 notification 만들기
        let catagory = UNNotificationCategory(identifier: "myNotificationCategory", actions: [favAction, dismissAction], intentIdentifiers: [], options: [])
        
        //카테고리 추가
        UNUserNotificationCenter.current().setNotificationCategories([catagory])
    }


}

//이걸 해주면 UserNoti를 앱 안에서 볼 수 있다.
//Notification이 될때 해당 이벤트를 받아 completionHandler로 alert를 보낸다.
extension AppDelegate: UNUserNotificationCenterDelegate{
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler(.alert)
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        print("받은 응답 :  \(response.actionIdentifier)")
        completionHandler()
    }
}
