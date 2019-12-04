//
//  InterfaceController.swift
//  PrimeNumber WatchKit Extension
//
//  Created by Diego Bergondo Cañas on 03/12/2019.
//  Copyright © 2019 Diego Bergondo Cañas. All rights reserved.
//

import WatchKit
import Foundation

class InterfaceController: WKInterfaceController {
    
    // Declaración de los tres cuadros de texto de la pantalla
    @IBOutlet var numero: WKInterfaceTextField!
    @IBOutlet var respuesta: WKInterfaceTextField!
    @IBOutlet var divisiblePor: WKInterfaceTextField!
    // Variable creada para contener el número por el que es divisible el objetivo.
    var esDivisible:Int = 0
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        // Configure interface objects here.
    }
       
    // Función asociada al texto que recibe el número objetivo, es llamada al confirmar
    // el texto ingresado por parte del usuario.
    @IBAction func nuevoNumero(_ value: NSString?) {
        // Si el usuario cancela el ingreso de texto, se devuelve nil, por lo que es
        // necesario controlarlo
        if(value != nil){
            // Se verifica que el texto ingresado sea un número
            if let numeroAux = Int(value! as String) {
                // Llamada a la función que determina si es primo y que, al devolver un
                // boolean, sólo puede tener dos posibilidades
                switch esPrimo(n: numeroAux) {
                // Si es primo se muestra esa respuesta en el segundo recuadro de texto
                // y se indica en el tercer recuadro que sólo es divisible por 1 y por él
                // mismo
                case true:
                    respuesta.setText("Es primo")
                    divisiblePor.setText("Div. por: 1 y \(numeroAux)")
                // De lo contrario, se indica que no es primo y el número por el que es
                // divisible mostrando la variable que se ha modificado a tal efecto
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
    
    // Función que determina si un número es primo utilizando el algoritmo más común.
    func esPrimo(n: Int) -> Bool
    {
        if (n <= 1){
            return false;
        }
        for i in 2..<n{
            // En caso de encontrar divisibilidad, se devolverá false (no primo), y, además,
            // se asociará el divisor con la variable antes definida para contener el
            // número por el que es divisible el objetivo
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
