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
    
    let imgPokeball: UIImageView = {
        let image = UIImage(named: "Pokeball")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
        return imageView
    }()
    let imgPokedex: UIImageView = {
        let image = UIImage(named: "Pokeedex")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
        return imageView
    }()
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 10
        return stackView
    }()
	let pokeCollectionView: UICollectionView = {
		let layout = UICollectionViewFlowLayout()
		layout.scrollDirection = .vertical
		layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
		layout.minimumInteritemSpacing = 10
		layout.minimumLineSpacing = 10
		let width = UIScreen.main.bounds.width
		let itemWidth = (width - 44) / 3
		layout.itemSize = CGSize(width: itemWidth, height: 140)
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
		if let error{
			let alert = view.addAlert(title: "Error!", message: error)
			present(alert, animated: true)
		}else{
			self.pokes = pokemons
			DispatchQueue.main.async{
				self.pokeCollectionView.reloadData()
			}
		}
	}
	func setSearchPokemon(pokemon: Pokemon?, error: String?) {
		if let p = pokemon{
			let poke = AllPokemons(count: 1, next: "", previous: .none, results: [SinglePokemon(name: p.name, url: "https://pokeapi.co/api/v2/pokemon/\(p.id)/")])
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
		
        stackView.addArrangedSubview(imgPokeball)
        stackView.addArrangedSubview(imgPokedex)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: stackView)
		
		pokeCollectionView.delegate = self
		pokeCollectionView.dataSource = self
		pokeCollectionView.isScrollEnabled = true
		pokeCollectionView.showsVerticalScrollIndicator = false
		
		pokeCollectionView.contentInset = UIEdgeInsets(top: 20, left: 10, bottom: 0, right: 10)
		pokeCollectionView.layer.cornerRadius = 15
		pokeCollectionView.layer.masksToBounds = true
		
		view.addSubview(pokeCollectionView)
		
		NSLayoutConstraint.activate([
			pokeCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
			pokeCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
			pokeCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
			pokeCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -8),
		])
		
	}
    private func setupSearchController() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        
        searchController.searchBar.placeholder = "Search"
        searchController.searchBar.tintColor = .white
        searchController.searchBar.searchTextField.backgroundColor = .white
        searchController.searchBar.clipsToBounds = true
        searchController.searchBar.frame = CGRect(x: 0, y: 0, width: 100, height: 44)
        searchController.searchBar.searchTextField.leftView?.tintColor = .black
        searchController.searchBar.searchTextField.backgroundColor = .white
        searchController.searchBar.showsCancelButton = false
        if let searchTextField = searchController.searchBar.value(forKey: "searchField") as? UITextField {
            searchTextField.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                searchTextField.heightAnchor.constraint(equalToConstant: 40),
                searchTextField.leadingAnchor.constraint(equalTo: searchController.searchBar.leadingAnchor, constant: 16),
                searchTextField.trailingAnchor.constraint(equalTo: searchController.searchBar.trailingAnchor, constant: -80),
                searchTextField.centerYAnchor.constraint(equalTo: searchController.searchBar.centerYAnchor, constant: 0)
            ])
            searchTextField.clipsToBounds = true
            searchTextField.layer.cornerRadius = 20.0
        }
        if let textfield = searchController.searchBar.value(forKey: "searchField") as? UITextField {
            textfield.attributedPlaceholder = NSAttributedString(string: textfield.placeholder ?? "", attributes: [NSAttributedString.Key.font : UIFont(name: "Poppins-Light", size: 13)!])
        }
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
        cell.lblPoke.text = poke?.name.capitalized
		let fileName = pokes?.results[indexPath.item].url
		let fileArray = fileName?.split(separator: "/")
		let finalFileName = fileArray?.last
		cell.lblId.text = "#\(finalFileName!)"
		if let url = URL(string: "https://assets.pokemon.com/assets/cms2/img/pokedex/full/\(String(format:"%03d", Int(finalFileName!)!)).png") {
			cell.imgPoke.kf.setImage(with: url)
		}
		return cell
	}
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
		return 16 //vertically
	}
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
		return 0 //horizontally
	}
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		SelectedPokemon.shared.selected = pokes?.results[indexPath.row]
		let webServiceProtocol: WebServiceProtocol = WebService()
		let detailViewModel = DetailViewModel(webService: webServiceProtocol)
		let detailVC = DetailVC(detailViewModel: detailViewModel)
		detailVC.modalPresentationStyle = .fullScreen
		present(detailVC, animated: true)
	}
}

extension HomepageVC: UISearchResultsUpdating{
	func updateSearchResults(for searchController: UISearchController) {
		if searchController.searchBar.text != ""{
			homepageViewModel?.searchAllPokemonsByName(withName: searchController.searchBar.text!.lowercased())
        }else if searchController.searchBar.text == ""{
            homepageViewModel?.getAllPokemons()
        }
	}
}
