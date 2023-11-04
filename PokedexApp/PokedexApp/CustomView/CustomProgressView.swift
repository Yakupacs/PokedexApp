//
//  CustomView.swift
//  PokedexApp
//
//  Created by Yakup on 3.11.2023.
//

import Foundation
import UIKit

class CustomProgressView: UIProgressView{
	override init(frame: CGRect) {
		super.init(frame: frame)
		translatesAutoresizingMaskIntoConstraints = false
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
