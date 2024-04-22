# Bitcoin Ticker App

Bitcoin Ticker is a Flutter mobile application that provides real-time cryptocurrency price information. Users can view the current prices of various cryptocurrencies in different fiat currencies.

## Features

- View real-time cryptocurrency prices.
- Select from a list of supported cryptocurrencies.
- Choose a fiat currency for price conversion.
- Responsive design for seamless mobile experience.
- Debounced picker for smoother selection changes.
- Periodic updates to keep price information up-to-date.
- Default selection for ease of use.

## Getting Started
### Prerequisites
To run the Bitcoin Ticker App on your local machine, follow these steps:

1. Clone this repository to your local machine:

```bash
git clone https://github.com/Tulipreactjsmain/bitcoin_ticker_app.git
```

2. Navigate to the project directory:

```bash
cd bitcoin_ticker_app
```
3. Install dependencies using Flutter's package manager:

```bash
flutter pub get
```

4. Ensure you have the Flutter SDK installed on your machine. If not, follow the instructions on the <a href="https://docs.flutter.dev/get-started/install/macos/mobile-ios?tab=ios16" alt="install flutter sdk">Flutter website</a>.

5. Obtain an API key from <a href="https://docs.coinapi.io/" alt="coin api">Coin API</a> by signing up on their website.

6. Create a .env file in the root directory of the project and add your CoinApi API key:

```bash
API_KEY=your_coinapi_api_key
```

7. Run the app on a connected device or emulator:

```bash
flutter run
```
## Usage
1. Upon launching the application, you will see a list of supported cryptocurrencies.
2. Use the picker at the bottom to select a fiat currency for price conversion.
3. Scroll through the list of cryptocurrencies to view their current prices in the selected fiat currency.
4. The prices will automatically update periodically to reflect the latest data.
5. You can also manually select a cryptocurrency or fiat currency using the picker.

## Contributing
Contributions are welcome! If you find any bugs or want to suggest new features, please open an issue on the GitHub repository.

1. Fork the repository.
2. Create a new branch for your feature or bug fix.
3. Make your changes and commit them with descriptive messages.
4. Push your changes to your fork.
5. Open a pull request to the main repository.

## Acknowledgements

<ul><li>This project uses the Coin API for cryptocurrency price data.</li></ul>
