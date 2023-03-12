//
//  PostData.swift
//  H4X0RSwiftUI
//
//  Created by Giorgio Latour on 3/11/23.
//

import Foundation

struct Results: Codable {
    let hits: [Post]
}

struct Post: Codable, Identifiable {
    let objectID: String
    var id: String {
        return objectID
    }
    let title: String
    let points: Int
    let url: String?
}
