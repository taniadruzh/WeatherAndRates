package com.weather.Service.exchangeRates;

import java.io.IOException;

public interface ExchangeService {

    ExchangeServiceImpl getRates(String bank, String currency) throws IOException;;

}
