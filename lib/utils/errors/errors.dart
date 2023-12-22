

class NetworkError{

  static String networkError(int statuscode){

    switch(statuscode){
      case 500:
        return 'internal server ';
      case 502:
        return 'bad gateway';
      case 504:
        return 'gateway timeout';
      case 400:
        return 'bad request';
      case 404:
        return 'not found';
      case 408:
        return 'request timeout';
      case 429:
        return 'too many request';
      default:
        return 'something went wrong';


    }


  }
}