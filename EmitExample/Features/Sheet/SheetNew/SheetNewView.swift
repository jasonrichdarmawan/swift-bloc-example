//
//  SheetNewView.swift
//  EmitExample
//
//  Created by Jason Rich Darmawan Onggo Putra on 23/11/23.
//

import SwiftUI

struct SheetNewView: View {
    @State var renderCount = 0
    
    @StateObject var viewModel: SheetNewViewModel
    
    init(params: SheetNewViewModelParams) {
        self._viewModel = StateObject(
            wrappedValue: SheetNewViewModel.shared(params: params)
        )
    }
    
    var body: some View {
        VStack(spacing: 8) {
            Text("Sheet New")
            
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
    let params = SheetNewViewModelParams(initialCount: 0)
    return SheetNewView(params: params)
}
