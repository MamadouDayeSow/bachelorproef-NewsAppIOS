//
//  NewsAppSwiftUIApp.swift
//  Shared
//
//  Created by Daye Sow on 04/05/2022.
//

import SwiftUI

@main
struct NewsAppSwiftUIApp: App {
    @StateObject var movieViewmodel: NewsViewModel = NewsViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(movieViewmodel)
        }
    }
}
