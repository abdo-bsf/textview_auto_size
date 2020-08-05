//
//  ViewController.swift
//  TextView
//
//  Created by basafou on 8/5/20.
//  Copyright © 2020 basafou. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate {

    let textView: UITextView = {
        let textview = UITextView()
        textview.translatesAutoresizingMaskIntoConstraints = false
        textview.backgroundColor = .gray
        textview.isScrollEnabled = false
        textview.text = "place your comment here ..."
        textview.font = UIFont.preferredFont(forTextStyle: .headline)
        return textview
    }()
    
    func setup_text_view(){
        textView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        textView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        textView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        textView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        textView.delegate = self
    }
    
    func textViewDidChange(_ textView: UITextView) {
        let size = CGSize(width: view.frame.width, height: .infinity)
        let estimatesize = textView.sizeThatFits(size)
        textView.constraints.forEach{(constraint) in
            if constraint.firstAttribute == .height {
                if(estimatesize.height >= 60){
                    constraint.constant = estimatesize.height
                }
            }
        }
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.text = ""
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        print("oook man")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        view.addSubview(textView)
        setup_text_view()
        
    }


}

