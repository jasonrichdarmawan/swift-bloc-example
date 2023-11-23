//
//  SheetView.swift
//  EmitExample
//
//  Created by Jason Rich Darmawan Onggo Putra on 23/11/23.
//

import SwiftUI

struct SheetView: View {
    @State var renderCount: Int = 0
    
    @StateObject var viewModel: SheetViewModel
    
    init(params: SheetViewModelParams) {
        self._viewModel = StateObject(wrappedValue: SheetViewModel.shared(params: params))
    }
    
    var body: some View {
        VStack(spacing: 8) {
            Text("Sheet")
            
            CountComponent(
                count: $viewModel.count,
                onDecrement: {
                    viewModel.count -= 1
                },
                onIncrement: {
                    viewModel.count += 1
                }
            )
            
            Button {
                viewModel.selectedViewType = .List
            } label: {
                Text("show the sheet list")
            }
            
            Button {
                viewModel.selectedViewType = .New
            } label: {
                Text("show the sheet new")
            }
            
            switch viewModel.selectedViewType {
            case .List:
                let params = SheetListViewModelParams(initialCount: 0)
                SheetListView(params: params)
            case .New:
                let params = SheetNewViewModelParams(initialCount: 0)
                SheetNewView(params: params)
            }
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
    let params = SheetViewModelParams(
        initialCount: 0, 
        initialViewType: .List
    )
    return SheetView(params: params)
}
