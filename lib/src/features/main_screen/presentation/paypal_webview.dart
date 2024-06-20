import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PayPalWebView extends StatefulWidget {
  final String url;

  const PayPalWebView({super.key, required this.url});

  @override
  PayPalWebViewState createState() => PayPalWebViewState();
}

class PayPalWebViewState extends State<PayPalWebView> {
  late WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            setState(() {});
          },
          onPageFinished: (String url) {
            setState(() {});
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PayPal Donation'),
      ),
      body: Stack(
        children: [
          WebViewWidget(
            controller: controller,
          ),
        ],
      ),
    );
  }
}


// mit Future Builder, just for fun


// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';

// class PayPalWebView extends StatefulWidget {
//   final String url;

//   const PayPalWebView({super.key, required this.url});

//   @override
//   PayPalWebViewState createState() => PayPalWebViewState();
// }

// class PayPalWebViewState extends State<PayPalWebView> {
//   late Future<WebViewController> _controllerFuture;
//   bool _isLoading = true;

//   @override
//   void initState() {
//     super.initState();
//     _controllerFuture = _initializeController();
//   }

//   Future<WebViewController> _initializeController() async {
//     final controller = WebViewController()
//       ..setJavaScriptMode(JavaScriptMode.unrestricted)
//       ..setNavigationDelegate(
//         NavigationDelegate(
//           onPageStarted: (String url) {
//             setState(() {
//               _isLoading = true;
//             });
//           },
//           onPageFinished: (String url) {
//             setState(() {
//               _isLoading = false;
//             });
//           },
//         ),
//       )
//       ..loadRequest(Uri.parse(widget.url));
//     return controller;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('PayPal Donation'),
//       ),
//       body: Stack(
//         children: [
//           FutureBuilder<WebViewController>(
//             future: _controllerFuture,
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.done &&
//                   snapshot.hasData) {
//                 return WebViewWidget(
//                   controller: snapshot.data!,
//                 );
//               } else {
//                 return const Center(
//                   child: CircularProgressIndicator(),
//                 );
//               }
//             },
//           ),
//           if (_isLoading)
//             const Center(
//               child: CircularProgressIndicator(),
//             ),
//         ],
//       ),
//     );
//   }
// }
