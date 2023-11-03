//
//  WebServiceProtocol.swift
//  PokedexApp
//
//  Created by Yakup on 3.11.2023.
//

import Foundation

protocol WebServiceProtocol{
	func fetchAllPokemons(completion: @escaping (Result<AllPokemons, CustomError>) -> ())
	func searchAllPokemonsByName(withName name: String, completion: @escaping (Result<Pokemon, CustomError>) -> ())
	func fetchPokemon(withId id: Int,completion: @escaping (Result<Pokemon, CustomError>) -> ())
	func fetchPokemonDescription(withId id: Int, completion: @escaping (Result<PokemonSpecies, CustomError>) -> Void)
}
