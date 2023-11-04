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
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = UIFont(name: "Poppins-Light", size: 12)
		return label
	}()
	
	let grayBackgroundView: UIView = {
		let view = UIView()
		view.backgroundColor = .systemGray6
		view.layer.cornerRadius = 15
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	let lblId: UILabel = {
		let label = UILabel()
		label.textColor = UIColor.gray
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = UIFont(name: "Poppins-Medium", size: 10)
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
		lblId.text = "#1"
		addSubview(lblId)
		addSubview(grayBackgroundView)
		grayBackgroundView.addSubview(imgPoke)
		grayBackgroundView.addSubview(lblPoke)
		
		imgPoke.widthAnchor.constraint(equalToConstant: 90).isActive = true
		imgPoke.heightAnchor.constraint(equalToConstant: 90).isActive = true
		imgPoke.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
		imgPoke.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -5).isActive = true
		
		lblPoke.topAnchor.constraint(equalTo: imgPoke.bottomAnchor, constant: 5).isActive = true
		lblPoke.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
		lblPoke.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
		lblPoke.textAlignment = .center		
		
		lblId.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
		lblId.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
		lblId.textAlignment = .center

		NSLayoutConstraint.activate([
			grayBackgroundView.bottomAnchor.constraint(equalTo: bottomAnchor),
			grayBackgroundView.leftAnchor.constraint(equalTo: leftAnchor),
			grayBackgroundView.rightAnchor.constraint(equalTo: rightAnchor),
			grayBackgroundView.heightAnchor.constraint(equalToConstant: 60)
		])

	}
	func addShadow() {
		contentView.layer.cornerRadius = 10
		contentView.layer.borderWidth = 1.0
		contentView.layer.borderColor = UIColor.lightGray.cgColor
		contentView.layer.masksToBounds = true

		layer.shadowColor = UIColor.black.cgColor
		layer.shadowOffset = CGSize(width: 0, height: 2)
		layer.shadowRadius = 4
		layer.shadowOpacity = 0.2
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
