//
//  SheetViewModel.swift
//  EmitExample
//
//  Created by Jason Rich Darmawan Onggo Putra on 23/11/23.
//

import Foundation

final class SheetViewModel: ObservableObject {
    let id: UUID = UUID()
    
    @Published var count: Int
    @Published var selectedViewType: SheetViewType
    
    init(
        params: SheetViewModelParams
    ) {
        self.count = params.initialCount
        self.selectedViewType = params.initialViewType
        print("\(type(of: self)) \(#function) \(id)")
    }
    
    deinit {
        print("\(type(of: self)) \(#function) \(id)")
    }
}
