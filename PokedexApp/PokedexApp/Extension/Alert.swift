//
//  Alert.swift
//  PokedexApp
//
//  Created by Yakup on 4.11.2023.
//

import Foundation
import UIKit

extension UIView{
	func addAlert(title: String, message: String) -> UIAlertController{
		let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
		let okeyAction = UIAlertAction(title: "Tamam", style: .default)
		alert.addAction(okeyAction)
		return alert
	}
}
