//
//  PuebaPlantillaProtocols.swift
//  PruebaExamen
//
//  Created Jose Raul Gastelum Ruiz on 13/06/24.
//  2024 ___ORGANIZATIONNAME___.
//

import Foundation
protocol PuebaPlantillaViewProtocol: class {
    func formSavedSuccessfully()
}

protocol PuebaPlantillaInteractorProtocol: class {
    func saveDataUser(firstName: String, lastName: String, middleName: String, email: String, phone: String)
}

protocol PuebaPlantillaPresenterProtocol: class {
    func saveDataUser(firstName: String, lastName: String, middleName: String, email: String, phone: String)
    func formSavedSuccessfully()
}


protocol PuebaPlantillaRouterProtocol: class {
    
}
