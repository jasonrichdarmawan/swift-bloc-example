//
//  SheetListView.swift
//  EmitExample
//
//  Created by Jason Rich Darmawan Onggo Putra on 23/11/23.
//

import SwiftUI

struct SheetListView: View {
    @State var renderCount: Int = 0
    
    @StateObject var viewModel: SheetListViewModel
    
    init(params: SheetListViewModelParams) {
        self._viewModel = StateObject(
            wrappedValue: SheetListViewModel.shared(params: params)
        )
    }
    
    var body: some View {
        VStack(spacing: 8) {
            Text("Sheet List")
            
            CountComponent(
                count: $viewModel.count,
                onDecrement: {
                    viewModel.count -= 1
                },
                onIncrement: {
                    viewModel.count += 1
                }
            )
        }
        .padding(.all, 16)
        .border(.secondary)
        .onReceive(viewModel.objectWillChange, perform: { _ in
            renderCount += 1
            print("\(type(of: self)) viewModel will change. count: \(renderCount)")
        })
    }
}

#Preview {
    let params = SheetListViewModelParams(initialCount: 0)
    return SheetListView(params: params)
}
