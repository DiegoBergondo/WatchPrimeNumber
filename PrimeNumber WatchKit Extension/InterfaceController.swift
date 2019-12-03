//
//  InterfaceController.swift
//  WatchPrimeNumber WatchKit Extension
//
//  Created by Diego Bergondo Cañas on 03/12/2019.
//  Copyright © 2019 Diego Bergondo Cañas. All rights reserved.
//

import WatchKit
import Foundation

class InterfaceController: WKInterfaceController {
    
    @IBOutlet var numero: WKInterfaceTextField!
    @IBOutlet var respuesta: WKInterfaceTextField!
    @IBOutlet var divisiblePor: WKInterfaceTextField!
    var esDivisible:Int = 0
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        // Configure interface objects here.
    }
        
    @IBAction func nuevoNumero(_ value: NSString?) {
        if(value != nil){
            if let numeroAux = Int(value! as String) {
                switch esPrimo(n: numeroAux) {
                case true:
                    respuesta.setText("Es primo")
                    divisiblePor.setText("Div. por: 1 y \(numeroAux)")
                default:
                    respuesta.setText("No es primo")
                    divisiblePor.setText("Div. por: \(esDivisible)")
                }
            }
            else{
                numero.setText("Debe ser número")
            }
        }
    }
    
    func esPrimo(n: Int) -> Bool
    {
        if (n <= 1){
            return false;
        }
        for i in 2..<n{
            if (n % i == 0){
                self.esDivisible=i
                return false;
            }
        }
        return true
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
