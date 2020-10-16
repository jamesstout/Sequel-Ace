//
//  DragHandlingView.swift
//  Sequel Ace
//
//  Created by James on 15/10/2020.
//  Copyright © 2020 Sequel-Ace. All rights reserved.
//

import AppKit

@objc public protocol DragDelegate : class {
	func handleDrag(from view: DragHandlingView, dragInfo: NSDraggingInfo) -> Bool
	@objc optional func commitEditingAndReturnError(from view: DragHandlingView, dragInfo: NSDraggingInfo) -> Bool
	@objc optional func encodeWithCoder(with aCoder: NSCoder) -> Void
	
}

@objc public class DragHandlingView: NSView {
	@objc public weak var delegate: DragDelegate?

	public override func draggingEntered(_ sender: NSDraggingInfo) -> NSDragOperation {
		return .generic // this controls what the icon does ("copy", "move", "link", etc)
	}

	public override func performDragOperation(_ sender: NSDraggingInfo) -> Bool {
		return delegate?.handleDrag(from: self, dragInfo: sender) ?? false
	}
}
