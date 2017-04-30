//
//  ViewController.swift
//  userNoti
//
//  Created by harry on 2017. 4. 30..
//  Copyright © 2017년 harry. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 1. 권한 요청 부분

        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound], completionHandler: {(granted,error) in
            
            
            //permission이 있으면
            if granted{
                print("Notification access granted")
            }else{
                print(error?.localizedDescription as Any)
            }
            
        })
    }
    
    @IBAction func notifyButtonTapped(sender: UIButton){
        
        scheduleNotification(inSeconds: 5, completion: {success in
            
            if success{
                print("성공")
            }else{
                print("error")
            }
        })
    }
    
    
    
    //아래 함수는 notification을 일으키는 함수에 대한 정의
    //@escaping은 클로저 내용이다.
    func scheduleNotification(inSeconds: TimeInterval, completion: @escaping (_ Success: Bool) -> ()){
        
        //add and atachment
        guard let imageUrl = Bundle.main.url(forResource: "rick_grimes", withExtension: "gif")else{
            completion(false)
            return
        }
        
        var attachment: UNNotificationAttachment
        
        attachment = try! UNNotificationAttachment(identifier: "myNotification", url: imageUrl, options: .none)
        
        let notif = UNMutableNotificationContent()
        
        //익스텐션을 위함
        notif.categoryIdentifier = "myNotificationCategory"
        notif.title = "알람입니다"
        notif.subtitle = "일어날 시간이에요!"
        notif.body = "ios10의 새로운 기능 알람이라구요!"
        
        //attachment 인스턴스로 정의
        notif.attachments = [attachment]
        
        let notiTrigger = UNTimeIntervalNotificationTrigger(timeInterval: inSeconds, repeats: false)
        
        let request = UNNotificationRequest(identifier: "myNotification", content: notif, trigger: notiTrigger)
        
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: { error in
        
            if error != nil{
                print(error?.localizedDescription as Any)
                completion(false)
            }else{
                completion(true)
            }
        })
    }
}

