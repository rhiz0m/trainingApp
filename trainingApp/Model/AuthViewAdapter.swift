//
//  LoginViewAdapterer.swift
//  trainingApp
//
//  Created by Andreas Antonsson on 2023-10-09.
//

import Foundation

struct AuthViewAdapter: AuthViewAdapterer {
    var emailInput = ""
    var passwordInput = ""
    var emailPlaceHolder = "Email"
    var confirmEmailPlaceHolder = "Confirm email"
    var passwordPlaceHolder = "Password"
    var confirmPasswordPlaceHolder = "Confirm Password"
    var loginButtonText = "Login"
    var registerButtonText = "Sign Up"
    
}
