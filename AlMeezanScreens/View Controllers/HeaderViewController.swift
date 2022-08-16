//
//  HeaderViewController.swift
//  AlMeezanScreens
//
//  Created by Ahmad on 28/07/2022.
//

import UIKit

class HeaderViewController: UIViewController {
                                   
    private (set) lazy var headerView: HeaderView = { [unowned self] in
            let view = HeaderView.init(titleLbl: Headings.fundTransfer, closeAction: {
                self.navigationController?.popViewController(animated: true)
            }, nextAction: {
                print("next")
            }, previousAction: {
                self.navigationController?.popViewController(animated: true)
            })
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
    
    private var innerView: View = {
        let view = View.init(titleLabl: "Name", subLabel: "Mohammad Ahmed", imageName: "nameImage")
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    private var secondView: View = {
        let view = View.init(titleLabl: Title.name, subLabel: "Mohammad Ahmed", imageName: IconName.bankImage)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(headerView)
      
        setupView()
    }
    
    func setupView() {
        
        headerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        headerView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }

}
