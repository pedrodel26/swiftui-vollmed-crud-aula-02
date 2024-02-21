//
//  Appointment.swift
//  Vollmed
//
//  Created by Pedro Delmondes  on 19/02/2024.
//

import Foundation

struct Appointment: Identifiable, Codable {
    let id: String
    let date: String
    let specialist: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case date = "data"
        case specialist = "especialista"
    }
}
