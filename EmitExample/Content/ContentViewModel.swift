//
//  ContentViewModel.swift
//  EmitExample
//
//  Created by Jason Rich Darmawan Onggo Putra on 22/11/23.
//

import Foundation

final class ContentViewModel: ObservableObject {
    @Published var count: Int
    @Published var onSubmitStatus: OnSubmitStatus
    
    init(
        count: Int,
        onSubmitStatus: OnSubmitStatus = .initial
    ) {
        self.count = count
        self.onSubmitStatus = .initial
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

extension ContentViewModel: Equatable {
    static func == (lhs: ContentViewModel, rhs: ContentViewModel) -> Bool {
        return lhs.count == rhs.count &&
               lhs.onSubmitStatus == rhs.onSubmitStatus
    }
}
