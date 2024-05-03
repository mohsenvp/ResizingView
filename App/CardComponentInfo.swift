//
//  CardComponentInfo.swift
//  App
//
//  Created by Mohsen on 29/04/2024.
//

import Foundation

class CardComponentInfo: Identifiable, ObservableObject {

    let id: UUID
//    let type: CardComponentViewType
    @Published var origin: CGPoint
    @Published var size: CGSize
    
    init(id: UUID = UUID(), origin: CGPoint, size: CGSize) {
        self.id = id
//        self.type = type
        self.origin = origin
        self.size = size
    }
}
