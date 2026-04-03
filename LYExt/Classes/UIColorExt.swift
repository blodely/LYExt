//
//	UIColorExt.swift
//	LYExt
//
//	Created by Luo Yu on 2026-04-04.
//	Email: blodely@gmail.com
//
//	The MIT License (MIT)
//
//	Copyright (c) 2026 骆昱(Luo Yu). All rights reserved.
//
//	Permission is hereby granted, free of charge, to any person obtaining a copy of
//	this software and associated documentation files (the "Software"), to deal in
//	the Software without restriction, including without limitation the rights to
//	use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
//	the Software, and to permit persons to whom the Software is furnished to do so,
//	subject to the following conditions:
//
//	The above copyright notice and this permission notice shall be included in all
//	copies or substantial portions of the Software.
//
//	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
//	FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
//	COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
//	IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
//	CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//

import UIKit

extension UIColor {
	
	/// Support #RRGGBB or #RRGGBBAA
	convenience init(hexc: String) {
		var hexSanitized = hexc.trimmingCharacters(in: .whitespacesAndNewlines)
		hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
		
		var rgb: UInt64 = 0
		// Try to convert String to hex number
		guard Scanner(string: hexSanitized).scanHexInt64(&rgb) else {
			// Fallback to clear color
			self.init(red: 0, green: 0, blue: 0, alpha: 0)
			return
		}
		
		let length = hexSanitized.count
		// RGB or RGBA
		if length == 6 {
			// #RRGGBB (with alpha 1 by default)
			self.init(
				red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
				green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0,
				blue: CGFloat(rgb & 0x0000FF) / 255.0,
				alpha: 1.0
			)
		} else if length == 8 {
			// #RRGGBBAA (contain alpha value)
			self.init(
				red: CGFloat((rgb & 0xFF000000) >> 24) / 255.0,
				green: CGFloat((rgb & 0x00FF0000) >> 16) / 255.0,
				blue: CGFloat((rgb & 0x0000FF00) >> 8) / 255.0,
				alpha: CGFloat(rgb & 0x000000FF) / 255.0
			)
		} else {
			// Fallback to clear color
			self.init(red: 0, green: 0, blue: 0, alpha: 0)
		}
	}
}
