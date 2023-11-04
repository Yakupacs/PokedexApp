//
//  PokedexAppTests.swift
//  PokedexAppTests
//
//  Created by Yakup on 3.11.2023.
//

import XCTest
@testable import PokedexApp

final class PokedexAppTests: XCTestCase {
	
	private var homepageViewModel: HomepageViewModel!
	private var detailViewModel: DetailViewModel!
	
	private var webService: MockWebService!
	
	private var homepageOutput: MockHomepageViewModelOutput!
	private var detailOutput: MockDetailViewModelOutput!
	
	override func setUpWithError() throws {
		webService = MockWebService()
		homepageViewModel = HomepageViewModel(webService: webService)
	}
	override func tearDownWithError() throws {
		homepageViewModel = nil
		detailViewModel = nil
		webService = nil
	}
	func testFetchAllPokemon_whenAPISuccess_showsAllPokemons() throws{
		var allPokemons = AllPokemons(count: 151, next: "", previous: .none, results: [SinglePokemon(name: "Pikachu", url: "")])
		
		webService.fetchAllPokemonMockResult = .success(allPokemons)
		
		homepageViewModel.getAllPokemons()
		
		XCTAssertEqual(homepageOutput.allPokemons?.count, 151)
		XCTAssertEqual(homepageOutput.allPokemons?.results.first?.name, "Pikachu")
	}
	func testSearchPokemonsByName_whenAPISuccess_showsSearchPokemon() throws{
		var searchPokemon = Pokemon(id: 1, name: "Pikachu", types: [PType(slot: 0, type: Species(name: "", url: ""))], height: 0, weight: 0, stats: [Stat(baseStat: 0, effort: 0, stat: Species(name: "", url: ""))], moves: [Move(move: Species(name: "", url: ""))])
		
		webService.fetchPokemonMockResult = .success(searchPokemon)
		
		homepageViewModel.searchAllPokemonsByName(withName: searchPokemon.name)
		
		XCTAssertEqual(homepageOutput.pokemon!.name, "Pikachu")
	}
	func testFetchPokemon_whenAPISuccess_showsFetchPokemon() throws{
		var fetchPokemon = Pokemon(id: 1, name: "Pikachu", types: [PType(slot: 0, type: Species(name: "", url: ""))], height: 0, weight: 0, stats: [Stat(baseStat: 0, effort: 0, stat: Species(name: "", url: ""))], moves: [Move(move: Species(name: "", url: ""))])
		
		webService.fetchPokemonMockResult = .success(fetchPokemon)
		
		detailViewModel.getPokemon(withId: fetchPokemon.id)
		
		XCTAssertEqual(detailOutput.pokemon?.id, 1)
		XCTAssertEqual(detailOutput.pokemon?.name, "Pikachu")
	}
	func testNextPokemon_whenAPISuccess_showsNextPokemon() throws{
		var pokemon = Pokemon(id: 1, name: "Pikachu", types: [PType(slot: 0, type: Species(name: "", url: ""))], height: 0, weight: 0, stats: [Stat(baseStat: 0, effort: 0, stat: Species(name: "", url: ""))], moves: [Move(move: Species(name: "", url: ""))])
		
		webService.fetchPokemonMockResult = .success(pokemon)
		
		detailViewModel.getNextPokemon(withId: pokemon.id)
		
		XCTAssertEqual(detailOutput.pokemon?.id, 2)
	}
	func testBackPokemon_whenAPISuccess_showsBackPokemon() throws{
		var pokemon = Pokemon(id: 2, name: "Pikachu", types: [PType(slot: 0, type: Species(name: "", url: ""))], height: 0, weight: 0, stats: [Stat(baseStat: 0, effort: 0, stat: Species(name: "", url: ""))], moves: [Move(move: Species(name: "", url: ""))])
		
		webService.fetchPokemonMockResult = .success(pokemon)
		
		detailViewModel.getBackPokemon(withId: pokemon.id)
		
		XCTAssertEqual(detailOutput.pokemon?.id, 1)
	}
	
	class MockWebService: WebServiceProtocol{
		var fetchAllPokemonMockResult: Result<PokedexApp.AllPokemons, CustomError>?
		var fetchPokemonMockResult: Result<PokedexApp.Pokemon, CustomError>?
		var fetchPokemonSpeciesMockResult: Result<PokedexApp.PokemonSpecies, CustomError>?

		func fetchAllPokemons(completion: @escaping (Result<PokedexApp.AllPokemons, PokedexApp.CustomError>) -> ()) {
			if let result = fetchAllPokemonMockResult{
				completion(result)
			}
		}
		func searchAllPokemonsByName(withName name: String, completion: @escaping (Result<PokedexApp.Pokemon, PokedexApp.CustomError>) -> ()) {
			if let result = fetchPokemonMockResult{
				completion(result)
			}
		}
		func fetchPokemon(withId id: Int, completion: @escaping (Result<PokedexApp.Pokemon, PokedexApp.CustomError>) -> ()) {
			if let result = fetchPokemonMockResult{
				completion(result)
			}
		}
		func fetchPokemonDescription(withId id: Int, completion: @escaping (Result<PokedexApp.PokemonSpecies, PokedexApp.CustomError>) -> Void) {
			if let result = fetchPokemonSpeciesMockResult{
				completion(result)
			}
		}
	}
	class MockHomepageViewModelOutput: HomepagePokemonOutput{
		var allPokemons: AllPokemons?
		var pokemon: Pokemon?
		
		func setAllPokemons(pokemons: PokedexApp.AllPokemons?, error: String?) {
			self.allPokemons = pokemons
		}
		func setSearchPokemon(pokemon: PokedexApp.Pokemon?, error: String?) {
			self.pokemon = pokemon
		}
	}
	class MockDetailViewModelOutput: DetailPokemonOutput{
		var pokemon: Pokemon?
		var pokemonSpecies: PokemonSpecies?

		func setPokemon(pokemon: PokedexApp.Pokemon?, error: String?) {
			self.pokemon = pokemon
		}
		func setPokemonDescription(pokemonSpecies: PokedexApp.PokemonSpecies?, error: String?) {
			self.pokemonSpecies = pokemonSpecies
		}
	}
}

