//
//  TRexSyntaxKitHighlighter.swift
//  TRexSyntaxKitDemo
//
//  Created by David Ehlen on 24.07.15.
//  Copyright © 2015 David Ehlen. All rights reserved.
//

import UIKit
import SyntaxKit

class TRexSyntaxKitHighlighter: NSObject, NSTextStorageDelegate {
    
    var attributedParser:AttributedParser?
    var textStorage : NSTextStorage!
    init(attributedParser:AttributedParser, textView: UITextView) {
        self.attributedParser = attributedParser
        
        super.init()
        self.textStorage = textView.textStorage
        self.textStorage.delegate = self
    }
    func textStorage(_ textStorage: NSTextStorage, didProcessEditing editedMask: NSTextStorageEditActions, range editedRange: NSRange, changeInLength delta: Int)  {
        let inputString = self.textStorage.string
        let wholeRange = NSMakeRange(0, inputString.characters.count)
        
        self.textStorage.removeAttribute(NSForegroundColorAttributeName, range:wholeRange)
        self.attributedParser!.parse(self.textStorage.string) { scope, range, attributes in
            if attributes != nil {
                self.textStorage.addAttributes(attributes!, range: range)
            }
        }
    }
}
