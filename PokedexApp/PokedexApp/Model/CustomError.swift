//
//  Error.swift
//  PokedexApp
//
//  Created by Yakup on 3.11.2023.
//

import Foundation

enum CustomError: Error {
	case urlError
	case serverError
	case decodingError
	case networkError
}
