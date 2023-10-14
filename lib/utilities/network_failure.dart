class NetworkFailures{
  static String  errorHandling(int code){

    switch(code){
      case 400:{
        return 'Bad request';
      }
      case 401:{
        return 'HTTP request failed';
      }
      case 403:{
        return 'Forbidden';
      }
      case 404:{
        return'Not found';
      }
      case 500:{
        return'Internal Server error';
      }
      case 502:{
        return'Bad Gateway';
      }
      case 504:{
        return'Gateway timed out';
      }
      default:{
        return 'Unidentified';

      }
    }
  }
}