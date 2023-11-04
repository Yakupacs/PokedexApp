//
//  DetailVC.swift
//  PokedexApp
//
//  Created by Yakup on 3.11.2023.
//

import UIKit
import Kingfisher

class DetailVC: UIViewController, DetailPokemonOutput {
	
	var pokemonColor: UIColor? = UIColor(red: 116 / 255.0, green: 203 / 255.0, blue: 72 / 255.0, alpha: 1)
	var pokemon: Pokemon?
	var detailViewModel: DetailViewModel?
	var selectedPokemon: SelectedPokemon?
	var typesCount: Int = 0
	var buttons = [UIButton]()
	
	private let buttonStackView: UIStackView = {
		let stackView = UIStackView()
		stackView.translatesAutoresizingMaskIntoConstraints = false
		stackView.axis = .horizontal
		stackView.spacing = 8
		return stackView
	}()
	
	private let backgroundImageView : UIImageView = {
		let pokeballImageView = UIImageView()
		pokeballImageView.translatesAutoresizingMaskIntoConstraints = false
		pokeballImageView.image = UIImage(named: "pokeball1")
		pokeballImageView.alpha = CGFloat(0.1)
		pokeballImageView.tintColor = .gray
		return pokeballImageView
	}()
	
	private let infoView : UIView = {
		let infoView = UIView()
		infoView.translatesAutoresizingMaskIntoConstraints = false
		infoView.backgroundColor = .white
		infoView.layer.cornerRadius = 10
		return infoView
	}()
	
	let backButton: UIButton = {
		let backButton = UIButton()
		backButton.translatesAutoresizingMaskIntoConstraints = false
		backButton.setImage(UIImage(named: "arrow_back"), for: .normal)
		backButton.tintColor = .white
		return backButton
	}()
	
	private let pokemonNameLabel = CustomLabel(frame: .zero, text: "", fontName: "Poppins-Bold", size: 24, textAlignment: .left, textColor: .white, line: 0)
	private let pokemonIdLabel = CustomLabel(frame: .zero, text: "", fontName: "Poppins-Bold", size: 12, textAlignment: .right, textColor: .white, line: 0)
	
	private let pokeImageView : UIImageView = {
		let pokeballImageView = UIImageView()
		pokeballImageView.translatesAutoresizingMaskIntoConstraints = false
		return pokeballImageView
	}()
	
	let backPokemonButton: UIButton = {
		let backButton = UIButton()
		backButton.translatesAutoresizingMaskIntoConstraints = false
		backButton.setImage(UIImage(named: "left"), for: .normal)
		backButton.tintColor = .white
		return backButton
	}()
	
	let nextPokemonButton: UIButton = {
		let backButton = UIButton()
		backButton.translatesAutoresizingMaskIntoConstraints = false
		backButton.setImage(UIImage(named: "right"), for: .normal)
		backButton.tintColor = .white
		return backButton
	}()
	
	private let aboutTitleLabel = CustomLabel(frame: .zero, text: "About", fontName: "Poppins-Bold", size: 16, textAlignment: .center, textColor: .black, line: 1)
	
	let weightDividerView: UIView = {
		let dividerView = UIView()
		dividerView.translatesAutoresizingMaskIntoConstraints = false
		dividerView.backgroundColor = UIColor.systemGray3
		return dividerView
	}()
	
	private let weightImageView : UIImageView = {
		let weightImageView = UIImageView()
		weightImageView.translatesAutoresizingMaskIntoConstraints = false
		weightImageView.image = UIImage(named: "weight")
		return weightImageView
	}()
	
	private let weightTitleLabel = CustomLabel(frame: .zero, text: "", fontName: "Poppins-Light", size: 12, textAlignment: .center, textColor: .black, line: 0)
	private let weightValueLabel = CustomLabel(frame: .zero, text: "", fontName: "Poppins-Light", size: 10, textAlignment: .center, textColor: .black, line: 0)
	
	private let heightImageView : UIImageView = {
		let heightImageView = UIImageView()
		heightImageView.translatesAutoresizingMaskIntoConstraints = false
		heightImageView.image = UIImage(named: "height")
		return heightImageView
	}()
	
	private let heightTitleLabel = CustomLabel(frame: .zero, text: "", fontName: "Poppins-Light", size: 12, textAlignment: .center, textColor: .black, line: 0)
	private let heightValueLabel = CustomLabel(frame: .zero, text: "", fontName: "Poppins-Light", size: 10, textAlignment: .center, textColor: .black, line: 0)
	
