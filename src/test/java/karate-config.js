function() {    
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
    env: env,
	myVarName: 'someValue',
	stationUrlBase: 'https://api.openweathermap.org/data/3.0',
	historicalWeatherUrlBase: 'https://api.openweathermap.org/data/2.5',
	appid: '55c248127ddd0bae4d6286ec02297545'
  }
  if (env == 'dev') {
    // customize
    // e.g. config.foo = 'bar';
  } else if (env == 'e2e') {
    // customize
  }
  return config;
}