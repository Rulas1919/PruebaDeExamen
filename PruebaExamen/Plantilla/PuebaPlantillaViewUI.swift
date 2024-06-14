//
//  PuebaPlantillaViewUI.swift
//  PruebaExamen
//
//  Created Jose Raul Gastelum Ruiz on 13/06/24.
//  2024 ___ORGANIZATIONNAME___.
//

import Foundation
import UIKit

protocol PuebaPlantillaViewUIDelegate {
    
}

class PuebaPlantillaViewUI: UIView{
    var delegate: PuebaPlantillaViewUIDelegate?
    var navigationController: UINavigationController?
    
    public convenience init(
        navigation: UINavigationController,
        delegate: PuebaPlantillaViewUIDelegate){
        self.init()
        self.delegate = delegate
        self.navigationController = navigation
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }


}




