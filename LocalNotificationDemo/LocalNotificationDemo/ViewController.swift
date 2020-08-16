//
//  ViewController.swift
//  LocalNotificationDemo
//
//  Created by Amr Hesham on 8/16/20.
//  Copyright © 2020 Amr Hesham. All rights reserved.
//

import UIKit
import UserNotifications
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Register", style: .plain, target: self, action: #selector(registerLocal))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Schedule", style: .plain, target: self, action: #selector(scheduleLocal))
        // Do any additional setup after loading the view.
    }
    @objc func registerLocal() {
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .badge, .sound]) { (granted, error) in
            if granted{
                print("granted")
            }else{
                print("not granted")
            }
        }
    }

    @objc func scheduleLocal() {
        let center = UNUserNotificationCenter.current()
        center.removeAllPendingNotificationRequests()
        // content
        let content = UNMutableNotificationContent()
        content.title = "Gym wake up call"
        content.body = "You have to wake up now lazy boy !!"
        content.sound = .default
        
        // when to show content
        var dateComponents  = DateComponents()
        dateComponents.hour = 1
        dateComponents.minute = 5
//        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        // add request to notifi ation center
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        center.add(request)

    }

}

