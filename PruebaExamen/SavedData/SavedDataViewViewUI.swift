//
//  SavedDataViewViewUI.swift
//  PruebaExamen
//
//  Created Jose Raul Gastelum Ruiz on 16/06/24.
//  2024 ___ORGANIZATIONNAME___.
//

import Foundation
import UIKit

protocol SavedDataViewViewUIDelegate {
    
}

class SavedDataViewViewUI: UIView{
    var delegate: SavedDataViewViewUIDelegate?
    var navigationController: UINavigationController?
    
    public convenience init(
        navigation: UINavigationController,
        delegate: SavedDataViewViewUIDelegate){
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




