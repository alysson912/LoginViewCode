//
//  RegisterScreen.swift
//  LoginViewCode
//
//  Created by ALYSSON MENEZES on 17/05/22.
//

import UIKit

protocol RegisterScreenProtocol: class{
    func actionBackButton()
    func actionRegisterButton()
}

class RegisterScreen: UIView {
    
    weak private var delegate : RegisterScreenProtocol?
    
    func delegate( delegate: RegisterScreenProtocol?){
        self.delegate = delegate
    }
    
    lazy var backButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "backButtonIcon"), for: .normal)
        button.addTarget(self, action: #selector(tappedBackButton), for: .touchUpInside)
        return button
    }()
    
    lazy var imageAddUser: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage( named: "addUserIcon")
        image.contentMode = .scaleAspectFit
       
        return image
    }()
    
    lazy var emailTextField : UITextField = {
        let email = UITextField()
        email.translatesAutoresizingMaskIntoConstraints = false
        email.autocorrectionType = .no
        email.backgroundColor = .white
        email.borderStyle = .roundedRect
        email.keyboardType = .emailAddress
        email.placeholder = "digite seu e-mail:"
        email.font = UIFont.systemFont( ofSize: 14)
        email.textColor = .darkGray
        
        return email
    }()
    
    lazy var passwordTextField : UITextField = {
        let password = UITextField()
        password.translatesAutoresizingMaskIntoConstraints = false
        password.autocorrectionType = .no
        password.backgroundColor = .white
        password.borderStyle = .roundedRect
        //password.keyboardType = .default
        //password.isSecureTextEntry = true
        password.placeholder = "digite sua senha:"
        password.font = UIFont.systemFont( ofSize: 14)
        password.textColor = .darkGray
        
        return password
    }()
    
    lazy var registerButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("cadastrar", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 7.5
        button.backgroundColor = UIColor( red: 102/255, green: 103/255, blue: 171/255, alpha: 1.0)
        button.addTarget(self, action: #selector(tappedRegisterButton), for: .touchUpInside)
        
        return button
    }()
    
    
    override init( frame : CGRect){
        super.init(frame: frame)
        self.configBackGround()
        self.configSuperView()
        
        self.configBackButtonConstraint()
        self.configLogoAppImageViewConstraint()
        self.configEmailTextFieldConstraint()
        self.configPasswordTextFieldConstraint()
        self.configRegisterButtonConstraint()
        
        self.configButtonEnable(false )

    }
    
    private func configSuperView(){
        self.addSubview(self.backButton)
        self.addSubview(self.imageAddUser)
            addSubview(emailTextField)
            addSubview(passwordTextField)
            addSubview(registerButton)
        
    }
    
    private func configBackGround(){
        self.backgroundColor = .white
    }
    
    
   public func configTextFieldDelegate( delegate:UITextFieldDelegate ){
        self.emailTextField.delegate = delegate
        self.passwordTextField.delegate = delegate
    }
    
    @objc private func tappedBackButton(){
        self.delegate?.actionBackButton()
    }
    
    @objc private func tappedRegisterButton(){
        self.delegate?.actionRegisterButton()
    }
    
    public func validarTextFields(){
        let email: String = self.emailTextField.text ?? ""
        let password: String = self.passwordTextField.text ?? ""
        
        if !email.isEmpty && !password.isEmpty{
            self.configButtonEnable(true)
        }else{
            self.configButtonEnable(false)
        }
    }
    
    private func configButtonEnable(_ enable : Bool ){
        if enable{
            self.registerButton.setTitleColor(.white, for: .normal)
            self.registerButton.isEnabled = true
        }else {
            self.registerButton.setTitleColor(.lightGray, for: .normal)
            self.registerButton.isEnabled = false
        }
    }
    
    public func getEmail() -> String{
        return self.emailTextField.text ?? ""
    }
    
    public func getPassword() -> String{
        return self.passwordTextField.text ?? ""
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    /*
    private func setUpCronstraints(){
        NSLayoutConstraint.activate([
        
            backButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 5),
            backButton.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 20),
            backButton.widthAnchor.constraint(equalToConstant: 25),
            backButton.heightAnchor.constraint(equalToConstant: 25),
            
            imageAddUser.topAnchor.constraint(equalTo: self.backButton.bottomAnchor, constant: 100),
            imageAddUser.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            imageAddUser.widthAnchor.constraint(equalToConstant: 200),
            imageAddUser.heightAnchor.constraint(equalToConstant: 200),

            emailTextField.topAnchor.constraint(equalTo: self.imageAddUser.bottomAnchor, constant: 50),
            emailTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            emailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant:  -20),
            emailTextField.heightAnchor.constraint(equalToConstant: 45),
            
            passwordTextField.topAnchor.constraint(equalTo: self.emailTextField.bottomAnchor, constant: 15),
            passwordTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            passwordTextField.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
            
            registerButton.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor, constant: 15),
            registerButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            registerButton.leadingAnchor.constraint(equalTo: self.passwordTextField.leadingAnchor),
            registerButton.trailingAnchor.constraint(equalTo: self.passwordTextField.trailingAnchor),
            registerButton.heightAnchor.constraint(equalTo: self.passwordTextField.heightAnchor)
         
        ]) } */
    func configBackButtonConstraint(){
        self.backButton.snp.makeConstraints{( make ) in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(0)
           
            make.leading.equalToSuperview().offset(10)
            make.width.equalTo(40)
            make.height.equalTo(40)
        }
    }
    
    func configLogoAppImageViewConstraint(){
        self.imageAddUser.snp.makeConstraints { (make) in
            make.top.equalTo(self.backButton.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.leading.equalToSuperview().offset(60)
            make.trailing.equalToSuperview().inset(60)
            make.height.width.equalTo(150)
            
        }
    }
    
    func configEmailTextFieldConstraint() {
        self.emailTextField.snp.makeConstraints { (make) in
            make.top.equalTo(self.imageAddUser.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
            make.height.equalTo(45)
        }
    }
    func configPasswordTextFieldConstraint(){
        self.passwordTextField.snp.makeConstraints { (make) in
            make.top.equalTo(self.emailTextField.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
            make.leading.equalTo(self.emailTextField)
            make.trailing.equalTo(self.emailTextField)
            make.height.equalTo(emailTextField.snp.height)
            
        }
    }
    func configRegisterButtonConstraint(){
        self.registerButton.snp.makeConstraints{ (make) in
            make.top.equalTo(self.passwordTextField.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.leading.equalTo(self.passwordTextField)
            make.trailing.equalTo(self.passwordTextField)
            make.height.equalTo(passwordTextField.snp.height)
        }
    }

    
    
}
