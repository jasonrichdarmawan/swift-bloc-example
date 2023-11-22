//
//  ContentWithStateViewModel.swift
//  EmitExample
//
//  Created by Jason Rich Darmawan Onggo Putra on 22/11/23.
//

import Foundation

final class ContentWithStateViewModel: ViewModel<ContentState> {
    @Published var count: Int
    
    init(
        count: Int
    ) {
        self.count = count
        super.init()
        print("\(self) \(#function)")
    }
    
    deinit {
        print("\(self) \(#function)")
    }
    
    func fetchContent() async -> Result<Bool, Error> {
        sleep(1)
        return .success(true)
    }
    
    @MainActor
    func onSubmit() async {
        emit(state.with({
            $0.onSubmitStatus = .loading
        }))
        
        let result = await fetchContent()
        
        result.fold { item in
            emit(state.with({
                $0.onSubmitStatus = .success
            }))
        } errorTransform: { error in
            emit(state.with({
                $0.onSubmitStatus = .failure
            }))
        }
    }
}
