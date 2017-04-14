//
//  ViewController.swift
//  SyntaxKitDemo
//
//  Created by zx on 4/14/17.
//  Copyright © 2017 zx. All rights reserved.
//

import UIKit
import SyntaxKit


class ViewController: UIViewController {
    var syntaxHighlighter:TRexSyntaxKitHighlighter?
    var attributedParser:AttributedParser!
    @IBOutlet weak var textView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        BundleManager.initializeDefaultManager { (name, type) -> (URL?) in
            let path = Bundle.main.url(forResource: name, withExtension: type == .Language ? "tmLanguage" : "tmTheme")
            return path
        }
        //Create Parser Tomorrow
        attributedParser = AttributedParser(language: BundleManager.defaultManager!.language(withIdentifier: "Swift")!, theme: BundleManager.defaultManager!.theme(withIdentifier: "Tomorrow")!)
        
        //Add Parser to TextStorage to live color while writing
        syntaxHighlighter = TRexSyntaxKitHighlighter(attributedParser: attributedParser, textView: textView)
        
        //Set some default string in the textview
        textView.text = "class TRexSyntaxKitDemo {\n var test : Int = 1\n}"
    }

}

