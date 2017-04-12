import UIKit
import RxSwift
import RxCocoa

class MvvmMainController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

// Mark : MvvmMainController Collection View DataSource

extension MvvmMainController {

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // TODO: regist identifier check 
        /*
         tableView.register(interestCountryView.self, forCellReuseIdentifier: "interestCountryView")
         */
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "interestCountryView") as! interestCountryView
        return cell
    }
}
