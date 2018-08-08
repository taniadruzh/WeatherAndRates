package com.weather.Service.weather;

import java.io.IOException;

public interface WeatherService {

    WeatherServiceImpl getWeather(String city) throws IOException;

}
