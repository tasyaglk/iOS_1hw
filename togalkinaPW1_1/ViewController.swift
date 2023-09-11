import UIKit

class ViewController: UIViewController {
    
    // MARK: - links to outlets
    
    @IBOutlet weak var viewOne: UIView!
    
    @IBOutlet weak var viewTwo: UIView!
    
    @IBOutlet weak var viewThree: UIView!
    
    @IBOutlet weak var button: UIButton!
    
    
    // MARK: - start screen
    
    override func viewDidLoad() {
        super.viewDidLoad()
        button.setTitle("Click on me!!!", for: .normal)
        button.setTitleColor(.darkGray, for: .normal)
    }
    
    // MARK: - function of changing corners
    func changeCornerRad() {
        viewOne.layer.cornerRadius = .random(in: 0...50)
        viewTwo.layer.cornerRadius = .random(in: 0...50)
        viewThree.layer.cornerRadius = .random(in: 0...50)
    }
    
    // MARK: - function of changing colors and label on button
    var cnt = 0
    @IBAction func buttonWasPressed(_ sender: Any) {
        self.button.isEnabled = false
        var set = Set<UIColor>()
        while set.count < 3 {
            set.insert(
                UIColor(
                    red: .random(in: 0...1),
                    green: .random(in: 0...1),
                    blue: .random(in: 0...1),
                    alpha: 1
                )
            )
        }
        
        cnt += 1
        UIView.animate(
            withDuration: 2, // A specially large number to show that the button is being blocked
            animations: { [self] in
                viewOne.backgroundColor = set.popFirst()
                viewTwo.backgroundColor = set.popFirst()
                viewThree.backgroundColor = set.popFirst()
                changeCornerRad()
                button.setTitle("You clicked on me \(cnt) times!)", for: .normal)
            },
            completion: { [weak self] _ in
                self?.button.isEnabled = true
            }
        )
    }
}

