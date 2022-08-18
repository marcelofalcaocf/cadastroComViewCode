//
//  LoginScreen.swift
//  LoginViewCode-Curso
//
//  Created by Marcelo Falcao Costa Filho on 12/08/22.
//

import UIKit

protocol loginScreenProtocol: AnyObject {
    func actionLoginButton()
    func actionRegisterButton()
}

class LoginScreen: UIView {

    private weak var delegate: loginScreenProtocol?
    
    func delegate(delegate: loginScreenProtocol?) {
        self.delegate = delegate
    }
    
    lazy var loginLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false // seta as constraints de maneira automatica, e nao queremos isso
        label.textColor = .white // cor da fonte da escrita
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.text = "Login"
        return label
    }()
    
    lazy var logoAppImageView: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image =  UIImage(named: "logo")
        image.tintColor = .green
        image.contentMode = .scaleAspectFit
       // image.backgroundColor = .blue
        return image
    }()
    
    lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.autocorrectionType = .no // para correção automatica do teclado, nesse caso desativado
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        textField.keyboardType = .emailAddress // estilo do teclado para quem vai escrever email
        textField.placeholder = "Digite seu Email:"
        textField.textColor = .darkGray
        return textField
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.autocorrectionType = .no // para correção automatica do teclado, nesse caso desativado
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        textField.keyboardType = .default // estilo do teclado para quem vai escrever
        textField.isSecureTextEntry = true // nao conseguimos ver os caracteres escritos
        textField.placeholder = "Digite sua senha:"
        textField.textColor = .darkGray
        return textField
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Logar", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18) // tamanho da fonte
        button.setTitleColor(.white, for: .normal) // cor para o texto
        button.clipsToBounds = true // para conseguir deixar o botao redondo ou  um pouco mais redondo
        button.layer.cornerRadius = 7.5 // arredondamos as bordas
        button.backgroundColor = UIColor(red: 3/255, green: 58/255, blue: 51/255, alpha: 1.0) // pintamos o background
        button.addTarget(self, action: #selector(self.tappedLoginButton), for: .touchUpInside)
        return button
    }()
    
    lazy var registerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Não tem conta? Cadastre-se", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18) // tamanho da fonte
        button.setTitleColor(.white, for: .normal) // cor para o texto
        button.addTarget(self, action: #selector(self.tappedRegisterButton), for: .touchUpInside)
        return button
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configBackGround()
        self.configSuperView()
        
        //-----------------------
        self.configLoginLabelContraint()
        self.configLogoAppImageViewContraint()
        self.configEmailTextFieldConstraint()
        self.configPasswordTextFieldContraint()
        self.configLoginButtonConstraint()
        self.configRegisterButtonConstraint()
        //-----------------------
        // self.setUpContraints()
        self.configButtonEnabel(false)
    }
    
    private func configBackGround() {
        self.backgroundColor = UIColor(red: 24/255, green: 117/255, blue: 104/255, alpha: 1.0)
    }
    
    private func configSuperView() {
        self.addSubview(self.loginLabel)
        self.addSubview(self.logoAppImageView)
        self.addSubview(self.emailTextField)
        self.addSubview(self.passwordTextField)
        self.addSubview(self.loginButton)
        self.addSubview(self.registerButton)
    }
    
    public func configTextFieldDelegate(delegate: UITextFieldDelegate) {
        self.emailTextField.delegate = delegate
        self.passwordTextField.delegate = delegate
    }
    
    @objc private func tappedLoginButton() {
        self.delegate?.actionLoginButton()
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
            self.loginButton.setTitleColor(.white, for: .normal)
            self.loginButton.isEnabled = true // permitido apertar o botao "isEnabled"
        } else {
            self.loginButton.setTitleColor(.lightGray, for: .normal)
            self.loginButton.isEnabled = false // nao permitido apertar o botao
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
    
    //equalTo: Basear em um determinado elemento
    //constant: me afasta/aproxima do elemento referente(equalTo)
    //equalToConstant: setando um valor fixo para um determinado elemento
    
//    private func setUpContraints() {
//        NSLayoutConstraint.activate([
//
//            self.loginLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
//            self.loginLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            
//            self.logoAppImageView.topAnchor.constraint(equalTo: self.loginLabel.bottomAnchor, constant: 20),
//            self.logoAppImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 60),
//            self.logoAppImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -60),
//            self.logoAppImageView.heightAnchor.constraint(equalToConstant: 200),
            
            
//            self.emailTextField.topAnchor.constraint(equalTo: self.logoAppImageView.bottomAnchor, constant: 20),
//            self.emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 20),
//            self.emailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
//            self.emailTextField.heightAnchor.constraint(equalToConstant: 45),
            
            
//            self.passwordTextField.topAnchor.constraint(equalTo: self.emailTextField.bottomAnchor, constant: 15),
//            self.passwordTextField.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
//            self.passwordTextField.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
//            self.passwordTextField.heightAnchor.constraint(equalTo: self.emailTextField.heightAnchor),
            
            
//            self.loginButton.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor, constant: 20),
//            self.loginButton.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
//            self.loginButton.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
//            self.loginButton.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
            
            
//            self.registerButton.topAnchor.constraint(equalTo: self.loginButton.bottomAnchor, constant: 30),
//            self.registerButton.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
//            self.registerButton.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
//            self.registerButton.heightAnchor.constraint(equalTo: emailTextField.heightAnchor)
            
            
//        ])
//    }
    
    // offset = utilizamos quando o valor é positivo
    // inset = utilizamos quando o valor é negativo

    func configLoginLabelContraint() {
        self.loginLabel.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(20)
            make.centerX.equalToSuperview()
        }
    }
    
    func configLogoAppImageViewContraint() {
        self.logoAppImageView.snp.makeConstraints { make in
            make.top.equalTo(self.loginLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(60)
            make.trailing.equalToSuperview().inset(60)
            make.height.equalTo(200)
        }
    }
    
    func configEmailTextFieldConstraint() {
        self.emailTextField.snp.makeConstraints { make in
            make.top.equalTo(self.logoAppImageView.snp.bottom).offset(20)
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
    
    func configLoginButtonConstraint() {
        self.loginButton.snp.makeConstraints { make in
            make.top.equalTo(self.passwordTextField.snp.bottom).offset(20)
            make.leading.equalTo(self.emailTextField.snp.leading)
            make.trailing.equalTo(self.emailTextField.snp.trailing)
            make.height.equalTo(self.emailTextField.snp.height)
        }
    }
    
    func configRegisterButtonConstraint() {
        self.registerButton.snp.makeConstraints { make in
            make.top.equalTo(self.loginButton.snp.bottom).offset(30)
            make.leading.equalTo(self.emailTextField.snp.leading)
            make.trailing.equalTo(self.emailTextField.snp.trailing)
            make.height.equalTo(self.emailTextField.snp.height)
        }
    }
}
