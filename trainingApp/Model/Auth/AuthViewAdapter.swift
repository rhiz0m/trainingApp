//
//  LoginViewAdapterer.swift
//  trainingApp
//
//  Created by Andreas Antonsson on 2023-10-09.
//

import Foundation

class AuthViewAdapter: ObservableObject, AuthViewAdapterer {
    @Published var emailInput = ""
    @Published var confirmEmailInput = ""
    @Published var passwordInput = ""
    @Published var confirmPasswordInput = ""
    var emailPlaceHolder = "Email"
    var confirmEmailPlaceHolder = "Confirm email"
    var passwordPlaceHolder = "Password"
    var confirmPasswordPlaceHolder = "Confirm Password"
    var loginButtonText = "Login"
    var registerButtonText = "Sign Up"
    
    init() {
        emailInput = ""
        confirmEmailInput = ""
        passwordInput = ""
        confirmPasswordInput = ""
    }
    
}