	let heightDividerView: UIView = {
		let dividerView = UIView()
		dividerView.translatesAutoresizingMaskIntoConstraints = false
		dividerView.backgroundColor = UIColor.systemGray3
		return dividerView
	}()
	
	private let movesTitleLabel = CustomLabel(frame: .zero, text: "", fontName: "Poppins-Light", size: 12, textAlignment: .left, textColor: .black, line: 0)
	private let movesValueLabel = CustomLabel(frame: .zero, text: "", fontName: "Poppins-Light", size: 10, textAlignment: .center, textColor: .black, line: 0)
	private let pokemonInfoLabel = CustomLabel(frame: .zero, text: "", fontName: "Poppins-Light", size: 12, textAlignment: .left, textColor: .black, line: 0)
	
	private let baseStatsStackView: UIStackView = {
		let stackView = UIStackView()
		stackView.translatesAutoresizingMaskIntoConstraints = false
		stackView.axis = .vertical
		stackView.spacing = 8
		return stackView
	}()
	
	private let baseTitleLabel = CustomLabel(frame: .zero, text: "", fontName: "Poppins-Bold", size: 18, textAlignment: .center, textColor: .black, line: 0)
	
	private let hpLabel = CustomLabel(frame: .zero, text: "", fontName: "Poppins-Bold", size: 13, textAlignment: .left, textColor: .black, line: 1)
	private let atkLabel = CustomLabel(frame: .zero, text: "", fontName: "Poppins-Bold", size: 13, textAlignment: .left, textColor: .black, line: 1)
	private let defLabel = CustomLabel(frame: .zero, text: "", fontName: "Poppins-Bold", size: 13, textAlignment: .left, textColor: .black, line: 1)
	private let satkLabel = CustomLabel(frame: .zero, text: "", fontName: "Poppins-Bold", size: 13, textAlignment: .left, textColor: .black, line: 1)
	private let sdefLabel = CustomLabel(frame: .zero, text: "", fontName: "Poppins-Bold", size: 13, textAlignment: .left, textColor: .black, line: 1)
	private let spdLabel = CustomLabel(frame: .zero, text: "", fontName: "Poppins-Bold", size: 13, textAlignment: .left, textColor: .black, line: 1)
	
	private let baseValueStatsStackView: UIStackView = {
		let stackView = UIStackView()
		stackView.translatesAutoresizingMaskIntoConstraints = false
		stackView.axis = .vertical
		stackView.spacing = 8
		return stackView
	}()
	
	private let hpValueLabel = CustomLabel(frame: .zero, text: "", fontName: "Poppins-Light", size: 13, textAlignment: .right, textColor: .black, line: 1)
	private let atkValueLabel = CustomLabel(frame: .zero, text: "", fontName: "Poppins-Light", size: 13, textAlignment: .right, textColor: .black, line: 1)
	private let defValueLabel = CustomLabel(frame: .zero, text: "", fontName: "Poppins-Light", size: 13, textAlignment: .right, textColor: .black, line: 1)
	private let satkValueLabel = CustomLabel(frame: .zero, text: "", fontName: "Poppins-Light", size: 13, textAlignment: .right, textColor: .black, line: 1)
	private let sdefValueLabel = CustomLabel(frame: .zero, text: "", fontName: "Poppins-Light", size: 13, textAlignment: .right, textColor: .black, line: 1)
	private let spdValueLabel = CustomLabel(frame: .zero, text: "", fontName: "Poppins-Light", size: 13, textAlignment: .right, textColor: .black, line: 1)
	
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
	
