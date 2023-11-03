//
//  ViewController.swift
//  PokedexApp
//
//  Created by Yakup on 3.11.2023.
//

import UIKit
import Kingfisher

class HomepageVC: UIViewController, HomepagePokemonOutput {

	var homepageViewModel: HomepageViewModel?
	
	var pokes: AllPokemons?
	
	private let searchController = UISearchController(searchResultsController: nil)
	private var isSearchBarVisible = false
	
	let pokeCollectionView: UICollectionView = {
		let layout = UICollectionViewFlowLayout()
		layout.scrollDirection = .vertical
		layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
		let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
		collectionView.translatesAutoresizingMaskIntoConstraints = false
		collectionView.register(PokedexCVC.self, forCellWithReuseIdentifier: "pokeCell")
		return collectionView
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setupViews()
		setupSearchController()
		homepageViewModel?.getAllPokemons()
	}
	
	init(homepageViewModel: HomepageViewModel? = nil) {
		self.homepageViewModel = homepageViewModel
		super.init(nibName: nil, bundle: nil)
		self.homepageViewModel?.homepageOutput = self
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func setAllPokemons(pokemons: AllPokemons?, error: String?){
		self.pokes = pokemons
		DispatchQueue.main.async{
			self.pokeCollectionView.reloadData()
		}
	}
	func setSearchPokemon(pokemon: Pokemon?, error: String?) {
		if let p = pokemon{
			var poke = AllPokemons(count: 1, next: "", previous: .none, results: [SinglePokemon(name: p.name, url: "https://pokeapi.co/api/v2/pokemon/\(p.id)/")])
			self.pokes = poke
			DispatchQueue.main.async{
				self.pokeCollectionView.reloadData()
			}
		}else{
			self.homepageViewModel?.getAllPokemons()
		}
	}
	
	private func setupViews(){
		view.backgroundColor = UIColor(red: 220/255, green: 10/255, blue: 45/255, alpha: 1)
		
		let image = UIImage(named: "Pokeball")
		let imageView = UIImageView(image: image)
		imageView.contentMode = .scaleAspectFit
		let viewForImage = UIView(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
		viewForImage.addSubview(imageView)
		
		let image2 = UIImage(named: "Pokeedex")
		let imageView2 = UIImageView(image: image2)
		imageView2.contentMode = .scaleAspectFit
		let viewForImage2 = UIView(frame: CGRect(x: 0, y: 0, width: 44, height: 100))
		viewForImage2.addSubview(imageView2)

		let stackView = UIStackView(arrangedSubviews: [viewForImage, viewForImage2])
		stackView.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0)
		stackView.isLayoutMarginsRelativeArrangement = true
		stackView.axis = .horizontal
		stackView.alignment = .center
		stackView.spacing = 30

		navigationItem.leftBarButtonItem = UIBarButtonItem(customView: stackView)
		
		pokeCollectionView.delegate = self
		pokeCollectionView.dataSource = self
		pokeCollectionView.isScrollEnabled = true
		pokeCollectionView.showsVerticalScrollIndicator = false
		
		pokeCollectionView.contentInset = UIEdgeInsets(top: 16, left: 16, bottom: 0, right: 16)
		pokeCollectionView.layer.cornerRadius = 15
		pokeCollectionView.layer.masksToBounds = true
		
		view.addSubview(pokeCollectionView)
		
		NSLayoutConstraint.activate([
			pokeCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
			pokeCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
			pokeCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
			pokeCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -8),
		])
		
	}
	private func setupSearchController() {
		searchController.searchResultsUpdater = self
		searchController.obscuresBackgroundDuringPresentation = false
		
		searchController.searchBar.placeholder = "Search"
		searchController.searchBar.tintColor = .red
		searchController.searchBar.searchTextField.backgroundColor = .white
		searchController.searchBar.layer.cornerRadius = 20
		searchController.searchBar.clipsToBounds = true
		searchController.searchBar.frame = CGRect(x: 0, y: 0, width: 100, height: 44)
		navigationItem.searchController = searchController
		definesPresentationContext = true
	}
}

extension HomepageVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return pokes?.results.count ?? 0
	}
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "pokeCell", for: indexPath) as? PokedexCVC else {
			fatalError("Hücre oluşturulamadı")
		}
		let poke = pokes?.results[indexPath.item]
		cell.lblPoke.text = poke?.name
		let fileName = pokes?.results[indexPath.item].url
		let fileArray = fileName?.split(separator: "/")
		let finalFileName = fileArray?.last
		if let url = URL(string: "https://assets.pokemon.com/assets/cms2/img/pokedex/full/\(String(format:"%03d", Int(finalFileName!)!)).png") {
            cell.imgPoke.kf.setImage(with: url)
        }
		return cell
	}
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: 105, height: 140)
	}
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
		return 16 //vertically
	}
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
		return 0 //horizontally
	}
	
}

extension HomepageVC: UISearchResultsUpdating{
	func updateSearchResults(for searchController: UISearchController) {
		if searchController.searchBar.text != ""{
			homepageViewModel?.searchAllPokemonsByName(withName: searchController.searchBar.text!.lowercased())
		}
	}
}
