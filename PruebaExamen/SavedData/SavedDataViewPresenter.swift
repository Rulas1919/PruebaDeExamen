//
//  SavedDataViewPresenter.swift
//  PruebaExamen
//
//  Created Jose Raul Gastelum Ruiz on 16/06/24.
//  2024 ___ORGANIZATIONNAME___.
//

import Foundation
class SavedDataViewPresenter {
    var interactor: SavedDataViewInteractorProtocol?
    weak var view: SavedDataViewViewProtocol?
    var router: SavedDataViewRouterProtocol?
    
}



extension SavedDataViewPresenter: SavedDataViewPresenterProtocol {
    
}
