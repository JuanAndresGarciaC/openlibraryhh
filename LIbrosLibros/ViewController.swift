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
    
    @IBOutlet weak var titulo: UILabel!
    
    @IBOutlet weak var autores: UILabel!
    
    @IBOutlet weak var portada: UILabel!
   
    
    @IBAction func Buscar(_ sender: Any) {
    sincrono()
    }
    func sincrono() {
        var urls = "https://openlibrary.org/api/books?jscmd=data&format=json&bibkeys=ISBN:"+ISBN.text!
        print(urls)
        print(urls)
        
        let url = NSURL(string: urls)
        let datos:NSData? = NSData(contentsOf: url! as URL)
        do {
            var loco = ISBN.text!
            let json = try JSONSerialization.jsonObject(with: NSData(contentsOf: url! as URL)! as Data, options: JSONSerialization.ReadingOptions.mutableLeaves)
            let dico1 = json as! NSDictionary
            let dico2 = dico1["ISBN:\(loco)"] as! NSDictionary
            
            //let dico5 = dico2 ["authors"] as! NSDictionary
            self.titulo.text = dico2 ["title"] as! NSString as String
            let dico3 = dico2["authors"] as! NSArray
            print(dico3)
            //let trt = dico2["authors"] as! NSString as String
            
            //print(trt)
            self.autores.text = dico3[1] as! NSString as String
        }
        catch _ {
            
        }
        let texto = NSString(data:datos! as Data, encoding:String.Encoding.utf8.rawValue)
        print(texto)
        
        if urls == "https://openlibrary.org/api/books?jscmd=data&format=json&bibkeys=ISBN:"{
            
            titulo.text = "Porfavor escriba el ISBN"
        }
        
        
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

