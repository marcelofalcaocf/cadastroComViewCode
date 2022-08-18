//
//  RegisterScreen.swift
//  LoginViewCode-Curso
//
//  Created by Marcelo Falcao Costa Filho on 14/08/22.
//

import UIKit

protocol RegiterScreenProtocol: AnyObject {
    func actionBackButton()
    func actionRegisterButton()
}

class RegisterScreen: UIView {
    
    private weak var delegate: RegiterScreenProtocol?
    
    func delegate(delegate: RegiterScreenProtocol?) {
        self.delegate = delegate
    }

    lazy var imageAddUser: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "usuario")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "back"), for: .normal)
        button.addTarget(self, action: #selector(self.tappedBackButton), for: .touchUpInside)
        return button
    }()
    
    lazy var emailTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.backgroundColor = .white
        tf.borderStyle = .roundedRect
        tf.keyboardType = .emailAddress
        tf.placeholder = "Digite seu e-mail"
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.textColor = .darkGray
        return tf
    }()
    
    lazy var passwordTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.backgroundColor = .white
        tf.borderStyle = .roundedRect
        tf.keyboardType = .default
        tf.placeholder = "Digite sua senha"
        tf.isSecureTextEntry = true
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.textColor = .darkGray
        return tf
    }()
    
    lazy var registerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Cadastrar", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 7.5
        button.backgroundColor = UIColor(red: 3/255, green: 58/255, blue: 51/255, alpha: 1.0)
        button.addTarget(self, action: #selector(self.tappedRegisterButton), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configBackGround()
        self.configSuperView()
        // -----------------------
        self.configImageAddUserImageViewConstraint()
        self.configBackButtonContraint()
        self.configEmailTextFieldContraint()
        self.configPasswordTextFieldContraint()
        self.configRegisterButtonContraint()
        //------------------------
        // self.setUpContraints() // add o setUpContraints depois do configSuperView
        self.configButtonEnabel(false)
    }
    
    private func configSuperView() {
        self.addSubview(self.imageAddUser)
        self.addSubview(self.backButton)
        self.addSubview(emailTextField)
        self.addSubview(passwordTextField)
        self.addSubview(registerButton)
    }
    
    private func configBackGround() {
        self.backgroundColor = UIColor(red: 24/255, green: 117/255, blue: 104/255, alpha: 1.0)
    }
    
    public func configTextFieldDelegate(delegate: UITextFieldDelegate) {
        self.emailTextField.delegate = delegate
        self.passwordTextField.delegate = delegate
    }
    
    @objc private func tappedBackButton() {
        self.delegate?.actionBackButton()
    }
    
    @objc private func tappedRegisterButton() {
        self.delegate?.actionRegisterButton()
    }
    
    public func validaTextFields() {
        let email: String = self.emailTextField.text ?? "" // sao opcionais
        let password: String = self.passwordTextField.text ?? "" // sao opcionais
        
        if email != "" && password != "" { // poderia colocar "if !email.isEmpty && !password.isEmpty {}
            self.configButtonEnabel(true)
        } else {
            self.configButtonEnabel(false)
        }
    }
    
    private func configButtonEnabel(_ enabel: Bool) {
        if enabel {
            self.registerButton.setTitleColor(.white, for: .normal)
            self.registerButton.isEnabled = true // permitido apertar o botao "isEnabled"
        } else {
            self.registerButton.setTitleColor(.lightGray, for: .normal)
            self.registerButton.isEnabled = false // nao permitido apertar o botao
        }
    }
    
    public func getEmail() -> String {
        return self.emailTextField.text ?? ""
    }
    
    public func getPassword() -> String {
        return self.passwordTextField.text ?? ""
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    private func setUpContraints() {
//        NSLayoutConstraint.activate([
        
//            self.imageAddUser.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
//            self.imageAddUser.centerXAnchor.constraint(equalTo: self.centerXAnchor),
//            self.imageAddUser.widthAnchor.constraint(equalToConstant: 150),
//            self.imageAddUser.heightAnchor.constraint(equalToConstant: 150),
            
            
//            self.backButton.topAnchor.constraint(equalTo: self.imageAddUser.topAnchor),
//            self.backButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
//            self.backButton.widthAnchor.constraint(equalToConstant: 15),
//            self.backButton.heightAnchor.constraint(equalToConstant: 15),
            
            
//            self.emailTextField.topAnchor.constraint(equalTo: self.imageAddUser.bottomAnchor, constant: 30),
//            self.emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
//            self.emailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
//            self.emailTextField.heightAnchor.constraint(equalToConstant: 45), //opcional
            
            
//            self.passwordTextField.topAnchor.constraint(equalTo: self.emailTextField.bottomAnchor, constant: 15),
//            self.passwordTextField.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
//            self.passwordTextField.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
//            self.passwordTextField.heightAnchor.constraint(equalTo: self.emailTextField.heightAnchor), //opcional
            
            
//            self.registerButton.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor, constant: 20),
//            self.registerButton.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
//            self.registerButton.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
//            self.registerButton.heightAnchor.constraint(equalTo: self.emailTextField.heightAnchor) //opcional
//        ])
//    }
    
    func configImageAddUserImageViewConstraint() {
        self.imageAddUser.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(20)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(150) // Altura e largura setada
            // make.height.equalTo(150)
        }
    }
    
    func configBackButtonContraint() {
        self.backButton.snp.makeConstraints { make in
            make.top.equalTo(self.imageAddUser.snp.top)
            make.leading.equalToSuperview().offset(20)
            make.width.equalTo(15)
            make.height.equalTo(15)
        }
    }
    
    func configEmailTextFieldContraint() {
        self.emailTextField.snp.makeConstraints { make in
            make.top.equalTo(self.imageAddUser.snp.bottom).offset(30)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
            make.height.equalTo(45)
        }
    }
    
    func configPasswordTextFieldContraint() {
        self.passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(self.emailTextField.snp.bottom).offset(15)
            make.leading.equalTo(self.emailTextField.snp.leading)
            make.trailing.equalTo(self.emailTextField.snp.trailing)
            make.height.equalTo(self.emailTextField.snp.height)
        }
    }
    
    func configRegisterButtonContraint() {
        self.registerButton.snp.makeConstraints { make in
            make.top.equalTo(self.passwordTextField.snp.bottom).offset(20)
            make.leading.equalTo(self.emailTextField.snp.leading)
            make.trailing.equalTo(self.emailTextField.snp.trailing)
            make.height.equalTo(self.emailTextField.snp.height)
        }
    }
}
