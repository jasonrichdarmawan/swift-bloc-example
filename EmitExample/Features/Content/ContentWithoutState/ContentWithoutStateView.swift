//
//  ContentView.swift
//  EmitExample
//
//  Created by Jason Rich Darmawan Onggo Putra on 22/11/23.
//

import SwiftUI

struct ContentWithoutStateView: View {
    @State var renderCount: Int = 0
    
    @StateObject var viewModel: ContentWithoutStateViewModel
    
    init(params: ContentWithoutStateViewModelParams) {
        self._viewModel = StateObject(
            wrappedValue: ContentWithoutStateViewModel.shared(params: params)
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
            SheetView(params: params)
        }
    }
}

#Preview {
    let params = ContentWithoutStateViewModelParams(
        initialCount: 0,
        initialOnSubmitStatus: .initial,
        initialIsSheetPresented: false
    )
    return ContentWithoutStateView(params: params)
}
