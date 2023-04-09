//
//  NotifUtils.swift
//  STA_Mobile academy-iOS
//
//  Created by Bellaala Mohamed on 7/4/2023.
//

import Foundation
import UserNotifications

class NotificationUtils {
    
    func checkPermissions() -> Bool {
        
        var isPermitted = false
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
            
            if success {
                isPermitted = true
            } else if let error = error {
                isPermitted = false
                print(error.localizedDescription)
            }
        }
        
        return isPermitted
    }

    
    func createNotification(
        date: Date,
        title: String,
        body: String
    ) {
        
        var trigger: UNNotificationTrigger?
        
        let dateComponents = Calendar.current.dateComponents([.hour, .minute], from: date)
        trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.sound = UNNotificationSound.default
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
        
    }

}
