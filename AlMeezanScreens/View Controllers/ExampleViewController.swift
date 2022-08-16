//
//  ExampleViewController.swift
//  AlMeezanScreens
//
//  Created by Ahmad on 12/08/2022.
//

import UIKit

class ExampleViewController: UIViewController, UIScrollViewDelegate {
    
    private let views: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        // view.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
        view.layer.borderColor = UIColor.gray.cgColor
        view.layer.shadowOpacity = 0.3
        view.layer.shadowColor = UIColor.gray.cgColor
        view.layer.shadowRadius = 10
        view.layer.borderWidth = 0.1
        view.layer.cornerRadius = 20
        view.isUserInteractionEnabled = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let titleLbl: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "Title Label"
        label.textColor = UIColor.black
        label.font = UIFont(name: AppFontName.circularStdRegular, size: 18)
        label.clipsToBounds = true
        return label
    }()
    
    private let subLbl: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = UIColor.gray
        label.numberOfLines = 0
        label.textAlignment = .left
        label.text = "Label"
        label.font = UIFont(name: AppFontName.robotoRegular, size: 15)
        label.clipsToBounds = true
        return label
    }()
    
    private let image: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: IconName.fundImage)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let btnImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: IconName.chevron_down)?.transform(withNewColor: UIColor.btnGray)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(views)
        views.addSubview(titleLbl)
        views.addSubview(subLbl)
        views.addSubview(image)
        views.addSubview(btnImage)
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(isTapped))
        views.addGestureRecognizer(gesture)
        
        setupConstraints()
    }
    
    @objc func isTapped(_ sender: UITapGestureRecognizer) {
        print("im tapped!")
    }
    
    private func setupConstraints() {
        
        self.views.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        self.views.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        self.views.heightAnchor.constraint(equalToConstant: 150).isActive = true
        self.views.widthAnchor.constraint(equalToConstant: 320).isActive = true

        self.image.centerYAnchor.constraint(equalTo: self.views.centerYAnchor, constant: -15).isActive = true
        self.image.leadingAnchor.constraint(equalTo: self.views.leadingAnchor, constant: 15).isActive = true
        self.image.widthAnchor.constraint(equalToConstant: 30).isActive = true
        self.image.heightAnchor.constraint(equalToConstant: 30).isActive = true

        self.titleLbl.topAnchor.constraint(equalTo: image.topAnchor, constant: 0).isActive = true
        self.titleLbl.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 15).isActive = true

        self.subLbl.topAnchor.constraint(equalTo: titleLbl.bottomAnchor, constant: 2).isActive = true
        self.subLbl.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 15).isActive = true
        self.subLbl.trailingAnchor.constraint(equalTo: btnImage.leadingAnchor, constant: -15).isActive = true

        btnImage.topAnchor.constraint(equalTo: views.topAnchor, constant: 55).isActive = true
        btnImage.rightAnchor.constraint(equalTo: views.rightAnchor, constant: -10).isActive = true
        btnImage.heightAnchor.constraint(equalToConstant: 10).isActive = true
        
    }
    
}
