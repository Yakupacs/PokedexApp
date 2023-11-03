//
//  PokemonViewModel.swift
//  PokedexApp
//
//  Created by Yakup on 3.11.2023.
//

import Foundation

class HomepageViewModel{
	private let webService: WebServiceProtocol?
	
	var homepageOutput: HomepagePokemonOutput?
	
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
				case .decodingError:
					self.homepageOutput?.setAllPokemons(pokemons: nil, error: "Error! Decoding error.")
				case .networkError:
					self.homepageOutput?.setAllPokemons(pokemons: nil, error: "Error! Network error.")
				case .serverError:
					self.homepageOutput?.setAllPokemons(pokemons: nil, error: "Error! Server error.")
				case .urlError:
					self.homepageOutput?.setAllPokemons(pokemons: nil, error: "Error! URL error.")
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
				case .decodingError:
					self.homepageOutput?.setAllPokemons(pokemons: nil, error: "Error! Decoding error.")
				case .networkError:
					self.homepageOutput?.setAllPokemons(pokemons: nil, error: "Error! Network error.")
				case .serverError:
					self.homepageOutput?.setAllPokemons(pokemons: nil, error: "Error! Server error.")
				case .urlError:
					self.homepageOutput?.setAllPokemons(pokemons: nil, error: "Error! URL error.")
				}
			}
		})
	}
}
