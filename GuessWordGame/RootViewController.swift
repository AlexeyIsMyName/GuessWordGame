//
//  RootViewController.swift
//  GuessWordGame
//
//  Created by ALEKSEY SUSLOV on 22.11.2022.
//

import UIKit

final class RootViewController: UIViewController {
    
    private lazy var buttonsView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var letterButtons: [UIButton] = {
        return (0..<26).map { _ in UIButton(type: .system) }
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewDidLayoutSubviews() {
        drawLetterButtons()
    }
    
    private func setupView() {
        title = "Guess Word Game"
        view.addSubview(buttonsView)
        
        letterButtons.forEach { buttonsView.addSubview($0) }
        
        NSLayoutConstraint.activate([
            buttonsView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.centerYAnchor, constant: 0),
            buttonsView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 0),
            buttonsView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: 0),
            buttonsView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: 0)
        ])
    }
    
    private func drawLetterButtons() {
        let letters = (65...90).map { String(UnicodeScalar($0)) }
        
        // set some values for the width and height of each button
        let width = Int(buttonsView.frame.width / 5)
        let height = Int(buttonsView.frame.height / 6)
        
        // create 26 buttons as a 5x5 grid
        var index = 0
        for row in 0..<6 {
            for col in 0..<5 {
                let letterButton = letterButtons[index]
                let letter = letters[index]
                letterButton.setTitle(letter, for: .normal)
                letterButton.addTarget(self, action: #selector(letterTapped), for: .touchUpInside)
                
                // calculate the frame of this button using its column and row
                var frame: CGRect
                if index == 0 {
                    frame = CGRect(x: 0, y: 0, width: width, height: height)
                } else {
                    frame = CGRect(x: col * width, y: row * height, width: width, height: height)
                }
                
                letterButton.frame = frame
                letterButton.layer.borderWidth = 0.3
                letterButton.layer.borderColor = UIColor.gray.cgColor
                
                if index == 0 {
                    index += 1
                    break
                }
                
                index += 1
            }
        }
    }
    
    @objc func letterTapped(_ sender: UIButton) {
//        guard let buttonTitle = sender.titleLabel?.text else { return }
//        currentAnswer.text = currentAnswer.text?.appending(buttonTitle)
//        activatedButtons.append(sender)
//        sender.isHidden = true
    }
}

