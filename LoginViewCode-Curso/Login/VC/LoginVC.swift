//
//  ViewController.swift
//  LoginViewCode-Curso
//
//  Created by Marcelo Falcao Costa Filho on 12/08/22.
//

import UIKit

class LoginVC: UIViewController {
    
    var loginScreen: LoginScreen?
    
    override func loadView() { // Aqui é onde se diz que o que vai aparecer na view, vem da Screen
        self.loginScreen = LoginScreen()
        self.view = self.loginScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loginScreen?.delegate(delegate: self) // poderia ser self.loginScreen?.delegate = self, funciona da mesma forma
        self.loginScreen?.configTextFieldDelegate(delegate: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
}

extension LoginVC: loginScreenProtocol {
    func actionLoginButton() {
        print("Deu Certo Login Button!")
    }
    
    func actionRegisterButton() {
        print("Deu Certo Register Button!")
        let vc: RegisterVC = RegisterVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension LoginVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}

