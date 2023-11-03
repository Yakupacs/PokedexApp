//
//  DetailVC.swift
//  PokedexApp
//
//  Created by Yakup on 3.11.2023.
//

import UIKit
import Kingfisher

class DetailVC: UIViewController, DetailPokemonOutput {
	
	var detailViewModel: DetailViewModel?
	
	var selectedPokemon: SelectedPokemon?
	
	var grassColor = UIColor(red: 116 / 255.0, green: 203 / 255.0, blue: 72 / 255.0, alpha: 1)
	
	private let pokeballImageView : UIImageView = {
		let pokeballImageView = UIImageView()
		pokeballImageView.translatesAutoresizingMaskIntoConstraints = false
		pokeballImageView.image = UIImage(named: "Pokeball")
		pokeballImageView.alpha = CGFloat(0.1)
		return pokeballImageView
	}()
	private let infoView : UIView = {
		let infoView = UIView()
		infoView.translatesAutoresizingMaskIntoConstraints = false
		infoView.backgroundColor = .white
		return infoView
	}()
	private let typeCollectionView : UICollectionView = {
		let layout = UICollectionViewFlowLayout()
		layout.scrollDirection = .horizontal
		
		let typeCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
		typeCollectionView.translatesAutoresizingMaskIntoConstraints = false
		typeCollectionView.showsVerticalScrollIndicator = false
		typeCollectionView.register(TypeCell.self, forCellWithReuseIdentifier: TypeCell.cellIdentifier)
		
		return typeCollectionView
	}()
	
	private let aboutTitleLabel : UILabel = {
		let aboutTitleLabel = UILabel()
		aboutTitleLabel.translatesAutoresizingMaskIntoConstraints = false
		aboutTitleLabel.textAlignment = .center
		aboutTitleLabel.text = "About"
		aboutTitleLabel.font = UIFont.boldSystemFont(ofSize: 18)
		aboutTitleLabel.textColor = UIColor(red: 116 / 255.0, green: 203 / 255.0, blue: 72 / 255.0, alpha: 1)
		return aboutTitleLabel
	}()
	
	let weightDividerView: UIView = {
		let dividerView = UIView()
		dividerView.translatesAutoresizingMaskIntoConstraints = false
		dividerView.backgroundColor = UIColor.gray
		return dividerView
	}()
	
	private let weightImageView : UIImageView = {
		let weightImageView = UIImageView()
		weightImageView.translatesAutoresizingMaskIntoConstraints = false
		weightImageView.image = UIImage(named: "weight")
		return weightImageView
	}()
	
	private let weightTitleLabel : UILabel = {
		let weightTitleLabel = UILabel()
		weightTitleLabel.translatesAutoresizingMaskIntoConstraints = false
		weightTitleLabel.textAlignment = .center
		weightTitleLabel.font = UIFont.boldSystemFont(ofSize: 14)
		weightTitleLabel.textColor = UIColor(red: 29 / 255.0, green: 29 / 255.0, blue: 29 / 255.0, alpha: 1)
		return weightTitleLabel
	}()
	private let weightValueLabel : UILabel = {
		let weightLabel = UILabel()
		weightLabel.translatesAutoresizingMaskIntoConstraints = false
		weightLabel.textAlignment = .center
		weightLabel.font = UIFont.boldSystemFont(ofSize: 12)
		weightLabel.textColor = UIColor(red: 102 / 255.0, green: 102 / 255.0, blue: 102 / 255.0, alpha: 1)
		return weightLabel
	}()
	
	private let heightImageView : UIImageView = {
		let heightImageView = UIImageView()
		heightImageView.translatesAutoresizingMaskIntoConstraints = false
		heightImageView.image = UIImage(named: "weight")
		return heightImageView
	}()
	
	private let heightTitleLabel : UILabel = {
		let heightTitleLabel = UILabel()
		heightTitleLabel.translatesAutoresizingMaskIntoConstraints = false
		heightTitleLabel.textAlignment = .center
		heightTitleLabel.font = UIFont.boldSystemFont(ofSize: 14)
		heightTitleLabel.textColor = UIColor(red: 29 / 255.0, green: 29 / 255.0, blue: 29 / 255.0, alpha: 1)
		return heightTitleLabel
	}()
	private let heightValueLabel : UILabel = {
		let heightValueLabel = UILabel()
		heightValueLabel.translatesAutoresizingMaskIntoConstraints = false
		heightValueLabel.textAlignment = .center
		heightValueLabel.font = UIFont.boldSystemFont(ofSize: 12)
		heightValueLabel.textColor = UIColor(red: 102 / 255.0, green: 102 / 255.0, blue: 102 / 255.0, alpha: 1)
		return heightValueLabel
	}()
	
