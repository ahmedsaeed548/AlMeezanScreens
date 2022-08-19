//
//  Protocols.swift
//  AlMeezanScreens
//
//  Created by Ahmad on 16/08/2022.
//

import Foundation
import UIKit

protocol storyBoardProtocol {
    static var storyboardName: String { get }
    static var storyboardBundle: Bundle { get }
    static var storyboardIdentifer: String { get }
    static func navigateToController() -> Self
}

extension storyBoardProtocol where Self: UIViewController {
    
    static var storyboardName: String {
        return "Main"
    }
    static var storyboardBundle: Bundle {
        return .main
    }
    
    static var storyboardIdentifer: String {
        return String(describing: self)
    }
    
   static func navigateToController() -> Self {
       guard let viewController = UIStoryboard(name: storyboardName , bundle: storyboardBundle).instantiateViewController(withIdentifier: storyboardIdentifer ) as? Self else { fatalError("\(storyboardIdentifer) not found in \(storyboardName)")}

       return viewController
    }
}
