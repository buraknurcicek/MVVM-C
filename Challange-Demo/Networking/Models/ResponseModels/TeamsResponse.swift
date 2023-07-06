//
//  TeamsResponse.swift
//  Challange-Demo
//
//  Created by Burak Nurçiçek on 12.06.2023.
//

struct TeamsResponse: Decodable {
    let teams: [Team]?
}

struct Team: Decodable {
    let teamName: String?
}
