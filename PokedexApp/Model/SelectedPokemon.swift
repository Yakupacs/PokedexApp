//
//  SelectedPokemon.swift
//  PokedexApp
//
//  Created by Yakup on 3.11.2023.
//

import Foundation

class SelectedPokemon{
	static let shared = SelectedPokemon()
	var selected: SinglePokemon?
	private init(selected: SinglePokemon? = nil) {
		self.selected = selected
	}
	
}
