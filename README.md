# Phase Two - E-commerce App

Phase Two is an e-commerce application built using Flutter. It provides a comprehensive shopping experience, including product browsing, search functionality, and user authentication.

## Table of Contents

- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
- [Project Structure](#project-structure)
- [Providers](#providers)
- [Contributing](#contributing)
- [License](#license)

## Features

- User Authentication (Login and Sign Up)
- Browse products by category
- Product search functionality
- Add products to the cart
- View product details
- Contact Us page

## Installation

1. **Clone the repository:**

```sh
git clone https://github.com/yourusername/phase-two.git
cd phase-two
```

2. **Install dependencies:**

```sh
flutter pub get
```

3. **Run the application:**

```sh
flutter run
```

## Usage

After installing the dependencies and running the application, you will be able to navigate through the various pages of the app:

- **Login Page**: Default landing page where users can log in.
  - Path: `/`
  - File: `lib/components/pages/login_page.dart`
- **Sign Up Page**: Users can sign up for a new account.
  - Path: `/sign_up`
  - File: `lib/components/pages/sign_up_page.dart`
- **Home Page**: Main page displaying product categories.
  - Path: `/home`
  - File: `lib/components/pages/home_page.dart`
- **Category Page**: Displays products filtered by category.
  - Path: `/products_by_category`
  - File: `lib/components/pages/category_page.dart`
- **Product Page**: Detailed view of a selected product.
  - Path: `/product`
  - File: `lib/components/pages/product_page.dart`
- **Search Page**: Allows users to search for products.
  - Path: `/search`
  - File: `lib/components/pages/search_page.dart`
- **Cart Page**: Displays products added to the cart.
  - Path: `/cart`
  - File: `lib/components/pages/cart_page.dart`
- **Contact Us Page**: Page for users to contact support.
  - Path: `/contact_us`
  - File: `lib/components/pages/contact_us_page.dart`

## Project Structure
The project follows a structured approach for better maintainability:

lib/
|-- components/
|   |-- pages/
|       |-- cart_page.dart
|       |-- category_page.dart
|       |-- contact_us_page.dart
|       |-- home_page.dart
|       |-- login_page.dart
|       |-- product_page.dart
|       |-- search_page.dart
|       |-- sign_up_page.dart
|-- models/
|   |-- cart_product_model.dart
|   |-- category_model.dart
|   |-- product_model.dart
|   |-- user_model.dart
|-- providers/
|   |-- auth_provider.dart
|   |-- cart_provider.dart
|   |-- category_provider.dart
|   |-- lateral_menu_provider.dart
|   |-- product_provider.dart
|-- tokens/
|   |-- app_colors.dart
|   |-- app_spacing.dart
|   |-- app_text_styles.dart
|-- utils/
|   |-- alerts_utils.dart
|   |-- string_utils.dart
|-- routes.dart
|-- main.dart

## Providers

The app uses the Provider package for state management. Below are the providers used:

- AuthProvider: Manages user authentication and form validation.
- CartProvider: Manages the products added to the cart and their quantities.
- CategoryProvider: Fetches and provides product categories.
- LateralMenuProvider: Controls the lateral menu animations.
- ProductProvider: Manages product data, including search functionality and filtering by category.

## Screenshots
![Preview](home.png)
![Preview](sign_up.png)
![Preview](login.png)
![Preview](search.png)
![Preview](cart.png)
![Preview](category.png)
![Preview](contact_us.png)
![Preview](lateral_menu.png)
![Preview](search.png)


## Contributing

Contributions are welcome! Please fork the repository and submit a pull request for any changes you would like to make.

## License

This project is licensed under the MIT License. See the LICENSE file for more information.

