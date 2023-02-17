//
//  Genre.swift
//  MovieApp
//
//  Created by Полина Толстенкова on 08.02.2023.
//

import Foundation

struct TickerDetailsDTO: Decodable {
    let results: DetailsResult
}

struct DetailsResult: Decodable {

    let name: String
    let employees: Int
    let branding: Branding?
    let url: URL
    
    enum CodingKeys: String, CodingKey {
        case name
        case employees = "total_employees"
        case branding
        case url = "homepage_url"
    }
}

struct Branding: Decodable {
    let icon: URL?
    
    enum CodingKeys: String, CodingKey {
        case icon = "icon_url"
    }
}

extension TickerDetailsDTO: DomainModelConvertible {
    func toDomainModel() -> TickerDetails {
        return results.toDomainModel()
    }
}

extension DetailsResult: DomainModelConvertible {
    func toDomainModel() -> TickerDetails {
        return TickerDetails(
            name: name,
            employees: employees,
            icon: branding?.icon,
            websiteURL: url
        )
    }
}