	let heightDividerView: UIView = {
		let dividerView = UIView()
		dividerView.translatesAutoresizingMaskIntoConstraints = false
		dividerView.backgroundColor = UIColor.gray
		return dividerView
	}()
	
	private let movesTitleLabel : UILabel = {
		let movesTitleLabel = UILabel()
		movesTitleLabel.translatesAutoresizingMaskIntoConstraints = false
		movesTitleLabel.textAlignment = .center
		movesTitleLabel.font = UIFont.boldSystemFont(ofSize: 14)
		movesTitleLabel.textColor = UIColor(red: 29 / 255.0, green: 29 / 255.0, blue: 29 / 255.0, alpha: 1)
		return movesTitleLabel
	}()
	private let movesValueLabel : UILabel = {
		let movesValueLabel = UILabel()
		movesValueLabel.translatesAutoresizingMaskIntoConstraints = false
		movesValueLabel.textAlignment = .center
		movesValueLabel.font = UIFont.boldSystemFont(ofSize: 12)
		movesValueLabel.textColor = UIColor(red: 102 / 255.0, green: 102 / 255.0, blue: 102 / 255.0, alpha: 1)
		return movesValueLabel
	}()
	
	private let pokemonInfoLabel : UILabel = {
		let pokemonInfoLabel = UILabel()
		pokemonInfoLabel.translatesAutoresizingMaskIntoConstraints = false
		pokemonInfoLabel.textAlignment = .center
		pokemonInfoLabel.font = UIFont.boldSystemFont(ofSize: 14)
		pokemonInfoLabel.textColor = UIColor(red: 29 / 255.0, green: 29 / 255.0, blue: 29 / 255.0, alpha: 1)
		pokemonInfoLabel.numberOfLines = 0
		return pokemonInfoLabel
	}()
	
	private let typeButton1 : UIButton = {
		let typeButton = UIButton()
		typeButton.translatesAutoresizingMaskIntoConstraints = false
		
		typeButton.layer.cornerRadius = 10
		
		typeButton.backgroundColor = UIColor.blue
		typeButton.clipsToBounds = true
		typeButton.tintColor = UIColor.white
		typeButton.setTitle("Poison", for: .normal)
		
		return typeButton
	}()
	let backButton: UIButton = {
		let backButton = UIButton()
		backButton.translatesAutoresizingMaskIntoConstraints = false
		backButton.setImage(UIImage(systemName: "arrowshape.left.fill"), for: .normal)
		backButton.tintColor = .black
		return backButton
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let fileName = SelectedPokemon.shared.selected?.url
		let fileArray = fileName?.split(separator: "/")
		let finalFileName = fileArray?.last
		detailViewModel?.getPokemon(withId: Int(finalFileName!)!)
		detailViewModel?.getPokemonDescription(withId: Int(finalFileName!)!)
		
		view.addSubview(pokeballImageView)
		view.addSubview(infoView)
		infoView.addSubview(typeCollectionView)
		view.addSubview(aboutTitleLabel)
		infoView.addSubview(weightTitleLabel)
		infoView.addSubview(weightValueLabel)
		infoView.addSubview(weightImageView)
		infoView.addSubview(heightTitleLabel)
		infoView.addSubview(heightValueLabel)
		infoView.addSubview(heightImageView)
		infoView.addSubview(movesTitleLabel)
		infoView.addSubview(movesValueLabel)
		infoView.addSubview(heightDividerView)
		infoView.addSubview(weightDividerView)
		infoView.addSubview(pokemonInfoLabel)
		
		view.backgroundColor = .white
		view.backgroundColor = grassColor
		
		setupConstraints()
		
		typeCollectionView.delegate = self
		typeCollectionView.dataSource = self
		
		weightValueLabel.text = "Weight Value"
		weightTitleLabel.text = "Weight"
		
		heightValueLabel.text = "Height Value"
		heightTitleLabel.text = "Height"
		
		movesValueLabel.text = "Moves Value"
		movesTitleLabel.text = "Moves"
		pokemonInfoLabel.text = "There is a plant seed on its back right from the day this Pokémon is born. The seed slowly grows larger."
		
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
		DispatchQueue.main.async{
			let finalFileName = pokemon?.id
			if let url = URL(string: "https://assets.pokemon.com/assets/cms2/img/pokedex/full/\(String(format:"%03d", finalFileName!)).png") {
				self.pokeballImageView.kf.setImage(with: url)
			}
		}
	}
	
	func setPokemonDescription(pokemonSpecies: PokemonSpecies?, error: String?) {
		print(pokemonSpecies!.flavorTextEntries.first!.flavorText)
	}
	
