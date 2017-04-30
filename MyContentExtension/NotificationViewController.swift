//
//  NotificationViewController.swift
//  MyContentExtension
//
//  Created by harry on 2017. 5. 1..
//  Copyright © 2017년 harry. All rights reserved.
//

import UIKit
import UserNotifications
import UserNotificationsUI

class NotificationViewController: UIViewController, UNNotificationContentExtension {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any required interface initialization here.
    }
    
    
    func didReceive(_ notification: UNNotification) {
        
        
        //버튼을 여러번 눌러도 한번만 실행됨
        guard let attachment = notification.request.content.attachments.first else{
            return
        }
        
        // 사진 url에 access하기 위한 함수
        if attachment.url.startAccessingSecurityScopedResource(){
            
            //attachment.url이 있다면 imageData에 사진 url을 받기
            let imageData = try? Data.init(contentsOf: attachment.url)
            
            
            //imageData가 있다면 img에 넣고
            if let img = imageData{
                //그 이미지를 띄워준다.
                imageView.image = UIImage(data: img)
            }
            
        }
    }

}
