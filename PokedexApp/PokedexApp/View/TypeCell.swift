//
//  TypeCell.swift
//  PokedexApp
//
//  Created by Yakup on 3.11.2023.
//

import UIKit

class TypeCell: UICollectionViewCell {
	
	static let cellIdentifier = "TypeCell"
	
	private let typeView : UIView = {
		let typeView = UIView()
		typeView.translatesAutoresizingMaskIntoConstraints = false

		return typeView
	}()
	
	private let typeLabel : UILabel = {
		let typeLabel = UILabel()
		typeLabel.translatesAutoresizingMaskIntoConstraints = false
		return typeLabel
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		addSubview(typeView)
		typeView.addSubview(typeLabel)
		setUpConstrains()
	
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func setUpConstrains() {
		NSLayoutConstraint.activate([
			typeView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
			typeView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
			typeView.topAnchor.constraint(equalTo: self.topAnchor),
			typeView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
	
			typeLabel.centerXAnchor.constraint(equalTo: typeView.centerXAnchor),
			typeLabel.centerYAnchor.constraint(equalTo: typeView.centerYAnchor)
		])
	}
	
	func configureCell(type: String?, bgColor: UIColor?) {
		if let type, let bgColor {
			typeLabel.text = type
			typeView.backgroundColor = bgColor
		}
	}
	
}
