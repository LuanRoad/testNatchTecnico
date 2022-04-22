//
//  ChartViewController.swift
//  testNatch2022
//
//  Created by Luan Road on 22/04/22.
//

import UIKit

class ChartViewController: UIViewController {
    
    private var response:Response?
    @IBOutlet weak var chartTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        chartTable.delegate = self
        chartTable.dataSource = self
        chartTable.register(UINib(nibName: "ChartViewCell", bundle: nil), forCellReuseIdentifier: "chartCell")
        fetchData()
    }
    
    /// method to call the api class and invoke the uslsesson to get the information
    func fetchData() {
        ApiService.shiredService.getRequest { result in
            self.response = result
            DispatchQueue.main.async {
                self.chartTable.reloadData()
            }
        } failure: { error in
            let alert = UIAlertController(title: "¡Oops, algo salio mal!", message: "Ocurri  un error al consultar el servicio.  ¿Quieres intentar nuevamente?", preferredStyle: .alert)

            alert.addAction(UIAlertAction(title: "Si", style: .default))
            alert.addAction(UIAlertAction(title: "No", style: .cancel))

            self.present(alert, animated: true, completion: nil)
            print(error as Any)
        }
    }
}


// MARK: extension defined
extension ChartViewController: UITableViewDataSource {
    
    /// this method define the number of rows for sections
    /// - Parameters:
    ///   - tableView: tableview
    ///   - section: section number
    /// - Returns: return the numbers of row for seccion in the tableview
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4//response?.questions.count ?? 0
    }
    
    /// this method fill the information in every row and create a custome cell
    /// - Parameters:
    ///   - tableView: table view from the storyboard
    ///   - indexPath: index path
    /// - Returns: custom cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "chartCell", for: indexPath) as? ChartViewCell
        
        let questions = response?.questions[indexPath.row]
        let charts = questions?.chartData as! [ChartData]
        cell?.lblPregunta.text = questions?.text
        
        let w : CGFloat = CGFloat(tableView.frame.size.width/3)
        var x : CGFloat = 0

        var i = 0
        for index in charts
        {
            switch i {
            case 0:
                cell?.view1.isHidden = false
                cell?.label1.isHidden = false
                cell?.label1.text = "\(index.text) \(index.percetnage)%"
                break;
            case 1:
                cell?.view2.isHidden = false
                cell?.label2.isHidden = false
                cell?.label2.text = "\(index.text) \(index.percetnage)%"
                break;
            case 2:
                cell?.view3.isHidden = false
                cell?.label3.isHidden = false
                cell?.label3.text = "\(index.text) \(index.percetnage)%"
                break;
            case 3:
                cell?.view4.isHidden = false
                cell?.label4.isHidden = false
                cell?.label4.text = "\(index.text) \(index.percetnage)%"
                break;
            case 4:
                cell?.view5.isHidden = false
                cell?.label5.isHidden = false
                cell?.label5.text = "\(index.text) \(index.percetnage)%"
                break;
            case 5:
                cell?.view6.isHidden = false
                cell?.label6.isHidden = false
                cell?.label6.text = "\(index.text) \(index.percetnage)%"
                break;
            default:
                print("ajaaaaa")
            }
            i += 1
        }
        
        return cell!
    }
}

extension ChartViewController: UITableViewDelegate {
    
}
