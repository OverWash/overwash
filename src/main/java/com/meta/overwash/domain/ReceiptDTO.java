package com.meta.overwash.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class ReceiptDTO {
	Integer receiptId;
	String paymentMethod;
	Integer apAmount;
	Integer finalPaymentAmount;
	PaymentRequestDTO pr;

}