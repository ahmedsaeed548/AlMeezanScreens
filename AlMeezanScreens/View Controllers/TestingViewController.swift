//
//  TestingViewController.swift
//  AlMeezanScreens
//
//  Created by Ahmad on 19/08/2022.
//

import UIKit

class TestingViewController: UIViewController {
    
    private let button: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.clipsToBounds = true
        btn.setTitle("Click me", for: .normal)
        btn.tintColor = .white
        btn.backgroundColor = UIColor.purple
        btn.layer.cornerRadius = 20
        btn.addTarget(self, action: #selector(isTapped), for: .touchUpInside)
        return btn
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray2
        view.addSubview(button)
        setup()
    }
    
    @objc func isTapped(sender: UIButton) {
        
        let vc = TransactionDetailsBottomSheetVC()
        let navVc = UINavigationController(rootViewController: vc)
        navVc.modalPresentationStyle = .pageSheet
        
        if let sheet = navVc.sheetPresentationController {
            sheet.detents = [.medium()]
            sheet.preferredCornerRadius = 20
        }
        present(navVc, animated: true)
    }
    
    func setup() {
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        button.heightAnchor.constraint(equalToConstant: 100).isActive = true
        button.widthAnchor.constraint(equalToConstant: 100).isActive = true
    }
}
