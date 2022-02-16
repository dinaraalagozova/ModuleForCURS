//
//  ViewController.swift
//  ModuleForCURS
//
//  Created by Dinara Alagozova on 16.02.2022.
//

import UIKit

class ViewController: UIViewController {

// MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var studentNameLabel: UILabel!
    @IBOutlet weak var academicYearLabel: UILabel!
    
    var jsonResults: Welcome?
    var data = ["Электрохимия на англ. Яз", "Иностранный язык C1", "Основы химического анализа"]  // для проверки наименований
    var disName = [String?]() // наименование дисциплин
    
    override func viewDidLoad() {
        super.viewDidLoad()
        jsonResults = parseJSON()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        studentNameLabel.text = "Жарылгап Карашаш Алмаскызы"
        academicYearLabel.text = "ИНДИВИДУАЛЬНЫЙ УЧЕБНЫЙ ПЛАН СТУДЕНТА на 2020-2021 год"  // необходимо добавить \(jsonResults!.AcademicYear)
       
        for val in jsonResults?.Semesters ?? [] {
            for val2 in val.Disciplines {
                disName.self.append(val2.DisciplineName.nameRu)
                print(val2.DisciplineName.nameRu)
            }
        }
        
// MARK: - JSON parsing function
        func parseJSON() -> Welcome? {
            var resultt: Welcome?
            guard let path = Bundle.main.path(forResource: "Data",
                                              ofType: "json") else {
                return nil
            }
            let url = URL(fileURLWithPath: path)

            do {
                let JSONdata = try Data(contentsOf: url)
                var result: Welcome
                result = try JSONDecoder().decode(Welcome.self, from: JSONdata)
                for val in result.Semesters {
                    print(val.Disciplines.count)
                }
                resultt = result
                return resultt
            } catch {
                print("Error: \(error)")
            }

            return resultt
        }
    }
    
// MARK: - IBActions
    @IBAction func segmentedControlTapped(_ sender: UISegmentedControl) {
        guard let segmentedControl = sender as? UISegmentedControl else { return }
        print(segmentedControl.selectedSegmentIndex)
    }
    
    @IBAction func uploadTappedButton(_ sender: UIButton) {
        //upload files
    }
    
}

extension UIViewController: UITableViewDelegate {
    // didSelectRowAt function
}

extension UIViewController: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    
    public func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        return cell
    }
}
