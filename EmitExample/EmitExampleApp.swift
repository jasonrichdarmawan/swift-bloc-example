//
//  EmitExampleApp.swift
//  EmitExample
//
//  Created by Jason Rich Darmawan Onggo Putra on 22/11/23.
//

import SwiftUI

@main
struct EmitExampleApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                ContentView(viewModel: ContentViewModel(count: 0))
                    .tabItem {
                        Text("Content")
                    }
                
                ContentWithStateView(viewModel: ContentWithStateViewModel())
                    .tabItem {
                        Text("ContentWithState")
                    }
            }
            .preferredColorScheme(.light)
        }
    }
}
