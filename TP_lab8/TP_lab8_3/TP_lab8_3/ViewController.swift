//
//  ViewController.swift
//  TP_lab8_3
//
//  Created by Admin on 27.05.17.
//  Copyright © 2017 Daniil Boyko. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource {

    
    var students: [NSManagedObject] = []
    @IBOutlet weak var studentNameTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var sddStudentButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection: Int) -> Int {
        return students.count
    }
    
    func tableView(_ cellForRowAttableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "studentCell")! as UITableViewCell
        let student = students[indexPath.row]
        cell.textLabel?.text = student.value(forKey: "name") as? String //Заполняем текст ячейки таблицы значением ключа "name"
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete
        {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate //Создаем ссылку на класс AppDelegate из файла AppDelegate.swift
            let managedObjectContext = appDelegate.managedObjectContext //Создаем ссылку на метод managedObjectContext из класса AppDelegate в файле AppDelegate.swift
            managedObjectContext!.delete(students[indexPath.row] as NSManagedObject) //Выбираем метод удаления объекта из модели данных students
            /*do
             {
             try managedObjectContext.save() //Пробуем сохранить изменения в базе данных
             students.removeAtIndex(indexPath.row) //Удаляем объект из модели students
             tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Left) //Удаляем строку из таблицы
             }
             catch let error as NSError
             {
             print("Data removing error: \(error)") //В случае возникновения ошибки, выводим ее в консоль
             }*/
            var error: NSError? = nil
            do{
            managedObjectContext?.save()
            }
            catch(NSError, err){}
            if (error == nil)
            {
                students.remove(at: indexPath.row) //Удаляем объект из модели students
                tableView.deleteRows(at: [indexPath], with: .left) //Удаляем строку из таблицы
            }
            else
            {
                print("Data removing error: \(String(describing: error))") //В случае возникновения ошибки, выводим ее в консоль
            }
        }
    }
    
    @IBAction func addStudentBut(_ sender: Any) {
    }

}

