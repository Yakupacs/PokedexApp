//
//  String+PokedexApp.swift
//  PokedexApp
//
//  Created by Yakup on 4.11.2023.
//

import Foundation

extension String{
	func getLastPath() -> Int{
		let fileName = self
		let fileArray = fileName.split(separator: "/")
		let finalFileName = fileArray.last
		return Int(finalFileName!)!
	}
}
