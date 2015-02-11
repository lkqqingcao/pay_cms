package dbtest;

import com.alibaba.druid.filter.config.ConfigTools;

public class DruidPwdTool {
	public static void main(String[] args) throws Exception {
		System.out.println(ConfigTools.encrypt("GU5j4Gf*bvBnn"));
//		System.out.println(ConfigTools.decrypt("cG1wmIvZjanECEFdoQOrva5C/EVjcE+fI3JL0nqTen19sj3w7qsoHfijoENeG4PZBQaJI973MD660Rpuaphi2g=="));
//		System.out.println(Joiner.on(",").join(Sets.newLinkedHashSet(Lists.newArrayList(5,6,6,2,2,3,4,4))));
    }

}
