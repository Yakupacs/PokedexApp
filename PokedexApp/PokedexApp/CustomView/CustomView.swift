//
//  CustomView.swift
//  PokedexApp
//
//  Created by Yakup on 3.11.2023.
//

import Foundation
import UIKit

class CustomLabel: UILabel{
	init(frame: CGRect, text: String, fontName: String, size: CGFloat, textAlignment: NSTextAlignment, textColor: UIColor, line: Int) {
		super.init(frame: frame)
		commonInit(text: text, fontName: fontName, size: size, alignment: textAlignment, textColor: textColor, line: line)
	}
	
	private func commonInit(text: String, fontName: String, size: CGFloat, alignment: NSTextAlignment, textColor color: UIColor, line: Int){
		translatesAutoresizingMaskIntoConstraints = false
		font = UIFont(name: fontName, size: size)
		textAlignment = alignment
		textColor = color
		numberOfLines = line
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
