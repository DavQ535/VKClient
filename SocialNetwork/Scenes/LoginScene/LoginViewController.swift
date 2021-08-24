//
//  ViewController.swift
//  SocialNetwork
//
//  Created by David Varro on 17/07/2021.
//

import UIKit

class LoginViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak private var scrollView: UIScrollView!
    @IBOutlet weak private var loginTextField: UITextField!
    @IBOutlet weak private var passwordTextField: UITextField!
    @IBOutlet weak private var loginButtonOutlet: UIButton!
    @IBOutlet weak private var loginLabelOutlet: UILabel!
    @IBOutlet weak private var passwordLabelOutlet: UILabel!
    @IBOutlet weak private var loading1: UIView!
    @IBOutlet weak private var loading2: UIView!
    @IBOutlet weak private var loading3: UIView!
    // MARK: - LifeCycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        navigationController?.navigationBar.isHidden = true
       animateOpacity(for: loginTextField)
        animateOpacity(for: passwordTextField)
        transformAnimation(for: loginButtonOutlet)
        animateTitlesAppearing(for: passwordLabelOutlet, and: loginLabelOutlet)

        let cornerRadius = loading1.frame.size.height / 2

        [loading1, loading2, loading3].forEach {
            $0?.layer.cornerRadius = cornerRadius
            $0?.alpha = 0
        }
    }
    // MARK: - Methods
    @IBAction func logOut(with segue: UIStoryboardSegue) {
    }
     @objc private func keyboardWasShown(notification: Notification) {
        let info = notification.userInfo! as NSDictionary
        let keyboardSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as? NSValue)?.cgRectValue
        let contentOffset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize?.height ?? view.frame.height, right: 0)
        scrollView.contentInset = contentOffset
        scrollView.scrollIndicatorInsets = contentOffset
        scrollView.scrollRectToVisible(loginButtonOutlet.frame, animated: true)
    }
    @objc private func keyboardWillHide(notification: Notification) {
        scrollView.contentInset = .zero
    }
    private func checkAuth() -> Bool {
        return (loginTextField.text ?? "").isEmpty && (passwordTextField.text ?? "").isEmpty
    }
   private func loginErrorAlert() {
        let alertMessage = UIAlertController(title: "Something went wrong", message: "Please enter correct detalis ", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertMessage.addAction(alertAction)
        self.present(alertMessage, animated: true, completion: nil)
    }
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "MainScreen" && checkAuth() {
            return true
        } else {
            loginErrorAlert()
            return false
        }
    }
    @IBAction private func loginButtonPressed(_ sender: Any) {
        UIView.animate(withDuration: 0.3) {
            self.loading1.alpha = 1.0
        } completion: { _ in
            UIView.animate(withDuration: 0.3, animations: {
                self.loading1.alpha = 0
                self.loading2.alpha = 1
            }, completion: { _ in
                UIView.animate(withDuration: 0.3, animations: {
                    self.loading2.alpha = 0
                    self.loading3.alpha = 1
                }) { _ in
                    UIView.animate(withDuration: 0.5) {
                        self.loading3.alpha = 0
                    }
                }
            })
        }
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
            self.performSegue(withIdentifier: "MainScreen", sender: nil)
        }
    }
}
