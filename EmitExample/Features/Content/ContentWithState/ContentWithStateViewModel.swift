//
//  ContentWithStateViewModel.swift
//  EmitExample
//
//  Created by Jason Rich Darmawan Onggo Putra on 22/11/23.
//

import Foundation

final class ContentWithStateViewModel: ViewModel<ContentState> {
    override init() {
        super.init()
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
        emit(state.with({
            $0.onSubmitStatus = .loading
        }))
        
        let result = await fetchContent()
        
        result.fold { item in
            emit(state.with({
                $0.count += 1
                $0.onSubmitStatus = .success
            }))
        } errorTransform: { error in
            emit(state.with({
                $0.count -= 1
                $0.onSubmitStatus = .failure
            }))
        }
    }
    
    func increment() {
        emit(state.with({
            $0.count += 1
        }))
    }
    
    func decrement() {
        emit(state.with({
            $0.count -= 1
        }))
    }
}
