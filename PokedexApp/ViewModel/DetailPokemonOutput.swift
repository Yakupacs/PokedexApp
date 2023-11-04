//
//  DetailPokemonOutput.swift
//  PokedexApp
//
//  Created by Yakup on 3.11.2023.
//

import Foundation

protocol DetailPokemonOutput{
	func setPokemon(pokemon: Pokemon?, error: String?)
	func setPokemonDescription(pokemonSpecies: PokemonSpecies?, error: String?)
}
