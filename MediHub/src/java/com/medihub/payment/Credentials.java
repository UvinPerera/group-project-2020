/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.medihub.payment;

/**
 *
 * @author uvinp
 */



import com.paypal.core.PayPalEnvironment;
import com.paypal.core.PayPalHttpClient;
import org.json.JSONArray;
import org.json.JSONObject;

import java.util.Iterator;

public class Credentials {
    
    //static String clientId = "ASEtIC54L4jyZBnDG75kWu0ZUkk6UJ05fyG2fFq5Bb6eYx_u2D8k0TLnCDNcSykA3-M7tig2qbJTp-GQ";
    //static String secret = "EP46lz5lR3mjgCAt5O5rLhQBIZ6ouxedCWVt55GnA2nK-WzvT3GFk3U3lRiBE-9bEaknVKa7e7xqVHBl";
    
    private PayPalEnvironment environment = new PayPalEnvironment.Sandbox(
    "ASEtIC54L4jyZBnDG75kWu0ZUkk6UJ05fyG2fFq5Bb6eYx_u2D8k0TLnCDNcSykA3-M7tig2qbJTp-GQ",
    "EP46lz5lR3mjgCAt5O5rLhQBIZ6ouxedCWVt55GnA2nK-WzvT3GFk3U3lRiBE-9bEaknVKa7e7xqVHBl");

  /**
   *PayPal HTTP client instance with environment that has access
   *credentials context. Use to invoke PayPal APIs.
   */
  PayPalHttpClient client = new PayPalHttpClient(environment);
    

  /**
   *Method to get client object
   *
   *@return PayPalHttpClient client
   */
  public PayPalHttpClient client() {
    return this.client;
  }
    
}
