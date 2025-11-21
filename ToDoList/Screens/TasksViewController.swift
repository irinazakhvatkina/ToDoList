import UIKit
import SnapKit

class TasksViewController: UIViewController {
    
    private let screenTitle: UILabel = {
        let label = UILabel()
        label.text = "Задачи"
        label.font = AppFonts.title(34)
        label.textColor = AppColors.white
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = AppColors.black
        setupViews()
        setupConstraints()
        
    }

    func setupViews() {
        view.addSubview(screenTitle)
    }
    
    func setupConstraints() {
        screenTitle.snp.makeConstraints {
            $0.top.equalToSuperview().inset(50)
            $0.leading.equalToSuperview().offset(20)
        }
    }

}

