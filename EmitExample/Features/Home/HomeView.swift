//
//  HomeView.swift
//  EmitExample
//
//  Created by Jason Rich Darmawan Onggo Putra on 23/11/23.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel: HomeViewModel
    
    init(params: HomeViewModelParams) {
        self._viewModel = StateObject(
            wrappedValue: HomeViewModel.shared(params: params)
        )
    }
    
    var body: some View {
        VStack(spacing: 8) {
            VStack(spacing: 8) {
                Button {
                    viewModel.selectedViewType = .ContentWithoutState
                } label: {
                    Text("show Content Without State")
                }
                
                Button {
                    viewModel.selectedViewType = .ContentWithState
                } label: {
                    Text("show Content With State")
                }
            }
            
            switch viewModel.selectedViewType {
            case .ContentWithoutState:
                let params = ContentWithoutStateViewModelParams(
                    initialCount: 0,
                    initialOnSubmitStatus: .initial,
                    initialIsSheetPresented: false
                )
                ContentWithoutStateView(params: params)
            case .ContentWithState:
                ContentWithStateView()
            }
        }
        .padding(.all, 16)
        .border(.secondary)
    }
}

#Preview {
    let params = HomeViewModelParams(
        initialSelectedViewType: .ContentWithoutState
    )
    return HomeView(params: params)
}
