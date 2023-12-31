//
//  PokemonViewModelOutpu.swift
//  PokedexApp
//
//  Created by Yakup on 3.11.2023.
//

import Foundation

protocol HomepagePokemonOutput{
	func setAllPokemons(pokemons: AllPokemons?, error: String?)
	func setSearchPokemon(pokemon: Pokemon?, error: String?)
}
