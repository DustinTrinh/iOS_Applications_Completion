//
//  AppStates.swift
//  ChatApp_Firebase
//
//  Created by DustyTheCutie on 2023-06-17.
//

import Foundation

enum LoadingStates: Hashable, Identifiable {
    case idle
    case loading(String)
    
    var id: Self {
        return self
    }
}

enum Routes: Hashable{
    case authentication
    case signup
    case login
    case main

}

class AppStates: ObservableObject {
    @Published var routes: [Routes] = []
    @Published var loadingStates: LoadingStates = .idle
    @Published var errorWrapper: ErrorWrapper?
    
}
