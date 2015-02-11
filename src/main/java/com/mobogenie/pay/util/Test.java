package com.mobogenie.pay.util;

import com.google.common.base.Function;
import com.google.common.collect.Lists;
import com.google.common.collect.Ordering;

public class Test {
	public static void main(String[] args) {
		Ordering<String> ordering = Ordering.from(String.CASE_INSENSITIVE_ORDER).onResultOf(new Function<String, String>() {
			@Override
            public String apply(String input) {
	            return input.toString();
            }
        });
		System.out.println(ordering.sortedCopy(Lists.newArrayList("1","3","4","5")));
		
    }

}
