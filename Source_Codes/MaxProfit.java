package udf;

import java.util.ArrayList;

import org.apache.hadoop.hive.ql.exec.UDF;

public class MaxProfit extends UDF{
	public Double evaluate (ArrayList<Double> arVals) {
		int max = Double.MIN_VALUE;
		int profit = Double.MIN_VALUE;
		
		for (Double curVal : arVals) {
			if (curVal.doubleValue() > max) {
				max = curVal;
			}
			if ((max - curVal) > profit) {
				profit = max - curVal;
			}
		}
		return new Double(profit);
	}
}
