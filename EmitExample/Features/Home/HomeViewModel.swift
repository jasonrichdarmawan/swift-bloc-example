//
//  HomeViewModel.swift
//  EmitExample
//
//  Created by Jason Rich Darmawan Onggo Putra on 23/11/23.
//

import SwiftUI

final class HomeViewModel: ObservableObject {
    @Published var selectedViewType: HomeViewType
    
    init(params: HomeViewModelParams) {
        self.selectedViewType = params.initialSelectedViewType
    }
}
