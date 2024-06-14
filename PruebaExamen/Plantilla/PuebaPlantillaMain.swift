//
//  PuebaPlantillaMain.swift
//  PruebaExamen
//
//  Created Jose Raul Gastelum Ruiz on 13/06/24.
//  2024 ___ORGANIZATIONNAME___.
//

import Foundation
import UIKit

open class PuebaPlantillaMain{
    public static func createModule(navigation: UINavigationController) -> UIViewController {
        let viewController: PuebaPlantillaView? = PuebaPlantillaView()
        if let view = viewController {
            let presenter = PuebaPlantillaPresenter()
            let router = PuebaPlantillaRouter()
            let interactor = PuebaPlantillaInteractor()
            
            
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
