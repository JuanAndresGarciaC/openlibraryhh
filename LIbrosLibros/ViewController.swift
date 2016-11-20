//
//  ViewController.swift
//  LIbrosLibros
//
//  Created by Juan Andres Garcia C on 19/11/16.
//  Copyright © 2016 Juan Andres Garcia C. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ISBN: UITextField!
    
    @IBAction func Clear(_ sender: Any) {
        ISBN.text = ""
    }
    
    @IBOutlet weak var Resultado: UITextView!
    
    @IBAction func Buscar(_ sender: Any) {
    sincrono()
    }
    func sincrono() {
        var urls = "https://openlibrary.org/api/books?jscmd=data&format=json&bibkeys=ISBN"+ISBN.text!
        print(urls)
        print(urls)
        Resultado.text = urls
        if urls == "https://openlibrary.org/api/books?jscmd=data&format=json&bibkeys=ISBN:"{
            
            Resultado.text = "Porfavor escriba el ISBN"
        }
        
            let url = NSURL(string: urls)
            let datos:NSData? = NSData(contentsOf: url! as URL)
            let texto = NSString(data:datos! as Data, encoding:String.Encoding.utf8.rawValue)
            print(texto)
            Resultado.text = texto as String!
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

