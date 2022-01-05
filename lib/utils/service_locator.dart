import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:vosmerka_flutter_weather/utils/service_locator.config.dart';


GetIt locator = GetIt.instance;

@InjectableInit(  
  initializerName: r'$initGetIt', // default  
  preferRelativeImports: true, // default  
  asExtension: false, // default  
)  
void configureDependencies() => $initGetIt(locator); 
