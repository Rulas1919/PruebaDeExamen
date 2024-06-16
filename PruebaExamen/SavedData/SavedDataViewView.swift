//
//  SavedDataViewView.swift
//  PruebaExamen
//
//  Created Jose Raul Gastelum Ruiz on 16/06/24.
//  2024 ___ORGANIZATIONNAME___.
//

import Foundation
import UIKit
class SavedDataViewView: UIViewController {
    var presenter: SavedDataViewPresenterProtocol?
    private var ui: SavedDataViewViewUI?
    
    
    override func loadView() {
        ui = SavedDataViewViewUI(
            navigation: self.navigationController!,
            delegate: self
        )
        view = ui
    }
    
}

extension SavedDataViewView: SavedDataViewViewProtocol {
    
}

extension SavedDataViewView: SavedDataViewViewUIDelegate {
    
}
