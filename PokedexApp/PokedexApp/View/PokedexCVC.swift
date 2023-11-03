//
//  PokedexCVC.swift
//  PokedexApp
//
//  Created by Yakup on 3.11.2023.
//

import UIKit

import UIKit

class PokedexCVC: UICollectionViewCell {
	
	let imgPoke: UIImageView = {
		let imageView = UIImageView()
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.layer.cornerRadius = 20
		imageView.clipsToBounds = true
		imageView.contentMode = .scaleAspectFill
		return imageView
	}()
	
	
	let lblPoke: UILabel = {
		let label = UILabel()
		label.textColor = UIColor.black
		label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		addViews()
		addShadow()
		configureUI()
	}
	
	required init?(coder: NSCoder) {
		super.init(coder: coder)
		addViews()
	}
	
	func addViews(){
		addSubview(imgPoke)
		addSubview(lblPoke)
		
		imgPoke.widthAnchor.constraint(equalToConstant: 90).isActive = true
		imgPoke.heightAnchor.constraint(equalToConstant: 90).isActive = true
		imgPoke.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
		imgPoke.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -20).isActive = true
		
		lblPoke.topAnchor.constraint(equalTo: imgPoke.bottomAnchor, constant: 10).isActive = true
		lblPoke.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
		lblPoke.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
		lblPoke.textAlignment = .center
	}
	func addShadow() {
		contentView.layer.cornerRadius = 10
		contentView.layer.borderWidth = 1.0
		contentView.layer.borderColor = UIColor.lightGray.cgColor
		contentView.layer.masksToBounds = true

		layer.shadowColor = UIColor.black.cgColor
		layer.shadowOffset = CGSize(width: 0, height: 2)
		layer.shadowRadius = 4
		layer.shadowOpacity = 0.3
		layer.masksToBounds = false
		layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: contentView.layer.cornerRadius).cgPath
		layer.shouldRasterize = true
		layer.rasterizationScale = UIScreen.main.scale
	}

	func configureUI() {
		backgroundColor = .white
		layer.borderWidth = 1.0
		layer.borderColor = UIColor.lightGray.cgColor
		layer.cornerRadius = 10
	}
}
