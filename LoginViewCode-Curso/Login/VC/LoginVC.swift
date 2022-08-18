//
//  ViewController.swift
//  LoginViewCode-Curso
//
//  Created by Marcelo Falcao Costa Filho on 12/08/22.
//

import UIKit
import FirebaseAuth

class LoginVC: UIViewController {
    
    var loginScreen: LoginScreen?
    var auth: Auth?
    var alert:Alert?
    
    override func loadView() { // Aqui é onde se diz que o que vai aparecer na view, vem da Screen
        self.loginScreen = LoginScreen()
        self.view = self.loginScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loginScreen?.delegate(delegate: self) // poderia ser self.loginScreen?.delegate = self, funciona da mesma forma
        self.loginScreen?.configTextFieldDelegate(delegate: self)
        self.auth = Auth.auth()
        self.alert = Alert(controller: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
}

extension LoginVC: loginScreenProtocol {
    
    func actionLoginButton() {
        
        let vc: HomeVC = HomeVC()
        self.navigationController?.pushViewController(vc, animated: true)
        
// ---- Parte Comentada para poder andamento no projeto, quando tiver pronto, habilitar novamente
//        guard let login = self.loginScreen else { return }
//
//        self.auth?.signIn(withEmail: login.getEmail(), password: login.getPassword(), completion: { usuario, error in
//            if error != nil {
//                self.alert?.getAlert(titulo: "Atenção", mensagem: "Atenção dados incorretos, verifique e tente novamente")
//            }else {
//                if usuario == nil {
//                    self.alert?.getAlert(titulo: "Atenção", mensagem: "Tivemos um problema inesperado, tente novamente mais tarde")
//                } else {
//                    self.alert?.getAlert(titulo: "Atenção", mensagem: "Parabens, usuario logado com sucesso!")
//                }
//            }
//        })
        
    }
    
    func actionRegisterButton() {
        let vc: RegisterVC = RegisterVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension LoginVC: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.loginScreen?.validaTextFields()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}