	let baseDividerView: UIView = {
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.backgroundColor = .systemGray3
		return view
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setupConstraints()
		backButton.addTarget(self, action: #selector(backFunc), for: .touchUpInside)
		backPokemonButton.addTarget(self, action: #selector(backPokemonFunc), for: .touchUpInside)
		nextPokemonButton.addTarget(self, action: #selector(nextPokemonFunc), for: .touchUpInside)
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
			if let error{
				let alert = self.view.addAlert(title: "Error", message: error)
				self.present(alert, animated: true)
			}else{
				for subview in self.buttonStackView.arrangedSubviews {
					subview.removeFromSuperview()
				}
				if let pokemon{
					self.pokemon = pokemon
					if (pokemon.id == 1){
						self.backPokemonButton.isHidden = true
					}else{
						self.backPokemonButton.isHidden = false
					}
					let finalFileName = pokemon.id
					if let url = URL(string: "https://assets.pokemon.com/assets/cms2/img/pokedex/full/\(String(format:"%03d", finalFileName)).png") {
						self.pokeImageView.kf.setImage(with: url)
					}
					self.nextPokemonButton.isEnabled = false
					self.backPokemonButton.isEnabled = false
					
					self.pokemonImageAnimate()
					
					self.typesCount = pokemon.types.count
					self.heightTitleLabel.text = "\(pokemon.height) m"
					self.weightTitleLabel.text = "\(pokemon.weight) kg"
					self.movesTitleLabel.text = "\(pokemon.moves[0].move.name.capitalized)\n\(pokemon.moves[1].move.name.capitalized)"
					self.pokemonNameLabel.text = pokemon.name.capitalized
					self.pokemonIdLabel.text = "#\(String(format:"%03d", pokemon.id))"
					self.buttonsRename()
					self.buttons = []
					self.view.backgroundColor = self.setColor(pokemonType: pokemon.types.first!.type.name.capitalized)
					self.aboutTitleLabel.textColor = self.setColor(pokemonType: pokemon.types.first!.type.name.capitalized)
					self.baseTitleLabel.textColor = self.setColor(pokemonType: pokemon.types.first!.type.name.capitalized)
					self.setProgressBarLabel(pokemonType: pokemon.types.first!.type.name.capitalized)
					self.setProgressBarColor(pokemon: pokemon)
					self.setProgressBarAnimate(pokemon: pokemon)
					
				}
			}
		}
	}
	
	func setPokemonDescription(pokemonSpecies: PokemonSpecies?, error: String?) {
		DispatchQueue.main.async{
			if let error{
				let alert = self.view.addAlert(title: "Error", message: error)
				self.present(alert, animated: true)
			}else{
				if let pokemonSpecies{
					var allWords = String()
					let words = pokemonSpecies.flavorTextEntries.first?.flavorText.split(separator: "\n")
					for word in words!{
						allWords.append("\(word)  ")
					}
					self.pokemonInfoLabel.text = "\(allWords)"
				}
			}
		}
	}
	
	func buttonsRename() {
		for i in 0...typesCount - 1 {
			let typeButton = UIButton()
			typeButton.translatesAutoresizingMaskIntoConstraints = false
			typeButton.layer.cornerRadius = 15
			typeButton.backgroundColor = setColor(pokemonType: pokemon!.types[i].type.name.capitalized)
			typeButton.clipsToBounds = true
			typeButton.tintColor = UIColor.white
			typeButton.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
			typeButton.titleLabel?.font = UIFont(name: "Poppins-Bold", size: 12)
			buttons.append(typeButton)
			if let pokemon {
				typeButton.setTitle("    \(pokemon.types[i].type.name.capitalized)    ", for: .normal)
			}
		}
		for button in buttons {
			buttonStackView.addArrangedSubview(button)
		}
	}
	
	@objc func backPokemonFunc(){
		detailViewModel?.getBackPokemon(withId: self.pokemon!.id)
	}
	
	@objc func nextPokemonFunc(){
		detailViewModel?.getNextPokemon(withId: self.pokemon!.id)
	}
	
	@objc func backFunc(){
		self.dismiss(animated: true)
	}
}

// MARK: - Appearance
extension DetailVC{
	func setupConstraints() {
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
		view.addSubview(backgroundImageView)
		view.addSubview(infoView)
		view.addSubview(aboutTitleLabel)
		view.addSubview(backPokemonButton)
		view.addSubview(nextPokemonButton)
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
		infoView.addSubview(buttonStackView)
		infoView.addSubview(pokeImageView)
		infoView.addSubview(baseDividerView)
		
		view.backgroundColor = .white
		
		NSLayoutConstraint.activate([
			backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
			backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
			
			pokemonNameLabel.centerYAnchor.constraint(equalTo: backButton.centerYAnchor),
			pokemonNameLabel.leadingAnchor.constraint(equalTo: backButton.trailingAnchor, constant: 8),
			
			pokemonIdLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
			pokemonIdLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
			
			backgroundImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
			backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -9),
			backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: (view.frame.width - (206))),
			backgroundImageView.heightAnchor.constraint(equalToConstant: 208),
			
			infoView.topAnchor.constraint(equalTo: backgroundImageView.bottomAnchor, constant: 50),
			infoView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 6),
			infoView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -6),
			infoView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
			
			pokeImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 170),
			pokeImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			pokeImageView.heightAnchor.constraint(equalToConstant: 200),
			pokeImageView.widthAnchor.constraint(equalToConstant: 200),
			
