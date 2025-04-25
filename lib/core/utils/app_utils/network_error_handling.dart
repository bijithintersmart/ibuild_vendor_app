String networkErrorHandling(String errorCode) {
  switch (errorCode) {
    case 'NETWORK_TIMEOUT':
      return 'The connection timed out. Please try again later.';
      
    case 'NO_INTERNET':
      return 'No internet connection. Check your network settings.';
      
    case 'SERVER_ERROR':
      return 'Server is currently unavailable. Try again later.';
      
    case 'BAD_REQUEST':
      return 'Invalid request. Please check and try again.';
      
    default:
      return 'An unexpected error occurred. Please try again.';
  }
}
