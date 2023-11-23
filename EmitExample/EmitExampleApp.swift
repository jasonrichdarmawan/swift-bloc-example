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
            let params = HomeViewModelParams(initialSelectedViewType: .ContentWithoutState)
            HomeView(params: params)
                .preferredColorScheme(.light)
        }
    }
}
