//
//  ContentWithStateView.swift
//  EmitExample
//
//  Created by Jason Rich Darmawan Onggo Putra on 22/11/23.
//

import SwiftUI

struct ContentWithStateView: View {
    @State var count: Int = 0
    
    @ObservedObject var viewModel: ContentWithStateViewModel
    
    var body: some View {
        VStack(spacing: 8) {
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
            
            HStack(spacing: 0) {
                Button {
                    viewModel.decrement()
                } label: {
                    Image(systemName: "minus.circle")
                }
                Text("\(viewModel.state.count)")
                    .onAppear {
                        print("\(type(of: self)) \(viewModel.state.count)")
                    }
                Button {
                    viewModel.increment()
                } label: {
                    Image(systemName: "plus.circle")
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onReceive(viewModel.objectWillChange, perform: { _ in
            print("\(type(of: self)) viewModel will change. count: \(count)")
            count += 1
        })

    }
}

#Preview {
    ContentWithStateView(
        viewModel: ContentWithStateViewModel()
    )
}
