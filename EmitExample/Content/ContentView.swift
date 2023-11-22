//
//  ContentView.swift
//  EmitExample
//
//  Created by Jason Rich Darmawan Onggo Putra on 22/11/23.
//

import SwiftUI

struct ContentView: View {
    @State var count: Int = 0
    
    @ObservedObject var viewModel: ContentViewModel
    
    var body: some View {
        VStack(spacing: 8) {
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
            
            HStack(spacing: 0) {
                Button {
                    viewModel.count -= 1
                } label: {
                    Image(systemName: "minus.circle")
                }
                Text("\(viewModel.count)")
                    .onAppear {
                        print("\(type(of: self)) \(viewModel.count)")
                    }
                Button {
                    viewModel.count += 1
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
    ContentView(
        viewModel: ContentViewModel(count: 0)
    )
}
