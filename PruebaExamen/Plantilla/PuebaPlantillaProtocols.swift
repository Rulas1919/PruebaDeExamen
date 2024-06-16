//
//  PuebaPlantillaProtocols.swift
//  PruebaExamen
//
//  Created Jose Raul Gastelum Ruiz on 13/06/24.
//  2024 ___ORGANIZATIONNAME___.
//

import Foundation
protocol PuebaPlantillaViewProtocol: class {
    
}

protocol PuebaPlantillaInteractorProtocol: class {
    func saveDataUser(firstName: String, lastName: String, middleName: String, email: String, phone: String)
}

protocol PuebaPlantillaPresenterProtocol: class {
    func saveDataUser(firstName: String, lastName: String, middleName: String, email: String, phone: String)
}

protocol PuebaPlantillaRouterProtocol: class {
    
}
