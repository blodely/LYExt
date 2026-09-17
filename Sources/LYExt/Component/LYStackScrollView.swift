//
//  LYStackScrollView.swift
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

open class LYStackScrollView: UIView {
	
	public weak var scrollview: UIScrollView?
	public weak var stackview: UIStackView?
	
	// MARK: - INIT
	public override init(frame: CGRect) {
		super.init(frame: frame)
		initial()
	}
	
	public required init?(coder: NSCoder) {
		super.init(coder: coder)
		initial()
	}
	
	open func initial() {
		
		do {
			backgroundColor = .clear
		}
		
		// MARK: SCROLL VIEW
		do {
			let view = UIScrollView()
			view.translatesAutoresizingMaskIntoConstraints = false
			view.showsHorizontalScrollIndicator = false
			view.keyboardDismissMode = .onDrag
			addSubview(view)
			scrollview = view
			
			NSLayoutConstraint.activate([
				view.topAnchor.constraint(equalTo: topAnchor),
				view.bottomAnchor.constraint(equalTo: bottomAnchor),
				view.leadingAnchor.constraint(equalTo: leadingAnchor),
				view.trailingAnchor.constraint(equalTo: trailingAnchor),
			])
		}
		
		// MARK: STACK VIEW
		do {
			let view = UIStackView()
			view.translatesAutoresizingMaskIntoConstraints = false
			view.axis = .vertical
			view.alignment = .fill
			view.spacing = 10
			scrollview!.addSubview(view)
			stackview = view
			
			NSLayoutConstraint.activate([
				view.topAnchor.constraint(equalTo: scrollview!.contentLayoutGuide.topAnchor),
				view.bottomAnchor.constraint(equalTo: scrollview!.contentLayoutGuide.bottomAnchor),
				view.leadingAnchor.constraint(equalTo: scrollview!.contentLayoutGuide.leadingAnchor),
				view.trailingAnchor.constraint(equalTo: scrollview!.contentLayoutGuide.trailingAnchor),
				
				view.widthAnchor.constraint(equalTo: scrollview!.frameLayoutGuide.widthAnchor),
			])
		}
	}
}
