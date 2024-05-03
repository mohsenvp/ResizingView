//
//  AppApp.swift
//  App
//
//  Created by Mohsen on 29/04/2024.
//

import SwiftUI

@main
struct AppApp: App {
    @StateObject private var model = TestModel()
    
    let info = CardComponentInfo(origin: .init(x: 300, y: 300), size: .init(width: 200, height: 200))
    
    var body: some Scene {
        WindowGroup("Ensemble") {
//            ZStack {
//                Color.white
                TestComponentView(info: info, model: model)
//            }
//            .frame(width: 1000, height: 1000)
        }
    }
}







