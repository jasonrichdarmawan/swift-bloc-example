//
//  ContentView.swift
//  EmitExample
//
//  Created by Jason Rich Darmawan Onggo Putra on 22/11/23.
//

import SwiftUI

struct ContentView: View {
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
                    print("\(self) \(#function) initial")
                }
            case .loading:
                ProgressView()
                    .onAppear {
                        print("\(self) \(#function) loading")
                    }
            case .success:
                Text("Success")
                    .onAppear {
                        print("\(self) \(#function) Success")
                    }
            case .failure:
                Text("Failure")
                    .onAppear {
                        print("\(self) \(#function) Failure")
                    }
            }
            
            HStack(spacing: 0) {
                Button {
                    viewModel.count -= 1
                } label: {
                    Image(systemName: "minus.circle")
                }
                Text("\(viewModel.count)")
                Button {
                    viewModel.count += 1
                } label: {
                    Image(systemName: "plus.circle")
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    ContentView(
        viewModel: ContentViewModel(count: 0)
    )
}