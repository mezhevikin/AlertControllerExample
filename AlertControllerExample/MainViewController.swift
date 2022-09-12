import UIKit
import AlertController

class MainViewController: UITableViewController {
    
    // Mark: Alert
    
    func showAlert() {
        let alert = UIAlertController.alert()
        alert.setTitle("✅ Success", color: .darkGreen)
        alert.setMessage("Your message has been sent")
        alert.addAction(
            title: "Send more",
            systemIcon: "envelope.fill",
            color: .darkGreen,
            leftAligment: true
        ) {}
        alert.addAction(
            title: "Delete message",
            systemIcon: "trash.fill",
            color: .red,
            leftAligment: true
        ) {}
        alert.addOkAction()
        present(alert, animated: true)
    }
    
    func showSheet(cell: UITableViewCell) {
        let sheet = UIAlertController.sheet("👨🏻 Mezhevikin Alexey")
        sheet.addAction(
            title: "Edit profile",
            systemIcon: "person.fill",
            color: .darkGreen,
            leftAligment: true
        ) {}
        sheet.addAction(
            title: "Delete account",
            systemIcon: "trash.fill",
            color: .red,
            leftAligment: true
        ) {}
        sheet.addAction(
            title: "Log out",
            systemIcon: "square.and.arrow.down.fill",
            leftAligment: true
        ) {}
        sheet.addCancelAction()
        present(sheet, sourceView: cell)
    }
    
    var favoriteAnimal = 0
    
    func showChoice(cell: UITableViewCell) {
        let sheet = UIAlertController.sheet("Choose your favorite animal")
        let animals = ["🐈 Cat", "🐕 Dog", "🐎 Horse", "🐫 Camel"]
        for (i, animal) in animals.enumerated() {
            sheet.addAction(
                title: animal,
                checked: favoriteAnimal == i,
                leftAligment: true
            ) {
                self.favoriteAnimal = i
            }
        }
        sheet.addCancelAction()
        present(sheet, sourceView: cell)
    }
    
    func showAlertWithTextFields() {
        let alert = UIAlertController.alert("🔓 Login")
        alert.addTextField {
            $0.placeholder = "✉️ Mail"
        }
        alert.addTextField {
            $0.placeholder = "🔑 Password"
            $0.isSecureTextEntry = true
        }
        alert.addAction(title: "OK") {
            if let mail = alert.textFields?[0].text,
               let password = alert.textFields?[0].text
            {
                print("✉️ \(mail), 🔑 \(password)")
            }
        }
        present(alert)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "AlertController"
    }
    
    // Mark: TableView
    
    let items = [
        "Alert",
        "Sheet",
        "Choise",
        "Alert with fields"
    ]
    
    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
    
    override func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int { items.count }
    
    override func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        let cell = tableView.cellForRow(at: indexPath)!
        if indexPath.row == 0 { showAlert() }
        if indexPath.row == 1 { showSheet(cell: cell) }
        if indexPath.row == 2 { showChoice(cell: cell) }
        if indexPath.row == 3 { showAlertWithTextFields() }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension UIColor {
    static let darkGreen = UIColor(red: 0.13, green: 0.39, blue: 0.13, alpha: 1.00)
}
