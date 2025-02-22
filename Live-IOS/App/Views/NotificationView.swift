//
//  NotificationView.swift
//  Live-IOS
//
//  Created by Kyle Chart on 22/02/2025.
//

import SwiftUI

///Values of the NotificationView from the notification interaction
enum NotificationView: String, Identifiable {
    case fine, notification
    
    //Allows a sheet to be preseneted from the Identifiable property
    var id: String {
        self.rawValue
    }
    
    ///Check what the value is and return the required view
    @ViewBuilder
    func view() -> some View {
        switch self {
        case .fine:
            //Add in custom views to display on a sheet. Reference via Git repo
            Text("New Fine")
        case .notification:
            Text("Notification")
        }
    }
}
