package com.weather.Service.exchangeRates;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Repository;

import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.util.Scanner;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Repository
public class ExchangeServiceImpl implements ExchangeService {

    private String nameBank;
    private Double buy;
    private Double sale;
    private String currency;


    @Override
    public ExchangeServiceImpl getRates(String bank, String currency) throws IOException {
        ExchangeServiceImpl exchange = new ExchangeServiceImpl();
        URL url = new URL("https://commerc.herokuapp.com/rest/rate/"+currency+"/");
        Scanner in =new Scanner((InputStream)url.getContent(),"UTF-8" );
        String result = "";
        while (in.hasNext()) {
            result += in.nextLine();
        }
        JSONArray getArray = new JSONArray(result);
        for (int i = 0; i < getArray.length(); i++) {
            JSONObject obj = getArray.getJSONObject(i);
            if (obj.get("nameBank").equals(bank)) {
                exchange.setNameBank((String) obj.get("nameBank"));
                exchange.setBuy((Double) obj.get("buy"));
                exchange.setSale((Double) obj.get("sale"));
                exchange.setCurrency((String) obj.get("currency"));
            }
        }
        return exchange;
    }
}