	func setupConstraints() {
		NSLayoutConstraint.activate([
			pokeballImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
			pokeballImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -9),
			pokeballImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: (view.frame.width - (206))),
			pokeballImageView.heightAnchor.constraint(equalToConstant: 208),
			
			infoView.topAnchor.constraint(equalTo: pokeballImageView.bottomAnchor, constant: 8),
			infoView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 4),
			infoView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -4),
			infoView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -4),
			infoView.heightAnchor.constraint(equalToConstant: 700),
			
			
			
			typeCollectionView.topAnchor.constraint(equalTo: infoView.topAnchor, constant: 56),
			typeCollectionView.heightAnchor.constraint(equalToConstant: 30),
			typeCollectionView.widthAnchor.constraint(equalToConstant: 120),
			typeCollectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			
			aboutTitleLabel.topAnchor.constraint(equalTo: typeCollectionView.bottomAnchor, constant: 16),
			aboutTitleLabel.leadingAnchor.constraint(equalTo: infoView.leadingAnchor, constant: 20),
			aboutTitleLabel.trailingAnchor.constraint(equalTo: infoView.trailingAnchor, constant: -20),
			
			weightImageView.topAnchor.constraint(equalTo: aboutTitleLabel.bottomAnchor, constant: 16),
			weightImageView.leadingAnchor.constraint(equalTo: infoView.leadingAnchor, constant: 20),
			
			weightTitleLabel.topAnchor.constraint(equalTo: aboutTitleLabel.bottomAnchor, constant: 16),
			weightTitleLabel.leadingAnchor.constraint(equalTo: weightImageView.trailingAnchor, constant: 8),
			
			weightValueLabel.topAnchor.constraint(equalTo: weightTitleLabel.bottomAnchor, constant: 4),
			weightValueLabel.leadingAnchor.constraint(equalTo: infoView.leadingAnchor, constant: 20),
			
			weightDividerView.topAnchor.constraint(equalTo: aboutTitleLabel.bottomAnchor, constant: 15),
			weightDividerView.widthAnchor.constraint(equalToConstant: 1),
			weightDividerView.leadingAnchor.constraint(equalTo: weightValueLabel.trailingAnchor, constant: 25),
			weightDividerView.heightAnchor.constraint(equalTo: infoView.heightAnchor, multiplier: 0.1),
			
			
			heightImageView.topAnchor.constraint(equalTo: aboutTitleLabel.bottomAnchor, constant: 16),
			heightImageView.leadingAnchor.constraint(equalTo: weightDividerView.leadingAnchor, constant: 20),
			
			heightTitleLabel.topAnchor.constraint(equalTo: aboutTitleLabel.bottomAnchor, constant: 16),
			heightTitleLabel.leadingAnchor.constraint(equalTo: heightImageView.trailingAnchor, constant: 8),
			
			heightValueLabel.topAnchor.constraint(equalTo: heightTitleLabel.bottomAnchor, constant: 4),
			heightValueLabel.leadingAnchor.constraint(equalTo: weightDividerView.leadingAnchor, constant: 20),
			
			heightDividerView.topAnchor.constraint(equalTo: aboutTitleLabel.bottomAnchor, constant: 15),
			heightDividerView.widthAnchor.constraint(equalToConstant: 1),
			heightDividerView.leadingAnchor.constraint(equalTo: heightValueLabel.trailingAnchor, constant: 25),
			heightDividerView.heightAnchor.constraint(equalTo: infoView.heightAnchor, multiplier: 0.1),
			
			
			movesTitleLabel.topAnchor.constraint(equalTo: aboutTitleLabel.bottomAnchor, constant: 16),
			movesTitleLabel.leadingAnchor.constraint(equalTo: heightDividerView.leadingAnchor, constant: 20),
			
			movesValueLabel.topAnchor.constraint(equalTo: movesTitleLabel.bottomAnchor, constant: 4),
			movesValueLabel.leadingAnchor.constraint(equalTo: heightDividerView.leadingAnchor, constant: 20),
			
			pokemonInfoLabel.topAnchor.constraint(equalTo: movesValueLabel.bottomAnchor, constant: 40),
			pokemonInfoLabel.leadingAnchor.constraint(equalTo: infoView.leadingAnchor, constant: 20),
			pokemonInfoLabel.trailingAnchor.constraint(equalTo: infoView.trailingAnchor, constant: -20),
			
		])
		
		
		
	}
}

extension DetailVC : UICollectionViewDelegate, UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 2
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TypeCell.cellIdentifier, for: indexPath) as? TypeCell else {fatalError("Unable deque cell...")}
		cell.configureCell(type: "Elif", bgColor: grassColor)
		return cell
	}
	
}
