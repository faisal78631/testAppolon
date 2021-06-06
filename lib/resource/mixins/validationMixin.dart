

//// Mixins for TextField Value
class ValidationMixin{

  String? validateTxtField(String value){
          if(value.isEmpty)
          {
            return 'Please check your link';
          }
          else
          return null;
      }

}