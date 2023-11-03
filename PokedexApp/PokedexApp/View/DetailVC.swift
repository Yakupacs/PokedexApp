//
//  DetailVC.swift
//  PokedexApp
//
//  Created by Yakup on 3.11.2023.
//

import UIKit

class DetailVC: UIViewController, DetailPokemonOutput {

	var detailViewModel: DetailViewModel?
	
	var selectedPokemonId = 2
	
    override func viewDidLoad() {
        super.viewDidLoad()
//		detailViewModel?.getPokemon(withId: selectedPokemonId)
//		detailViewModel?.getPokemonDescription(withId: selectedPokemonId)
//		detailViewModel?.getNextPokemon(withId: selectedPokemonId)
//		detailViewModel?.getNextPokemonDesctiption(withId: selectedPokemonId)
//		detailViewModel?.getBackPokemon(withId: selectedPokemonId)
//		detailViewModel?.getBackPokemonDesctiption(withId: selectedPokemonId)
    }
	
	init(detailViewModel: DetailViewModel? = nil) {
		self.detailViewModel = detailViewModel
		super.init(nibName: nil, bundle: nil)
		self.detailViewModel?.detailOutput = self
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func setPokemon(pokemon: Pokemon?, error: String?) {
		print("setPokemon:")
		print(pokemon!.name)
	}
	
	func setPokemonDescription(pokemonSpecies: PokemonSpecies?, error: String?) {
		print("setPokemonDescription:")
		print(pokemonSpecies!.flavorTextEntries.first!.flavorText)
	}
}
