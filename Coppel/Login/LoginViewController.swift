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
        let user = user.text!
        let password = password.text!
        
        presenter?.login(user: user, password: password)
    }
}

extension LoginViewController: LoginView {
    func upDate(data: Login) {
        print(data)

        DispatchQueue.main.async {
            self.text.text = data.status_message

            if !data.success {
                self.presenter?.prepareForRouter()
            }
        }
    }
}
