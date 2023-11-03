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
		movesValueLabel.numberOfLines = 2
		return movesValueLabel
	}()
	
	private let pokemonInfoLabel : UILabel = {
		let pokemonInfoLabel = UILabel()
		pokemonInfoLabel.translatesAutoresizingMaskIntoConstraints = false
		pokemonInfoLabel.textAlignment = .center
		pokemonInfoLabel.font = UIFont.boldSystemFont(ofSize: 14)
		pokemonInfoLabel.textColor = UIColor(red: 29 / 255.0, green: 29 / 255.0, blue: 29 / 255.0, alpha: 1)
		pokemonInfoLabel.numberOfLines = 1
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
		backButton.tintColor = .white
		return backButton
	}()
	private let pokemonNameLabel : UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "Placeholder"
		label.font = UIFont.boldSystemFont(ofSize: 24)
		label.textColor = .white
		return label
	}()
	
	private let pokemonIdLabel : UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "Placeholder"
		label.font = UIFont.boldSystemFont(ofSize: 16)
		label.textColor = .white
		return label
	}()
	private let pokeImageView : UIImageView = {
		let pokeballImageView = UIImageView()
		pokeballImageView.translatesAutoresizingMaskIntoConstraints = false
		return pokeballImageView
	}()
	
	private let baseStatsStackView: UIStackView = {
		let stackView = UIStackView()
		stackView.translatesAutoresizingMaskIntoConstraints = false
		stackView.axis = .vertical
		stackView.spacing = 8
		return stackView
	}()
	
	private let baseTitleLabel : UILabel = {
		let baseTitleLabel = UILabel()
		baseTitleLabel.translatesAutoresizingMaskIntoConstraints = false
		baseTitleLabel.textAlignment = .center
		baseTitleLabel.font = UIFont.boldSystemFont(ofSize: 20)
		baseTitleLabel.textColor = UIColor(red: 116 / 255.0, green: 203 / 255.0, blue: 72 / 255.0, alpha: 1)
		return baseTitleLabel
	}()
	
	private let hpLabel : UILabel = {
		let hpLabel = UILabel()
		hpLabel.translatesAutoresizingMaskIntoConstraints = false
		hpLabel.font = UIFont.boldSystemFont(ofSize: 14)
		hpLabel.textColor = UIColor(red: 116 / 255.0, green: 203 / 255.0, blue: 72 / 255.0, alpha: 1)
		return hpLabel
	}()
	
	private let atkLabel : UILabel = {
		let atkLabel = UILabel()
		atkLabel.translatesAutoresizingMaskIntoConstraints = false
		atkLabel.font = UIFont.boldSystemFont(ofSize: 14)
		atkLabel.textColor = UIColor(red: 116 / 255.0, green: 203 / 255.0, blue: 72 / 255.0, alpha: 1)
		return atkLabel
	}()
	
	private let defLabel : UILabel = {
		let defLabel = UILabel()
		defLabel.translatesAutoresizingMaskIntoConstraints = false
		defLabel.font = UIFont.boldSystemFont(ofSize: 14)
		defLabel.textColor = UIColor(red: 116 / 255.0, green: 203 / 255.0, blue: 72 / 255.0, alpha: 1)
		return defLabel
	}()
	
	private let satkLabel : UILabel = {
		let satkLabel = UILabel()
		satkLabel.translatesAutoresizingMaskIntoConstraints = false
		satkLabel.font = UIFont.boldSystemFont(ofSize: 14)
		satkLabel.textColor = UIColor(red: 116 / 255.0, green: 203 / 255.0, blue: 72 / 255.0, alpha: 1)
		return satkLabel
	}()
	
	private let sdefLabel : UILabel = {
		let sdefLabel = UILabel()
		sdefLabel.translatesAutoresizingMaskIntoConstraints = false
		sdefLabel.font = UIFont.boldSystemFont(ofSize: 14)
		sdefLabel.textColor = UIColor(red: 116 / 255.0, green: 203 / 255.0, blue: 72 / 255.0, alpha: 1)
		return sdefLabel
	}()
	
	private let spdLabel : UILabel = {
		let spdLabel = UILabel()
		spdLabel.translatesAutoresizingMaskIntoConstraints = false
		spdLabel.font = UIFont.boldSystemFont(ofSize: 14)
		spdLabel.textColor = UIColor(red: 116 / 255.0, green: 203 / 255.0, blue: 72 / 255.0, alpha: 1)
		return spdLabel
	}()
	
	private let baseValueStatsStackView: UIStackView = {
		let stackView = UIStackView()
		stackView.translatesAutoresizingMaskIntoConstraints = false
		stackView.axis = .vertical
		stackView.spacing = 8
		return stackView
	}()
	
	
	private let hpValueLabel : UILabel = {
		let hpLabel = UILabel()
		hpLabel.translatesAutoresizingMaskIntoConstraints = false
		hpLabel.font = UIFont.boldSystemFont(ofSize: 14)
		hpLabel.textColor = UIColor(red: 29 / 255.0, green: 29 / 255.0, blue: 29 / 255.0, alpha: 1)
		return hpLabel
	}()
	
	private let atkValueLabel : UILabel = {
		let atkLabel = UILabel()
		atkLabel.translatesAutoresizingMaskIntoConstraints = false
		atkLabel.font = UIFont.boldSystemFont(ofSize: 14)
		atkLabel.textColor = UIColor(red: 29 / 255.0, green: 29 / 255.0, blue: 29 / 255.0, alpha: 1)
		return atkLabel
	}()
	
	private let defValueLabel : UILabel = {
		let defLabel = UILabel()
		defLabel.translatesAutoresizingMaskIntoConstraints = false
		defLabel.font = UIFont.boldSystemFont(ofSize: 14)
		defLabel.textColor = UIColor(red: 29 / 255.0, green: 29 / 255.0, blue: 29 / 255.0, alpha: 1)
		return defLabel
	}()
	
	private let satkValueLabel : UILabel = {
		let satkLabel = UILabel()
		satkLabel.translatesAutoresizingMaskIntoConstraints = false
		satkLabel.font = UIFont.boldSystemFont(ofSize: 14)
		satkLabel.textColor = UIColor(red: 29 / 255.0, green: 29 / 255.0, blue: 29 / 255.0, alpha: 1)
		return satkLabel
	}()
	
	private let sdefValueLabel : UILabel = {
		let sdefLabel = UILabel()
		sdefLabel.translatesAutoresizingMaskIntoConstraints = false
		sdefLabel.font = UIFont.boldSystemFont(ofSize: 14)
		sdefLabel.textColor = UIColor(red: 29 / 255.0, green: 29 / 255.0, blue: 29 / 255.0, alpha: 1)
		return sdefLabel
	}()
	
	private let spdValueLabel : UILabel = {
		let spdLabel = UILabel()
		spdLabel.translatesAutoresizingMaskIntoConstraints = false
		spdLabel.font = UIFont.boldSystemFont(ofSize: 14)
		spdLabel.textColor = UIColor(red: 29 / 255.0, green: 29 / 255.0, blue: 29 / 255.0, alpha: 1)
		return spdLabel
	}()
	
	private let progressStackView: UIStackView = {
		let stackView = UIStackView()
		stackView.translatesAutoresizingMaskIntoConstraints = false
		stackView.axis = .vertical
		stackView.spacing = 21
		return stackView
	}()
	
	let hpProgressBar: UIProgressView = {
		let progressBar = UIProgressView()
		progressBar.translatesAutoresizingMaskIntoConstraints = false
		progressBar.progressTintColor = UIColor(red: 116 / 255.0, green: 203 / 255.0, blue: 72 / 255.0, alpha: 1)
		return progressBar
	}()
	
	let atkProgressBar: UIProgressView = {
		let progressBar = UIProgressView()
		progressBar.translatesAutoresizingMaskIntoConstraints = false
		progressBar.progressTintColor = UIColor(red: 116 / 255.0, green: 203 / 255.0, blue: 72 / 255.0, alpha: 1)
		return progressBar
	}()
	
	let defProgressBar: UIProgressView = {
		let progressBar = UIProgressView()
		progressBar.translatesAutoresizingMaskIntoConstraints = false
		progressBar.progressTintColor = UIColor(red: 116 / 255.0, green: 203 / 255.0, blue: 72 / 255.0, alpha: 1)
		return progressBar
	}()
	
	let satkProgressBar: UIProgressView = {
		let progressBar = UIProgressView()
		progressBar.translatesAutoresizingMaskIntoConstraints = false
		progressBar.progressTintColor = UIColor(red: 116 / 255.0, green: 203 / 255.0, blue: 72 / 255.0, alpha: 1)
		return progressBar
	}()
	
	let sdefProgressBar: UIProgressView = {
		let progressBar = UIProgressView()
		progressBar.translatesAutoresizingMaskIntoConstraints = false
		progressBar.progressTintColor = UIColor(red: 116 / 255.0, green: 203 / 255.0, blue: 72 / 255.0, alpha: 1)
		return progressBar
	}()
	
	let spdProgressBar: UIProgressView = {
		let progressBar = UIProgressView()
		progressBar.translatesAutoresizingMaskIntoConstraints = false
		progressBar.progressTintColor = UIColor(red: 116 / 255.0, green: 203 / 255.0, blue: 72 / 255.0, alpha: 1)
		return progressBar
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let fileName = SelectedPokemon.shared.selected?.url
		let fileArray = fileName?.split(separator: "/")
		let finalFileName = fileArray?.last
		detailViewModel?.getPokemon(withId: Int(finalFileName!)!)
		detailViewModel?.getPokemonDescription(withId: Int(finalFileName!)!)
		
		infoView.addSubview(baseTitleLabel)
		infoView.addSubview(baseStatsStackView)
		baseStatsStackView.addArrangedSubview(hpLabel)
		baseStatsStackView.addArrangedSubview(atkLabel)
		baseStatsStackView.addArrangedSubview(defLabel)
		baseStatsStackView.addArrangedSubview(satkLabel)
		baseStatsStackView.addArrangedSubview(sdefLabel)
		baseStatsStackView.addArrangedSubview(spdLabel)
		infoView.addSubview(baseValueStatsStackView)
		baseValueStatsStackView.addArrangedSubview(hpValueLabel)
		baseValueStatsStackView.addArrangedSubview(atkValueLabel)
		baseValueStatsStackView.addArrangedSubview(defValueLabel)
		baseValueStatsStackView.addArrangedSubview(satkValueLabel)
		baseValueStatsStackView.addArrangedSubview(sdefValueLabel)
		baseValueStatsStackView.addArrangedSubview(spdValueLabel)
		infoView.addSubview(progressStackView)
		progressStackView.addArrangedSubview(hpProgressBar)
		progressStackView.addArrangedSubview(atkProgressBar)
		progressStackView.addArrangedSubview(defProgressBar)
		progressStackView.addArrangedSubview(satkProgressBar)
		progressStackView.addArrangedSubview(sdefProgressBar)
		progressStackView.addArrangedSubview(spdProgressBar)
		
		view.addSubview(pokemonNameLabel)
		view.addSubview(pokemonIdLabel)
		view.addSubview(backButton)
		view.addSubview(pokeballImageView)
		view.addSubview(infoView)
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
		infoView.addSubview(typeButton1)
		infoView.addSubview(pokeImageView)
		
		view.backgroundColor = .white
		view.backgroundColor = grassColor
		
		setupConstraints()
		
		weightValueLabel.text = "Weight Value"
		weightTitleLabel.text = "Weight"
		
		heightValueLabel.text = "Height Value"
		heightTitleLabel.text = "Height"
		
		movesValueLabel.text = "Moves Value"
		movesTitleLabel.text = "Moves"
		pokemonInfoLabel.text = "There is a plant seed on its back right from the day this Pokémon is born. The seed slowly grows larger."
		
		
		baseTitleLabel.text = "Base Stats"
		hpLabel.text = "HP"
		atkLabel.text = "ATK"
		defLabel.text = "DEF"
		satkLabel.text = "SATK"
		sdefLabel.text = "SDEF"
		spdLabel.text = "SPD"
		
		hpValueLabel.text = "213"
		atkValueLabel.text = "312"
		defValueLabel.text = "132"
		satkValueLabel.text = "312"
		sdefValueLabel.text = "123"
		spdValueLabel.text = "312"
		
		hpProgressBar.progress = 0.5
		atkProgressBar.progress = 0.9
		defProgressBar.progress = 0.6
		satkProgressBar.progress = 0.7
		sdefProgressBar.progress = 0.1
		spdProgressBar.progress = 0.2
		
		backButton.addTarget(self, action: #selector(backFunc), for: .touchUpInside)
	}
	
	@objc func backFunc(){
		self.dismiss(animated: true)
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
			if let pokemon{
				let finalFileName = pokemon.id
				if let url = URL(string: "https://assets.pokemon.com/assets/cms2/img/pokedex/full/\(String(format:"%03d", finalFileName)).png") {
					self.pokeImageView.kf.setImage(with: url)
				}
				self.heightTitleLabel.text = "\(pokemon.height)"
				self.weightTitleLabel.text = "\(pokemon.weight)"
				self.movesTitleLabel.text = "\(pokemon.moves[0].move.name)\n\(pokemon.moves[1].move.name)"
				self.pokemonNameLabel.text = "\(pokemon.name)"
				self.pokemonIdLabel.text = "#\(pokemon.id)"
				self.typeButton1.setTitle("\(pokemon.types.first!.type.name)", for: .normal)
			}
		}
	}
	
	func setPokemonDescription(pokemonSpecies: PokemonSpecies?, error: String?) {
		DispatchQueue.main.async{
			if let pokemonSpecies{
				self.pokemonInfoLabel.text = "\(pokemonSpecies.flavorTextEntries.first!.flavorText)"
			}
		}
	}
	
	func setupConstraints() {
		NSLayoutConstraint.activate([
			backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
			backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
			
			pokemonNameLabel.centerYAnchor.constraint(equalTo: backButton.centerYAnchor),
			pokemonNameLabel.leadingAnchor.constraint(equalTo: backButton.trailingAnchor, constant: 8),
			
			pokemonIdLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
			pokemonIdLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
			
			pokeballImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
			pokeballImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -9),
			pokeballImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: (view.frame.width - (206))),
			pokeballImageView.heightAnchor.constraint(equalToConstant: 208),
			
			infoView.topAnchor.constraint(equalTo: pokeballImageView.bottomAnchor, constant: 8),
			infoView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 4),
			infoView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -4),
			infoView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -4),
			infoView.heightAnchor.constraint(equalToConstant: 700),
			
			pokeImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
			pokeImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			pokeImageView.heightAnchor.constraint(equalToConstant: 200),
			pokeImageView.widthAnchor.constraint(equalToConstant: 200),
			
			typeButton1.topAnchor.constraint(equalTo: infoView.topAnchor, constant: 56),
			typeButton1.heightAnchor.constraint(equalToConstant: 30),
			typeButton1.widthAnchor.constraint(equalToConstant: 100),
			typeButton1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			
			aboutTitleLabel.topAnchor.constraint(equalTo: typeButton1.bottomAnchor, constant: 16),
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
			weightDividerView.heightAnchor.constraint(equalTo: infoView.heightAnchor, multiplier: 0.07),
			
			heightImageView.topAnchor.constraint(equalTo: aboutTitleLabel.bottomAnchor, constant: 16),
			heightImageView.leadingAnchor.constraint(equalTo: weightDividerView.leadingAnchor, constant: 20),
			
			heightTitleLabel.topAnchor.constraint(equalTo: aboutTitleLabel.bottomAnchor, constant: 16),
			heightTitleLabel.leadingAnchor.constraint(equalTo: heightImageView.trailingAnchor, constant: 8),
			
			heightValueLabel.topAnchor.constraint(equalTo: heightTitleLabel.bottomAnchor, constant: 4),
			heightValueLabel.leadingAnchor.constraint(equalTo: weightDividerView.leadingAnchor, constant: 20),
			
			heightDividerView.topAnchor.constraint(equalTo: aboutTitleLabel.bottomAnchor, constant: 15),
			heightDividerView.widthAnchor.constraint(equalToConstant: 1),
			heightDividerView.leadingAnchor.constraint(equalTo: heightValueLabel.trailingAnchor, constant: 25),
			heightDividerView.heightAnchor.constraint(equalTo: infoView.heightAnchor, multiplier: 0.07),
			
			movesTitleLabel.topAnchor.constraint(equalTo: aboutTitleLabel.bottomAnchor, constant: 16),
			movesTitleLabel.leadingAnchor.constraint(equalTo: heightDividerView.leadingAnchor, constant: 20),
			
			movesValueLabel.topAnchor.constraint(equalTo: movesTitleLabel.bottomAnchor, constant: 4),
			movesValueLabel.leadingAnchor.constraint(equalTo: heightDividerView.leadingAnchor, constant: 20),
			
			pokemonInfoLabel.topAnchor.constraint(equalTo: movesValueLabel.bottomAnchor, constant: 40),
			pokemonInfoLabel.leadingAnchor.constraint(equalTo: infoView.leadingAnchor, constant: 20),
			pokemonInfoLabel.trailingAnchor.constraint(equalTo: infoView.trailingAnchor, constant: -20),
			
			baseTitleLabel.topAnchor.constraint(equalTo: pokemonInfoLabel.bottomAnchor, constant: 25),
			baseTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
			baseTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
			
			baseStatsStackView.topAnchor.constraint(equalTo: baseTitleLabel.bottomAnchor, constant: 25),
			baseStatsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
			
			baseValueStatsStackView.topAnchor.constraint(equalTo: baseTitleLabel.bottomAnchor, constant: 25),
			baseValueStatsStackView.leadingAnchor.constraint(equalTo: baseStatsStackView.trailingAnchor, constant: 20),
			
			progressStackView.topAnchor.constraint(equalTo: baseTitleLabel.bottomAnchor, constant: 30),
			progressStackView.leadingAnchor.constraint(equalTo: baseValueStatsStackView.trailingAnchor, constant: 20),
			progressStackView.trailingAnchor.constraint(equalTo: infoView.trailingAnchor, constant: -20)
		])
	}
}