			backPokemonButton.bottomAnchor.constraint(equalTo: infoView.topAnchor, constant: -15),
			backPokemonButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25),
			nextPokemonButton.bottomAnchor.constraint(equalTo: infoView.topAnchor, constant: -15),
			nextPokemonButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -25),
			
			buttonStackView.topAnchor.constraint(equalTo: pokeImageView.bottomAnchor, constant: 20),
			buttonStackView.heightAnchor.constraint(equalToConstant: 30),
			buttonStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			
			aboutTitleLabel.topAnchor.constraint(equalTo: buttonStackView.bottomAnchor, constant: 16),
			aboutTitleLabel.leadingAnchor.constraint(equalTo: infoView.leadingAnchor, constant: 20),
			aboutTitleLabel.trailingAnchor.constraint(equalTo: infoView.trailingAnchor, constant: -20),
			
			heightTitleLabel.topAnchor.constraint(equalTo: aboutTitleLabel.bottomAnchor, constant: 30),
			heightTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			
			heightValueLabel.topAnchor.constraint(equalTo: heightTitleLabel.bottomAnchor, constant: 20),
			heightValueLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			
			heightDividerView.topAnchor.constraint(equalTo: aboutTitleLabel.bottomAnchor, constant: 30),
			heightDividerView.widthAnchor.constraint(equalToConstant: 1),
			heightDividerView.leadingAnchor.constraint(equalTo: heightValueLabel.trailingAnchor, constant: 35),
			heightDividerView.heightAnchor.constraint(equalTo: infoView.heightAnchor, multiplier: 0.1),
			
			heightImageView.topAnchor.constraint(equalTo: aboutTitleLabel.bottomAnchor, constant: 30),
			heightImageView.trailingAnchor.constraint(equalTo: heightValueLabel.leadingAnchor),
			heightImageView.heightAnchor.constraint(equalToConstant: 16),
			heightImageView.widthAnchor.constraint(equalToConstant: 16),
			
			weightImageView.topAnchor.constraint(equalTo: aboutTitleLabel.bottomAnchor, constant: 30),
			weightImageView.rightAnchor.constraint(equalTo: weightTitleLabel.leftAnchor, constant: -10),
			weightImageView.heightAnchor.constraint(equalToConstant: 16),
			weightImageView.widthAnchor.constraint(equalToConstant: 16),
			
			weightTitleLabel.topAnchor.constraint(equalTo: aboutTitleLabel.bottomAnchor, constant: 30),
			weightTitleLabel.rightAnchor.constraint(equalTo: weightDividerView.leftAnchor, constant: -30),
			
			weightValueLabel.topAnchor.constraint(equalTo: weightTitleLabel.bottomAnchor, constant: 20),
			weightValueLabel.rightAnchor.constraint(equalTo: weightDividerView.leftAnchor, constant: -30),
			
			weightDividerView.topAnchor.constraint(equalTo: aboutTitleLabel.bottomAnchor, constant: 25),
			weightDividerView.widthAnchor.constraint(equalToConstant: 1),
			weightDividerView.trailingAnchor.constraint(equalTo: heightImageView.leadingAnchor, constant: -20),
			weightDividerView.heightAnchor.constraint(equalTo: infoView.heightAnchor, multiplier: 0.1),
			
			movesTitleLabel.topAnchor.constraint(equalTo: aboutTitleLabel.bottomAnchor, constant: 25),
			movesTitleLabel.leadingAnchor.constraint(equalTo: heightDividerView.leadingAnchor, constant: 25),
			
			movesValueLabel.topAnchor.constraint(equalTo: movesTitleLabel.bottomAnchor, constant: 5),
			movesValueLabel.leadingAnchor.constraint(equalTo: heightDividerView.leadingAnchor, constant: 25),
			
			pokemonInfoLabel.topAnchor.constraint(equalTo: movesValueLabel.bottomAnchor, constant: 40),
			pokemonInfoLabel.centerXAnchor.constraint(equalTo: infoView.centerXAnchor),
			
			baseTitleLabel.topAnchor.constraint(equalTo: pokemonInfoLabel.bottomAnchor, constant: 25),
			baseTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
			baseTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
			
			baseStatsStackView.topAnchor.constraint(equalTo: baseTitleLabel.bottomAnchor, constant: 25),
			baseStatsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
			
			baseDividerView.topAnchor.constraint(equalTo: baseTitleLabel.bottomAnchor, constant: 25),
			baseDividerView.widthAnchor.constraint(equalToConstant: 1),
			baseDividerView.leadingAnchor.constraint(equalTo: baseStatsStackView.trailingAnchor, constant: (baseStatsStackView.frame.width + 20)),
			baseDividerView.heightAnchor.constraint(equalTo: baseStatsStackView.heightAnchor, multiplier: 1.0),
			
			baseValueStatsStackView.topAnchor.constraint(equalTo: baseTitleLabel.bottomAnchor, constant: 25),
			baseValueStatsStackView.leadingAnchor.constraint(equalTo: baseDividerView.trailingAnchor, constant: 20),
			
			progressStackView.topAnchor.constraint(equalTo: baseTitleLabel.bottomAnchor, constant: 30),
			progressStackView.leadingAnchor.constraint(equalTo: baseValueStatsStackView.trailingAnchor, constant: 20),
			progressStackView.trailingAnchor.constraint(equalTo: infoView.trailingAnchor, constant: -20),
			
			hpProgressBar.heightAnchor.constraint(equalToConstant: 6),
			atkProgressBar.heightAnchor.constraint(equalToConstant: 6),
			defProgressBar.heightAnchor.constraint(equalToConstant: 6),
			spdProgressBar.heightAnchor.constraint(equalToConstant: 6),
			satkProgressBar.heightAnchor.constraint(equalToConstant: 6),
			sdefProgressBar.heightAnchor.constraint(equalToConstant: 6),
		])
		
		aboutTitleLabel.text = "About"
		weightValueLabel.text = "Weight"
		heightValueLabel.text = "Height"
		movesValueLabel.text = "Moves"
		baseTitleLabel.text = "Base Stats"
		hpLabel.text = "HP"
		atkLabel.text = "ATK"
		defLabel.text = "DEF"
		satkLabel.text = "SATK"
		sdefLabel.text = "SDEF"
		spdLabel.text = "SPD"
	}
	
	func setProgressBarLabel(pokemonType: String){
		self.hpLabel.textColor = self.setColor(pokemonType: pokemonType)
		self.atkLabel.textColor = self.setColor(pokemonType: pokemonType)
		self.defLabel.textColor = self.setColor(pokemonType: pokemonType)
		self.satkLabel.textColor = self.setColor(pokemonType: pokemonType)
		self.sdefLabel.textColor = self.setColor(pokemonType: pokemonType)
		self.spdLabel.textColor = self.setColor(pokemonType: pokemonType)
	}
	
	func setProgressBarColor(pokemon: Pokemon){
		self.hpProgressBar.progressTintColor = self.setColor(pokemonType: pokemon.types.first!.type.name.capitalized)
		self.atkProgressBar.progressTintColor = self.setColor(pokemonType: pokemon.types.first!.type.name.capitalized)
		self.defProgressBar.progressTintColor = self.setColor(pokemonType: pokemon.types.first!.type.name.capitalized)
		self.satkProgressBar.progressTintColor = self.setColor(pokemonType: pokemon.types.first!.type.name.capitalized)
		self.sdefProgressBar.progressTintColor = self.setColor(pokemonType: pokemon.types.first!.type.name.capitalized)
		self.spdProgressBar.progressTintColor = self.setColor(pokemonType: pokemon.types.first!.type.name.capitalized)
	}
	
	func setProgressBarAnimate(pokemon: Pokemon){
		self.hpProgressBar.setProgress(0.0, animated: false)
		DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
			self.hpProgressBar.setProgress((Float(pokemon.stats[0].baseStat) / 225.0), animated: false)
			UIView.animate(withDuration: 1.5, delay: 0, options: [], animations: { [unowned self] in
				self.hpProgressBar.layoutIfNeeded()
			})
		}
		self.hpValueLabel.text = String(pokemon.stats[0].baseStat)
		
		self.atkProgressBar.setProgress(0.0, animated: false)
		DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
			self.atkProgressBar.setProgress((Float(pokemon.stats[1].baseStat) / 225.0), animated: false)
			UIView.animate(withDuration: 1.5, delay: 0, options: [], animations: { [unowned self] in
				self.atkProgressBar.layoutIfNeeded()
			})
		}
		self.atkValueLabel.text = String(pokemon.stats[1].baseStat)
		
		self.defProgressBar.setProgress(0.0, animated: false)
		DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
			self.defProgressBar.setProgress((Float(pokemon.stats[2].baseStat) / 225.0), animated: false)
			UIView.animate(withDuration: 1.5, delay: 0, options: [], animations: { [unowned self] in
				self.defProgressBar.layoutIfNeeded()
			})
		}
		self.defValueLabel.text = String(pokemon.stats[2].baseStat)
		
		self.satkProgressBar.setProgress(0.0, animated: false)
		DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
			self.satkProgressBar.setProgress((Float(pokemon.stats[3].baseStat) / 225.0), animated: false)
			UIView.animate(withDuration: 1.5, delay: 0, options: [], animations: { [unowned self] in
				self.satkProgressBar.layoutIfNeeded()
			})
		}
		self.satkValueLabel.text = String(pokemon.stats[3].baseStat)
		
		self.sdefProgressBar.setProgress(0.0, animated: false)
		DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
			self.sdefProgressBar.setProgress((Float(pokemon.stats[4].baseStat) / 225.0), animated: false)
			UIView.animate(withDuration: 1.5, delay: 0, options: [], animations: { [unowned self] in
				self.sdefProgressBar.layoutIfNeeded()
			})
		}
		self.sdefValueLabel.text = String(pokemon.stats[4].baseStat)
		
		self.spdProgressBar.setProgress(0.0, animated: false)
		DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
			self.spdProgressBar.setProgress((Float(pokemon.stats[5].baseStat) / 225.0), animated: false)
			UIView.animate(withDuration: 1.5, delay: 0, options: [], animations: { [unowned self] in
				self.spdProgressBar.layoutIfNeeded()
			})
		}
		self.spdValueLabel.text = String(pokemon.stats[5].baseStat)
	}
	
	func setColor(pokemonType: String) -> UIColor{
		if pokemonType == "Grass"{
			return UIColor(red: 116 / 255.0, green: 203 / 255.0, blue: 72 / 255.0, alpha: 1)
		}else if pokemonType == "Poison"{
			return UIColor(red: 164 / 255.0, green: 62 / 255.0, blue: 158 / 255.0, alpha: 1)
		}else if pokemonType == "Fire"{
			return UIColor(red: 245 / 255.0, green: 125 / 255.0, blue: 49 / 255.0, alpha: 1)
		}else if pokemonType == "Water"{
			return UIColor(red: 100 / 255.0, green: 147 / 255.0, blue: 235 / 255.0, alpha: 1)
		}else if pokemonType == "Bug"{
			return UIColor(red: 167 / 255.0, green: 183 / 255.0, blue: 35 / 255.0, alpha: 1)
		}else if pokemonType == "Flying"{
			return UIColor(red: 168 / 255.0, green: 145 / 255.0, blue: 236 / 255.0, alpha: 1)
		}else if pokemonType == "Electric"{
			return UIColor(red: 249 / 255.0, green: 207 / 255.0, blue: 48 / 255.0, alpha: 1)
		}else if pokemonType == "Ghost"{
			return UIColor(red: 112 / 255.0, green: 85 / 255.0, blue: 155 / 255.0, alpha: 1)
		}else if pokemonType == "Normal"{
			return UIColor(red: 170 / 255.0, green: 166 / 255.0, blue: 127 / 255.0, alpha: 1)
		}else if pokemonType == "Psychic"{
			return UIColor(red: 251 / 255.0, green: 85 / 255.0, blue: 132 / 255.0, alpha: 1)
		}else if pokemonType == "Steel"{
			return UIColor(red: 183 / 255.0, green: 185 / 255.0, blue: 208 / 255.0, alpha: 1)
		}else if pokemonType == "Rock"{
			return UIColor(red: 182 / 255.0, green: 158 / 255.0, blue: 49 / 255.0, alpha: 1)
		}else{
			return UIColor(red: 116 / 255.0, green: 203 / 255.0, blue: 72 / 255.0, alpha: 1)
		}
	}
	
	func pokemonImageAnimate(){
		UIView.animate(withDuration: 1) {
			self.pokeImageView.frame.origin.y += 20
		} completion: { _ in
			UIView.animate(withDuration: 1) {
				self.pokeImageView.frame.origin.y -= 20
			} completion: { _ in
				UIView.animate(withDuration: 1) {
					self.pokeImageView.frame.origin.y += 20
				} completion: { _ in
					self.nextPokemonButton.isEnabled = true
					self.backPokemonButton.isEnabled = true
				}
			}
		}
	}
}
