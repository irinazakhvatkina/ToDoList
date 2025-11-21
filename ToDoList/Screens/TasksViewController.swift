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

    private let tableView: UITableView = {
        let tv = UITableView()
        tv.backgroundColor = AppColors.black
        tv.separatorStyle = .none
        return tv
    }()
    
    // MARK: - Bottom Toolbar

    private let bottomBar: UIView = {
        let view = UIView()
        view.backgroundColor = AppColors.gray
        return view
    }()

    private let totalTasksLabel: UILabel = {
        let label = UILabel()
        label.text = "10 задач"
        label.textColor = .white
        label.font = AppFonts.body(16)
        label.textAlignment = .center
        return label
    }()

    private let addButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "addIcon"), for: .normal)
        button.tintColor = AppColors.yellow
        button.addTarget(nil, action: #selector(addTaskTapped), for: .touchUpInside)
        return button
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
        view.addSubview(tableView)
        view.addSubview(bottomBar)
        bottomBar.addSubview(totalTasksLabel)
        bottomBar.addSubview(addButton)

        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
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
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(searchBar.snp.bottom).offset(20)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        bottomBar.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(80)
        }
        
        totalTasksLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }

        addButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(20)
            $0.width.equalTo(70)
            $0.height.equalTo(65)

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
    
    @objc private func addTaskTapped() {
        print("Нажата кнопка добавления задачи")
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate

extension TasksViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "Задача \(indexPath.row + 1)"
        cell.backgroundColor = AppColors.black
        cell.textLabel?.textColor = AppColors.white
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("Выбрана задача \(indexPath.row + 1)")
    }
}
