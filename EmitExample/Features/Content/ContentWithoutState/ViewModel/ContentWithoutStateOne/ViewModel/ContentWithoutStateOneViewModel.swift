//
//  ContentViewModel.swift
//  EmitExample
//
//  Created by Jason Rich Darmawan Onggo Putra on 22/11/23.
//

import Foundation

final class ContentWithoutStateOneViewModel: ContentWithoutStateViewModel {
    @Published var count: Int
    @Published var onSubmitStatus: OnSubmitStatus
    
    @Published var isSheetPresented: Bool
    
    init(params: ContentWithoutStateViewModelOneParams) {
        self.count = params.initialCount
        self.onSubmitStatus = params.initialOnSubmitStatus
        self.isSheetPresented = params.initialIsSheetPresented
        print("\(type(of: self)) \(#function)")
    }
    
    deinit {
        print("\(type(of: self)) \(#function)")
    }
    
    func fetchContent() async -> Result<Bool, Error> {
        sleep(1)
        return .success(true)
    }
    
    @MainActor
    func onSubmit() async {
        onSubmitStatus = .loading
        
        let result = await fetchContent()
        
        result.fold { success in
            count += 1
            onSubmitStatus = .success
        } errorTransform: { failure in
            count -= 1
            onSubmitStatus = .failure
        }

    }
}
