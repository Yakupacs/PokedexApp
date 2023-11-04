//
//  Constants.swift
//  PokedexApp
//
//  Created by Yakup on 3.11.2023.
//

import Foundation

struct Constants{
	
	struct Paths {
		static let baseURL = "https://pokeapi.co/api/v2/"
		static let pokemonPath = "pokemon/"
		static let pokemonSpecies = "pokemon-species/"
	}
	
	struct URLs{
		static let allPokemons = "pokemon?limit=151&offset=0"
	}
}
