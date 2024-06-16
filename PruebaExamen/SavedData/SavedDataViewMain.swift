//
//  SavedDataViewMain.swift
//  PruebaExamen
//
//  Created Jose Raul Gastelum Ruiz on 16/06/24.
//  2024 ___ORGANIZATIONNAME___.
//

import Foundation
import UIKit

open class SavedDataViewMain{
    public static func createModule(navigation: UINavigationController) -> UIViewController {
        let viewController: SavedDataViewView? = SavedDataViewView()
        if let view = viewController {
            let presenter = SavedDataViewPresenter()
            let router = SavedDataViewRouter()
            let interactor = SavedDataViewInteractor()
            
            
             view.presenter = presenter
             
             presenter.view = view
             presenter.interactor = interactor
             presenter.router = router
             
             router.navigation = navigation
             
             interactor.presenter = presenter
            return view
        }
        return UIViewController()
    }
    
    
}
