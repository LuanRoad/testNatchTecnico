//
//  Response.swift
//  testNatch2022
//
//  Created by Luan Road on 22/04/22.
//

import Foundation

struct Response: Decodable {
    let colors:[String]?
    let questions: [Questions]
    
    enum CodingKeys: String, CodingKey {
        case colors
        case questions
    }
}

struct Questions: Decodable {
    let total: Int
    let text: String
    let chartData: [ChartData]
    
    enum CodingKeys: String, CodingKey {
        case total
        case text
        case chartData
    }
}

struct ChartData: Decodable {
    let text: String
    let percetnage: Int
    
    enum CodingKeys: String, CodingKey {
        case text
        case percetnage
    }
}
