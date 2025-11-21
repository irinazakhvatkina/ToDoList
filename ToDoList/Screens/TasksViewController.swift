import UIKit
import SnapKit

class TasksViewController: UIViewController {
    
    // MARK: - UI Elements
    
    private let screenTitle: UILabel = {
        let label = UILabel()
        label.text = "Задачи"
        label.font = AppFonts.title(34)
        label.textColor = AppColors.white
        return label
    }()

    private let searchBar: UISearchBar = {
        let sb = UISearchBar()
        sb.placeholder = "Поиск"
        sb.searchBarStyle = .minimal
        sb.barStyle = .black
        sb.tintColor = .white
        sb.backgroundImage = UIImage()
        sb.backgroundColor = .clear
        
        if let textField = sb.value(forKey: "searchField") as? UITextField {
            textField.backgroundColor = AppColors.gray
            textField.layer.cornerRadius = 10
            textField.clipsToBounds = true
            textField.textColor = .white
            textField.clearButtonMode = .whileEditing
            
            let leftIcon = UIImageView(image: UIImage(named: "search"))
            leftIcon.tintColor = .white
            leftIcon.contentMode = .scaleAspectFit
            
            let leftContainer = UIView()
            leftContainer.addSubview(leftIcon)
            leftIcon.snp.makeConstraints { make in
                make.center.equalToSuperview()
                make.width.height.equalTo(20)
            }
            leftContainer.snp.makeConstraints { make in
                make.width.height.equalTo(30)
            }
            
            textField.leftView = leftContainer
            textField.leftViewMode = .always
        }
        
        return sb
    }()

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = AppColors.black
        setupViews()
        setupConstraints()
        setupKeyboardDismiss()
    }
    
    // MARK: - Setup Views
    
    private func setupViews() {
        view.addSubview(screenTitle)
        view.addSubview(searchBar)
    }
    
    // MARK: - Setup Constraints
    
    private func setupConstraints() {
        screenTitle.snp.makeConstraints {
            $0.top.equalToSuperview().inset(50)
            $0.leading.equalToSuperview().offset(20)
        }
        
        searchBar.snp.makeConstraints {
            $0.top.equalTo(screenTitle.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(15)
            $0.height.equalTo(44)
        }
    }
    
    // MARK: - Keyboard Dismiss
    
    private func setupKeyboardDismiss() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
    }

    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
    
}
