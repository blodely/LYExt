//
//  UIColorExt.swift
//  LYExt
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

public extension UIColor {
	
	/// Hex Color
	convenience init(hex: UInt, alpha: CGFloat = 1.0) {
		self.init(
			red: CGFloat((hex & 0xFF0000) >> 16) / 255.0,
			green: CGFloat((hex & 0x00FF00) >> 8) / 255.0,
			blue: CGFloat(hex & 0x0000FF) / 255.0,
			alpha: alpha
		)
	}
	
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
	
	/// Returns a color created by linearly interpolating between two colors.
	///
	/// Use this method to calculate a blended color between a starting color and a target color.
	/// The interpolation is performed component-wise across the Red, Green, Blue, and Alpha (RGBA) channels.
	///
	/// - Parameters:
	///   - from: The starting color of the interpolation.
	///   - to: The target color of the interpolation.
	///   - t: The interpolation factor (blend amount). This value is clamped to the range `0.0` to `1.0`.
	///        A value of `0.0` returns `from`, `1.0` returns `to`, and intermediate values return a blend of both.
	/// - Returns: A new `UIColor` representing the interpolated color.
	///
	static func mix(_ from: UIColor, _ to: UIColor, amount t: CGFloat) -> UIColor {
		var r1: CGFloat = 0, g1: CGFloat = 0, b1: CGFloat = 0, a1: CGFloat = 0
		var r2: CGFloat = 0, g2: CGFloat = 0, b2: CGFloat = 0, a2: CGFloat = 0
		from.getRed(&r1, green: &g1, blue: &b1, alpha: &a1)
		to.getRed(&r2, green: &g2, blue: &b2, alpha: &a2)
		let k = min(max(t, 0), 1)
		return UIColor(red: r1 + (r2 - r1) * k, green: g1 + (g2 - g1) * k,
					   blue: b1 + (b2 - b1) * k, alpha: a1 + (a2 - a1) * k)
	}
}
