//
//  DomainModelConvertible.swift
//  MovieApp
//
//  Created by Полина Толстенкова on 17.02.2023.
//

import Foundation

protocol DomainModelConvertible {
    associatedtype DomainModelType
    func toDomainModel() -> DomainModelType
}
