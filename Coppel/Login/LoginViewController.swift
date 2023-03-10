//
//  LoginViewController.swift
//  Coppel
//
//  Created by JG on 07/03/23.
//

import UIKit

// MARK: LoginView Protocol
protocol LoginView: AnyObject {
    func upDate(data: Login)
    func error(str: String)
}

// MARK: LoginViewController View
class LoginViewController: UIViewController {
    
    var presenter: LoginPresenter?
    
    @IBOutlet weak var user: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var text: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dissmissKeyboard))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    @objc func dissmissKeyboard()  {
        self.view.endEditing(true)
    }
    
    @IBAction func login(_ sender: Any) {
        view.isUserInteractionEnabled = false
        view.endEditing(true)
        Overlay.shared.showOverlayBasic(self.view, "Validando...")
        let user = user.text!
        let password = password.text!
        presenter?.login(user: user, password: password)
    }
}

// MARK: LoginViewController Protocol
extension LoginViewController: LoginView {
    
    func error(str: String) {
        DispatchQueue.main.async {
            self.view.isUserInteractionEnabled = true
            self.text.text = str
            Overlay.shared.hideOverlay()
        }
    }
    
    func upDate(data: Login) {
        DispatchQueue.main.async {
            self.view.isUserInteractionEnabled = true
            Overlay.shared.hideOverlay()
            self.text.text = data.status_message
            if !data.success {
                self.presenter?.prepareForRouter()
            }
        }
    }
}
