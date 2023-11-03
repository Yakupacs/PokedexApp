//
//  PokemonSpecies.swift
//  PokedexApp
//
//  Created by Yakup on 3.11.2023.
//

import Foundation

struct PokemonSpecies: Codable {
	let baseHappiness, captureRate: Int
	let color: Pair
	let eggGroups: [Pair]
	let evolutionChain: EvolutionChain
	let evolvesFromSpecies: Pair?
	let flavorTextEntries: [FlavorTextEntry]
	let formDescriptions: [FormDescription]
	let formsSwitchable: Bool
	let genderRate: Int
	let genera: [Genus]
	let generation, growthRate, habitat: Pair
	let hasGenderDifferences: Bool
	let hatchCounter, id: Int
	let isBaby, isLegendary, isMythical: Bool
	let name: String
	let names: [Name]
	let order: Int
	let palParkEncounters: [PalParkEncounter]
	let pokedexNumbers: [PokedexNumber]
	let shape: Pair
	let varieties: [Variety]
}

// MARK: - Color
struct Pair: Codable {
	let name: String
	let url: String
}

// MARK: - EvolutionChain
struct EvolutionChain: Codable {
	let url: String
}

// MARK: - FlavorTextEntry
struct FlavorTextEntry: Codable {
	let flavorText: String
	let language, version: Pair
}

// MARK: - Genus
struct Genus: Codable {
	let genus: String
	let language: Pair
}

// MARK: - Name
struct Name: Codable {
	let language: Pair
	let name: String
}

// MARK: - PalParkEncounter
struct PalParkEncounter: Codable {
	let area: Pair
	let baseScore: Int
	let rate: Int
}

// MARK: - PokedexNumber
struct PokedexNumber: Codable {
	let entryNumber: Int
	let pokedex: Pair
}

// MARK: - Variety
struct Variety: Codable {
	let isDefault: Bool
	let pokemon: Pair
}
// MARK: - FormDescription
struct FormDescription: Codable {
	let description: String
	let language: Pair
}
