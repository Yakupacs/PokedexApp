//
//  WebServiceProtocol.swift
//  PokedexApp
//
//  Created by Yakup on 3.11.2023.
//

import Foundation

protocol WebServiceProtocol{
	func fetchAllPokemons(completion: @escaping (Result<[Pokemon], CustomError>) -> ())
	func searchAllPokemonsByName(completion: @escaping (Result<[Pokemon], CustomError>) -> ())
	func getNextPokemon(completion: @escaping (Result<Pokemon, CustomError>) -> ())
}
