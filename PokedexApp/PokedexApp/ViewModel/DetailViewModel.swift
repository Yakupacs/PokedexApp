//
//  PokemonViewModel.swift
//  PokedexApp
//
//  Created by Yakup on 3.11.2023.
//

import Foundation

class DetailViewModel{
	private let webService: WebServiceProtocol?
	
	var detailOutput: DetailPokemonOutput?
	
	init(webService: WebServiceProtocol?) {
		self.webService = webService
	}
	
	func getPokemon(withId id: Int){
		webService?.fetchPokemon(withId: id, completion: { result in
			switch result{
			case .success(let pokemon):
				self.detailOutput?.setPokemon(pokemon: pokemon, error: nil)
			case .failure(let customError):
				switch customError{
				case .decodingError:
					self.detailOutput?.setPokemon(pokemon: nil, error: "Error! Decoding error.")
				case .networkError:
					self.detailOutput?.setPokemon(pokemon: nil, error: "Error! Network error.")
				case .serverError:
					self.detailOutput?.setPokemon(pokemon: nil, error: "Error! Server error.")
				case .urlError:
					self.detailOutput?.setPokemon(pokemon: nil, error: "Error! URL error.")
				}
			}
		})
	}
	
	func getPokemonDescription(withId id: Int){
		webService?.fetchPokemonDescription(withId: id, completion: { result in
			switch result{
			case .success(let pokemonSpecies):
				self.detailOutput?.setPokemonDescription(pokemonSpecies: pokemonSpecies, error: nil)
			case .failure(let customError):
				switch customError{
				case .decodingError:
					self.detailOutput?.setPokemonDescription(pokemonSpecies: nil, error: "Error! Decoding error.")
				case .networkError:
					self.detailOutput?.setPokemonDescription(pokemonSpecies: nil, error: "Error! Network error.")
				case .serverError:
					self.detailOutput?.setPokemonDescription(pokemonSpecies: nil, error: "Error! Server error.")
				case .urlError:
					self.detailOutput?.setPokemonDescription(pokemonSpecies: nil, error: "Error! URL error.")
				}
			}
		})
	}
	
	func getNextPokemonDesctiption(withId id: Int){
		webService?.fetchPokemonDescription(withId: id + 1, completion: { result in
			switch result{
			case .success(let pokemonSpecies):
				self.detailOutput?.setPokemonDescription(pokemonSpecies: pokemonSpecies, error: nil)
			case .failure(let customError):
				switch customError{
				case .decodingError:
					self.detailOutput?.setPokemonDescription(pokemonSpecies: nil, error: "Error! Decoding error.")
				case .networkError:
					self.detailOutput?.setPokemonDescription(pokemonSpecies: nil, error: "Error! Network error.")
				case .serverError:
					self.detailOutput?.setPokemonDescription(pokemonSpecies: nil, error: "Error! Server error.")
				case .urlError:
					self.detailOutput?.setPokemonDescription(pokemonSpecies: nil, error: "Error! URL error.")
				}
			}
		})
	}
	
	func getNextPokemon(withId id: Int){
		webService?.fetchPokemon(withId: id + 1, completion: { result in
			switch result{
			case .success(let pokemon):
				self.detailOutput?.setPokemon(pokemon: pokemon, error: nil)
			case .failure(let customError):
				switch customError{
				case .decodingError:
					self.detailOutput?.setPokemon(pokemon: nil, error: "Error! Decoding error.")
				case .networkError:
					self.detailOutput?.setPokemon(pokemon: nil, error: "Error! Network error.")
				case .serverError:
					self.detailOutput?.setPokemon(pokemon: nil, error: "Error! Server error.")
				case .urlError:
					self.detailOutput?.setPokemon(pokemon: nil, error: "Error! URL error.")
				}
			}
		})
	}
	
	func getBackPokemonDesctiption(withId id: Int){
		webService?.fetchPokemonDescription(withId: id - 1, completion: { result in
			switch result{
			case .success(let pokemonSpecies):
				self.detailOutput?.setPokemonDescription(pokemonSpecies: pokemonSpecies, error: nil)
			case .failure(let customError):
				switch customError{
				case .decodingError:
					self.detailOutput?.setPokemonDescription(pokemonSpecies: nil, error: "Error! Decoding error.")
				case .networkError:
					self.detailOutput?.setPokemonDescription(pokemonSpecies: nil, error: "Error! Network error.")
				case .serverError:
					self.detailOutput?.setPokemonDescription(pokemonSpecies: nil, error: "Error! Server error.")
				case .urlError:
					self.detailOutput?.setPokemonDescription(pokemonSpecies: nil, error: "Error! URL error.")
				}
			}
		})
	}
	
	func getBackPokemon(withId id: Int){
		webService?.fetchPokemon(withId: id - 1, completion: { result in
			switch result{
			case .success(let pokemon):
				self.detailOutput?.setPokemon(pokemon: pokemon, error: nil)
			case .failure(let customError):
				switch customError{
				case .decodingError:
					self.detailOutput?.setPokemon(pokemon: nil, error: "Error! Decoding error.")
				case .networkError:
					self.detailOutput?.setPokemon(pokemon: nil, error: "Error! Network error.")
				case .serverError:
					self.detailOutput?.setPokemon(pokemon: nil, error: "Error! Server error.")
				case .urlError:
					self.detailOutput?.setPokemon(pokemon: nil, error: "Error! URL error.")
				}
			}
		})
	}

}
