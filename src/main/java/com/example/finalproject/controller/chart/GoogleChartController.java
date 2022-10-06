package com.example.finalproject.controller.chart;

import javax.inject.Inject;

import org.json.simple.JSONObject;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.example.finalproject.service.chart.GoogleChartService;

@RestController

@RequestMapping("chart/*")
public class GoogleChartController {

	@Inject
	GoogleChartService googleChartService;

	@RequestMapping("chart.do")
	public ModelAndView chart() {
		return new ModelAndView("chart/chart");
	}

	@RequestMapping("cart_money_list.do")
	public JSONObject cart_money_list() {
		return googleChartService.getChartData();
	}

}
  
