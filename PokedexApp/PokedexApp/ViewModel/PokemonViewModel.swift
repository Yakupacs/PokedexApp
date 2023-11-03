//
//  PokemonViewModel.swift
//  PokedexApp
//
//  Created by Yakup on 3.11.2023.
//

import Foundation

class PokemonViewModel{
	private let webService: WebServiceProtocol?
	
	var homepageOutput: HomepagePokemonOutput?
	var detailOutput: DetailPokemonOutput?
	
	init(webService: WebServiceProtocol?) {
		self.webService = webService
	}
	
	func fetchAllPokemons(){
		webService?.fetchAllPokemons(completion: { result in
			switch result{
			case .success(let pokemons):
				self.homepageOutput?.setAllPokemons(pokemons: pokemons, error: nil)
			case .failure(let customError):
				switch customError{
				case .fileNotFound:
					self.homepageOutput?.setAllPokemons(pokemons: nil, error: "Error! File not found.")
				case .invalidInput:
					self.homepageOutput?.setAllPokemons(pokemons: nil, error: "Error! Invalid input.")
				case .networkError:
					self.homepageOutput?.setAllPokemons(pokemons: nil, error: "Error! Network Error.")
				}
			}
		})
	}
	
	func searchAllPokemonsByName(){
		webService?.searchAllPokemonsByName(completion: { result in
			switch result{
			case .success(let pokemons):
				self.homepageOutput?.setAllPokemons(pokemons: pokemons, error: nil)
			case .failure(let customError):
				switch customError{
				case .fileNotFound:
					self.homepageOutput?.setAllPokemons(pokemons: nil, error: "Error! File not found.")
				case .invalidInput:
					self.homepageOutput?.setAllPokemons(pokemons: nil, error: "Error! Invalid input.")
				case .networkError:
					self.homepageOutput?.setAllPokemons(pokemons: nil, error: "Error! Network Error.")
				}
			}
		})
	}
	
	func getNextPokemon(){
		webService?.getNextPokemon(completion: { result in
			switch result{
			case .success(let pokemon):
				self.detailOutput?.setNextPokemon(nextPokemon: pokemon, error: nil)
			case .failure(let customError):
				switch customError{
				case .fileNotFound:
					self.detailOutput?.setNextPokemon(nextPokemon: nil, error: "Error! File not found.")
				case .invalidInput:
					self.detailOutput?.setNextPokemon(nextPokemon: nil, error: "Error! Invalid input.")
				case .networkError:
					self.detailOutput?.setNextPokemon(nextPokemon: nil, error: "Error! Network Error.")
				}
			}
		})
	}
}
