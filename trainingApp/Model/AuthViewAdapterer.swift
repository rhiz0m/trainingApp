//
//  LoginViewAdapter.swift
//  trainingApp
//
//  Created by Andreas Antonsson on 2023-10-09.
//

import Foundation

protocol AuthViewAdapterer {
    var emailInput: String { get set }
    var passwordInput: String { get set }
    var emailPlaceHolder: String { get }
    var confirmEmailPlaceHolder: String { get }
    var passwordPlaceHolder: String { get }
    var confirmPasswordPlaceHolder: String { get }
    var loginButtonText: String { get }
    var registerButtonText: String { get }
    
}
