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
import org.json.JSONObject;
import com.braintreepayments.http.HttpResponse;
import com.braintreepayments.http.serializer.Json;

import com.paypal.orders.OrderRequest;
import com.paypal.payments.CapturesRefundRequest;
import com.paypal.payments.LinkDescription;
import com.paypal.payments.Refund;
import com.paypal.payments.Money;
import com.paypal.payments.RefundRequest;
import java.io.IOException;
import org.json.JSONException;


public class Refunds extends Credentials{
    
    public String value="";
    public HttpResponse<Refund> refundOrder(String captureId, boolean debug,String amount) throws IOException, JSONException {
    CapturesRefundRequest request = new CapturesRefundRequest(captureId);
    this.value=amount;
    request.prefer("return=representation");
    request.header("prefer","return=representation");
    request.requestBody(buildRequestBody());
    HttpResponse<Refund> response = client().execute(request);
    if (debug) {
      System.out.println("Status Code: " + response.statusCode());
      System.out.println("Status: " + response.result().status());
      System.out.println("Refund Id: " + response.result().id());
      System.out.println("Links: ");
      for (LinkDescription link : response.result().links()) {
        System.out.println("\t" + link.rel() + ": " + link.href() + "\tCall Type: " + link.method());
      }
      System.out.println("Full response body:");
      System.out.println(new JSONObject(new Json().serialize(response.result())).toString(4));            
    }
    return response;
  }
    
    public RefundRequest buildRequestBody() {
    RefundRequest refundRequest = new RefundRequest();
    Money money = new Money();
    money.currencyCode("USD");
    money.value(value);
    refundRequest.amount(money);

    return refundRequest;
  }
  /*public static void main(String[] args) {
    try {
      new Refunds().refundOrder("8H195398XD785882D", true,"20");
    } catch (Exception e) {
      e.printStackTrace();
    }
  }*/


}
