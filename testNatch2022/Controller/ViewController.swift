//
//  ViewController.swift
//  testNatch2022
//
//  Created by Luan Road on 22/04/22.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var exampleTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        exampleTable.delegate = self
        exampleTable.dataSource = self
        exampleTable.register(UINib(nibName: "FirstViewCell", bundle: nil), forCellReuseIdentifier: "firstCell")
        exampleTable.register(UINib(nibName: "SecondViewCell", bundle: nil), forCellReuseIdentifier: "secondCell")
        exampleTable.register(UINib(nibName: "ThirdViewCell", bundle: nil), forCellReuseIdentifier: "thirdCell")
    }
    
    /// this method prepare to which viewcontroller do you want to go through the segue identifier
    /// - Parameters:
    ///   - segue: segue defined
    ///   - sender: object lunched by the event
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "chartSegue" {
            if let destino = segue.destination as? ChartViewController {
            }
        }
    }
}

// MARK: extension defined
extension ViewController: UITableViewDataSource {

    /// this method define the number of sections in the table vew
    /// - Parameter tableView: tableview
    /// - Returns: return the number of sections in the tableview
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    /// this method define the number of rows for sections
    /// - Parameters:
    ///   - tableView: tableview
    ///   - section: section number
    /// - Returns: return the numbers of row for seccion in the tableview
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    /// this method get the number of row that was typed.
    /// - Parameters:
    ///   - tableView: tableview from the storyboard
    ///   - indexPath: indexpath number selected
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 1 {
            let alert = UIAlertController(title: "¡Sonrie!", message: "¿estas seguro de guardar la foto?", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Si", style: .default, handler: { action in
                let store = Storage.storage()
                let ref = store.reference()
                
                //se obtendria la imagen local o se obtendria la imagen de la camara,
                let localFile = URL(string: "path/to/image")!
                let indexPath = IndexPath(row: 0, section: 0)
                let cell = tableView.cellForRow(at: indexPath) as! FirstViewCell
                //se obtiene el nombre de la primera fila
                let nombre = cell.textFieldNombre.text!
                
                let perfilRef = ref.child("images/\(nombre).png")
                perfilRef.name
                let uploadTask = perfilRef.putFile(from: localFile, metadata: nil) { metadata, error in
                  guard let metadata = metadata else {
                    return
                  }
                  let size = metadata.size
                    perfilRef.downloadURL { (url, error) in
                    guard let downloadURL = url else {
                      return
                    }
                  }
                }
            }))
            
            alert.addAction(UIAlertAction(title: "No", style: .cancel))
            self.present(alert, animated: true, completion: nil)
        }
        
        if indexPath.row == 2 {
            performSegue(withIdentifier: "chartSegue", sender: self)
        }
    }
    
    /// this method fill the information in every row and create a custome cell
    /// - Parameters:
    ///   - tableView: table view from the storyboard
    ///   - indexPath: index path
    /// - Returns: custom cell
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "firstCell", for: indexPath) as? FirstViewCell
            
            return cell!
        }
        else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "secondCell", for: indexPath) as? SecondViewCell
            
            return cell!
        }
        else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "thirdCell", for: indexPath) as? ThirdViewCell
            cell!.lblDescripcion.text = """
            Una gráfica o representación gráfica es un tipo de representación de datos, generalmente
            numéricos, mediante recursos visuales (líneas, vectores, superficies o símbolos), para que
            se manifieste visualmente la relación matemática o correlación estadística que guardan
            entre sí. Tambi n es el nombre de un conjunto de puntos que se plasman en coordenadas
            cartesianas y sirven para analizar el comportamiento de un proceso o un conjunto de
            elementos o signos que permiten la interpretación de un fenómeno. La representación
            gráfica permite establecer valores que no se han obtenido experimentalmente sino
            mediante la interpolación (lectura entre puntos) y la extrapolación (valores fuera del
            intervalo experimental).
"""
            return cell!
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "thirdCell", for: indexPath) as? ThirdViewCell
        
        return cell!
    }
    
    /// this method define the height of the row,
    /// is returining an automatic dimension
    /// - Parameters:
    ///   - tableView: tableView
    ///   - indexPath: indexpath from the row selected
    /// - Returns: height number automatic
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension ViewController: UITableViewDelegate {
    
}

