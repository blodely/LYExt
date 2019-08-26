//
//	LYExt.swift
//	LYExt
//
//	Created by Luo Yu on 2019-04-23.
//	Email: indie.luo@gmail.com
//
//	The MIT License (MIT)
//
//	Copyright (c) 2019 骆昱(Luo Yu). All rights reserved.
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

import Foundation
import UIKit


/// Library constant.
struct LYExtCt {
	
	/// screen width.
	static let Width: CGFloat = UIScreen.main.bounds.size.width
	
	/// screen height.
	static let Height: CGFloat = UIScreen.main.bounds.size.height
	
	/// screen scale.
	static let Scale: CGFloat = UIScreen.main.scale
	
	/// one pixel.
	static let Pixel1: CGFloat = 1 / LYExtCt.Scale
}

extension UIView {
	
	/// make current view instance display a one pixel width border with tint color.
	public func border1Px() {
		self.layer.borderWidth = LYExtCt.Pixel1
		self.layer.borderColor = self.tintColor.cgColor
	}
	
	public func bordered(withWidth width: CGFloat, andColor color: UIColor) {
		self.layer.borderColor = color.cgColor
		self.layer.borderWidth = width
	}

	public func roundedCornerRadius(radius: CGFloat) {
		self.layer.masksToBounds = true
		self.layer.cornerRadius = radius
	}
}
