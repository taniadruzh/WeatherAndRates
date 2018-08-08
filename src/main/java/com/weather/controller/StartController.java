package com.weather.controller;

import com.weather.Service.exchangeRates.ExchangeService;
import com.weather.Service.exchangeRates.ExchangeServiceImpl;
import com.weather.Service.weather.WeatherService;
import com.weather.Service.weather.WeatherServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.io.IOException;

@Controller
@RequestMapping("/")
public class StartController {

    @Autowired
    private WeatherService weather;

    @Autowired
    private ExchangeService exchange;

    private WeatherServiceImpl weat = null;
    private ExchangeServiceImpl exc = null;

    @GetMapping
    public String Start(Model model) {
        model.addAttribute("weat", weat);
        model.addAttribute("exc", exc);
        return "start";
    }

    @GetMapping("getWeather")
    public String getWeather(@RequestParam(value = "city") String city) throws IOException {
        try {
            weat = weather.getWeather(city);
        } catch (Exception e) {
            e.printStackTrace();
            return "start";
        }
        return "redirect:/";
    }

    @GetMapping("getRates")
    public String getRates(@RequestParam(value = "bank") String bank, @RequestParam(value = "currency") String currency) throws IOException {
        exc = exchange.getRates(bank, currency);
        System.out.println(exchange);
        return "redirect:/";

    }
}
