//
//  PuebaPlantillaView.swift
//  PruebaExamen
//
//  Created Jose Raul Gastelum Ruiz on 13/06/24.
//  2024 ___ORGANIZATIONNAME___.
//

import Foundation
import UIKit
class PuebaPlantillaView: UIViewController {
    var presenter: PuebaPlantillaPresenterProtocol?
    private var ui: PuebaPlantillaViewUI?
    
    
    override func loadView() {
        ui = PuebaPlantillaViewUI(
            navigation: self.navigationController!,
            delegate: self
        )
        view = ui
        
    }
    
}

extension PuebaPlantillaView: PuebaPlantillaViewProtocol {
    
}

extension PuebaPlantillaView: PuebaPlantillaViewUIDelegate {
  
  
}
