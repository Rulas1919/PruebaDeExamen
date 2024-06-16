//
//  PuebaPlantillaPresenter.swift
//  PruebaExamen
//
//  Created Jose Raul Gastelum Ruiz on 13/06/24.
//  2024 ___ORGANIZATIONNAME___.
//

import Foundation
class PuebaPlantillaPresenter {
    var interactor: PuebaPlantillaInteractorProtocol?
    weak var view: PuebaPlantillaViewProtocol?
    var router: PuebaPlantillaRouterProtocol?
    
}



extension PuebaPlantillaPresenter: PuebaPlantillaPresenterProtocol {
    func saveDataUser(firstName: String, lastName: String, middleName: String, email: String, phone: String) {
        interactor?.saveDataUser(firstName: firstName, lastName: lastName, middleName: middleName, email: email, phone: phone)
    }
    
    
}
