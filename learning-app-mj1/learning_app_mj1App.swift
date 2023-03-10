//
//  learning_app_mj1App.swift
//  learning-app-mj1
//
//  Created by Mohammad Jamali on 2/18/23.
//

import SwiftUI

@main
struct learning_app_mj1App: App {
    var body: some Scene {
        WindowGroup {
            homeview().environmentObject(contentmodelCVM())
        }
    }
}
