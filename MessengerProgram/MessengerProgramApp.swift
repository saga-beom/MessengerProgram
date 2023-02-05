//
//  MessengerProgramApp.swift
//  MessengerProgram
//
//  Created by hyobeom seo on 2023/01/29.
//

import SwiftUI

@main
struct MessengerProgramApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
