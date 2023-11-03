//
//  WebService.swift
//  PokedexApp
//
//  Created by Yakup on 3.11.2023.
//

import Foundation

class WebService: WebServiceProtocol{

	private let decoder: JSONDecoder = {
		let decoder = JSONDecoder()
		decoder.keyDecodingStrategy = .convertFromSnakeCase
		return decoder
	}()
	
	// MARK: - FetchAllPokemons
	func fetchAllPokemons(completion: @escaping (Result<AllPokemons, CustomError>) -> ()){
		guard let url = URL(string: Constants.Paths.baseURL + "pokemon?limit=151&offset=0") else {
			return completion(.failure(.urlError))
		}
		
		URLSession.shared.dataTask(with: url) { (data, response, error) in
			if error != nil {
				completion(.failure(.networkError))
			}
			
			if let data = data {
				do {
					let object = try self.decoder.decode(AllPokemons.self, from: data)
					completion(.success(object))
				} catch {
					completion(.failure(.decodingError))
				}
			}
		}.resume()
	}
	// MARK: - SearchAllPokemonsByName
	func searchAllPokemonsByName(withName name: String, completion: @escaping (Result<Pokemon, CustomError>) -> ()){
		guard let url = URL(string: Constants.Paths.baseURL + "pokemon/\(name)") else {
			return completion(.failure(.urlError))
		}
		
		URLSession.shared.dataTask(with: url) { (data, response, error) in
			if error != nil {
				completion(.failure(.networkError))
			}
			
			if let data = data {
				do {
					let object = try self.decoder.decode(Pokemon.self, from: data)
					completion(.success(object))
				} catch {
					completion(.failure(.decodingError))
				}
			}
		}.resume()
	}
	// MARK: - getPokemon
	func fetchPokemon(withId id: Int,completion: @escaping (Result<Pokemon, CustomError>) -> ()){
		guard let url = URL(string: Constants.Paths.baseURL + "pokemon/\(id)") else {
			return completion(.failure(.urlError))
		}
		
		URLSession.shared.dataTask(with: url) { (data, response, error) in
			if error != nil {
				completion(.failure(.networkError))
			}
			
			if let data = data {
				do {
					let object = try self.decoder.decode(Pokemon.self, from: data)
					completion(.success(object))
				} catch {
					completion(.failure(.decodingError))
				}
			}
		}.resume()
	}
	// MARK: - fetchPokemonDescription
	func fetchPokemonDescription(withId id: Int, completion: @escaping (Result<PokemonSpecies, CustomError>) -> Void) {
		guard let url = URL(string: Constants.Paths.baseURL + "pokemon-species/\(id)") else {
			return completion(.failure(.urlError))
		}
		
		URLSession.shared.dataTask(with: url) { (data, response, error) in
			if error != nil {
				completion(.failure(.serverError))
			}
			
			if let data = data {
				do {
					let object = try self.decoder.decode(PokemonSpecies.self, from: data)
					completion(.success(object))
				} catch {
					completion(.failure(.decodingError))
				}
			}
		}.resume()
	}
}
