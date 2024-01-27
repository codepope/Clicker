//
//  ClickerApp.swift
//  Clicker
//
//  Created by Dj Walker-Morgan on 27/12/2023.
//

import SwiftUI

@main
struct ClickerApp: App {
    var body: some Scene {
        WindowGroup {
            ClickerView(seconds:10,ticking:false,count:0,remainSeconds:0)
        }
    }
}
