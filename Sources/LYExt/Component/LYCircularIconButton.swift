//
//  LYCircularIconButton.swift
//  LYExt
//
//	Created by Luo Yu on 2026-09-17.
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

final class LYCircularIconButton: UIButton {

	// MARK: - PROPERTIES
	private let buttonSize: CGFloat
	private let iconPointSize: CGFloat
	private let systemName: String

	// MARK: - INIT

	init(
		systemName: String = "",
		buttonSize: CGFloat = 44,
		iconPointSize: CGFloat = 18
	) {
		self.systemName = systemName
		self.buttonSize = buttonSize
		self.iconPointSize = iconPointSize

		super.init(frame: .zero)

		initial()
	}

	required init?(coder: NSCoder) {
		self.systemName = ""
		self.buttonSize = 44
		self.iconPointSize = 18

		super.init(coder: coder)

		initial()
	}

	private func initial() {

		let image = UIImage(
			systemName: systemName,
			withConfiguration: UIImage.SymbolConfiguration(
				pointSize: iconPointSize,
				weight: .regular
			)
		)

		if #available(iOS 26.0, *) {
			var configuration = UIButton.Configuration.glass()

			configuration.image = image
			configuration.baseForegroundColor = .white

			configuration.cornerStyle = .capsule
			configuration.buttonSize = .large

			self.configuration = configuration
		} else {
			var configuration = UIButton.Configuration.filled()

			configuration.image = image
			configuration.baseForegroundColor = .white
			configuration.baseBackgroundColor = UIColor(white: 0.35, alpha: 0.8)

			configuration.cornerStyle = .capsule

			self.configuration = configuration
		}
	}

	/// Layout
	override var intrinsicContentSize: CGSize {
		CGSize(width: buttonSize, height: buttonSize)
	}

	/// Touch Animation
	override var isHighlighted: Bool {
		didSet {
			UIView.animate(
				withDuration: 0.12,
				delay: 0,
				options: [.beginFromCurrentState, .allowUserInteraction]
			) {
				self.transform = self.isHighlighted
					? CGAffineTransform(scaleX: 0.94, y: 0.94)
					: .identity
			}
		}
	}
}
