//
//  LoginViewController.swift
//  Coppel
//
//  Created by JG on 07/03/23.
//

import UIKit

protocol LoginView: AnyObject {
    func upDate(data: Login)
}

class LoginViewController: UIViewController {
    
    var presenter: LoginPresenter?
    
    @IBOutlet weak var user: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var text: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func login(_ sender: Any) {
        view.endEditing(true)
        Overlay.shared.showOverlayBasic(self.view, "Validando...")
        self.presenter?.prepareForRouter()
//        let user = user.text!
//        let password = password.text!
//        
//        presenter?.login(user: user, password: password)
    }
}

extension LoginViewController: LoginView {
    func upDate(data: Login) {
        DispatchQueue.main.async {
            Overlay.shared.hideOverlay()
            self.text.text = data.status_message

            if !data.success {
                self.presenter?.prepareForRouter()
            }
        }
    }
}
