//
//  ContentView.swift
//  EmitExample
//
//  Created by Jason Rich Darmawan Onggo Putra on 22/11/23.
//

import SwiftUI

struct ContentWithoutStateView<T: ContentWithoutStateViewModel>: View {
    @State var renderCount: Int = 0
    
    @StateObject var viewModel: T
    
    init(params: T.P) {
        self._viewModel = StateObject(
            wrappedValue: T.shared(params: params)
        )
    }
    
    var body: some View {
        VStack(spacing: 8) {
            Text("Content Without State")
            
            switch viewModel.onSubmitStatus {
            case .initial:
                Button {
                    Task {
                        await viewModel.onSubmit()
                    }
                } label: {
                    Text("Submit")
                }
                .onAppear {
                    print("\(type(of: self)) initial")
                }
            case .loading:
                ProgressView()
                    .onAppear {
                        print("\(type(of: self)) loading")
                    }
            case .success:
                Text("Success")
                    .onAppear {
                        print("\(type(of: self)) Success")
                    }
            case .failure:
                Text("Failure")
                    .onAppear {
                        print("\(type(of: self)) Failure")
                    }
            }
            
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
                viewModel.isSheetPresented = true
            } label: {
                Text("show the sheet")
            }
        }
        .padding(.all, 16)
        .border(.secondary)
        .onReceive(viewModel.objectWillChange, perform: { _ in
            renderCount += 1
            print("\(type(of: self)) viewModel will change. count: \(renderCount)")
        })
        .sheet(isPresented: $viewModel.isSheetPresented) {
            let params = SheetViewModelParams(
                initialCount: 0,
                initialViewType: .List
            )
            
            /**
             - Bug: ViewModel will not deinit. Use .init(params:)
             */
//            let viewModel = SheetViewModel(params: params)
//            SheetView(viewModel: viewModel)
            
            SheetView(params: params)
        }
    }
}

#Preview {
    let params = ContentWithoutStateViewModelOneParams()
    return ContentWithoutStateView<ContentWithoutStateOneViewModel>(params: params)
}
