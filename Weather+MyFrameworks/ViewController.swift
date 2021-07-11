//
//  ViewController.swift
//  Weather+MyFrameworks
//
//  Created by Yauheni Kozich on 10.07.21.
//

import UIKit
import FrameworkDataWeather

class ViewController: UIViewController {
    @IBOutlet weak var myTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func myButton(_ sender: Any){
        guard let cyty = myTextField.text else { return }
        ApiManader.getApiDonload(myCity: cyty) { model in
            DispatchQueue.main.async {
                guard let yorCity = model.main?.temp else{return}
                self.myAlert(messege: "\(String(describing: yorCity)) C")
            }
        }
        
    }
    private func myAlert(messege: String) {
        let alertController = UIAlertController(title: "Your weather", message: messege, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertController.addAction(action)
        present(alertController, animated: true, completion: nil)
    }

}


