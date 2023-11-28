//
//  ContentWithoutStateViewModel.swift
//  EmitExample
//
//  Created by Jason Rich Darmawan Onggo Putra on 28/11/23.
//

import Foundation

protocol ContentWithoutStateViewModel: ObservableObject {
    associatedtype P = ContentWithoutStateViewModelParams
    
    var count: Int { get set }
    var onSubmitStatus: OnSubmitStatus { get set }
    var isSheetPresented: Bool { get set }
    
    func fetchContent() async -> Result<Bool, Error>
    func onSubmit() async
    
    init(params: P)
}
