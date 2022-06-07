//
//  ViewController.swift
//  LoginViewCode
//
//  Created by ALYSSON MENEZES on 14/05/22.
//

import UIKit
import FirebaseAuth

class LoginVC: UIViewController {

    var loginScreen: LoginScreen?
    var auth  : Auth?
    var alert : Alert?
    
    
    override func loadView() {
        self.loginScreen = LoginScreen()
        self.view = self.loginScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loginScreen?.delegate( delegate:  self)
        self.loginScreen?.configTextFieldDelegate(delegate: self)
        self.auth = Auth.auth()
        self.alert = Alert(controller: self )
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    

}
extension LoginVC: LoginScreenProtocol{
    func actionLoginButton() {
        
        let homeVC = HomeVC()
        self.navigationController?.pushViewController(homeVC, animated: true )
        
//        guard let login = self.loginScreen else { return }
//
//        self.auth?.signIn(withEmail: login.getEmail(), password: login.getPassword(), completion: { usuario, error in
//
//            if error != nil{
//                self.alert?.getAlert(titulo: "Atenção", mensagem: "Login ou senha inválido !")
//
//            }else {
//                if usuario == nil  {
//                    self.alert?.getAlert(titulo: "Atenção", mensagem: "Usuário inválido")
//                }else {
//                    self.alert?.getAlert(titulo: "Atenção", mensagem: "Login efetuado com Sucesso!")
//                }
//            }
//        })
        
    }
    
    func actionRegisterButton() {
        let vc = RegisterVC()
        self.navigationController?.pushViewController(vc, animated: true )
        
    }
}

// return keyboard
extension LoginVC: UITextFieldDelegate{
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
     
        
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        self.loginScreen?.validarTextFields()
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //print( "textFieldShouldReturn")
        textField.resignFirstResponder()
        
        return true
    }
}
