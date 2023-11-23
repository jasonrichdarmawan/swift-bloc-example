//
//  ContentWithStateView.swift
//  EmitExample
//
//  Created by Jason Rich Darmawan Onggo Putra on 22/11/23.
//

import SwiftUI

struct ContentWithStateView: View {
    @State var renderCount: Int = 0
    
    @StateObject var viewModel: ContentWithStateViewModel
    
    init(
        initialState: ContentState
    ) {
        self._viewModel = StateObject(
            wrappedValue: ContentWithStateViewModel.shared(initialState: initialState)
        )
    }
    
    var body: some View {
        VStack(spacing: 8) {
            Text("Content With State")
            
            switch viewModel.state.onSubmitStatus {
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
            
            // how to pass Binding if we use BLoC?
            VStack(spacing: 8) {
                Text("Content With State's Counter")
                
                HStack(spacing: 8) {
                    Button {
                        viewModel.decrement()
                    } label: {
                        Image(systemName: "minus.circle")
                    }
                    
                    Text("\(viewModel.state.count)")
                    
                    Button {
                        viewModel.increment()
                    } label: {
                        Image(systemName: "plus.circle")
                    }
                }
            }
            .padding(.all, 16)
            .border(.secondary)
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
    let initialState = ContentState()
    return ContentWithStateView(initialState: initialState)
}
