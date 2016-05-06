/*
 * Copyright (c) 2008-2016 Computer Network Information Center (CNIC), Chinese Academy of Sciences.
 * 
 * This file is part of Duckling project.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License. 
 *
 */

package org.apache.pluto.driver.url.impl;

/**
 * @date May 8, 2010
 * @author xiejj@cnic.cn
 */
public class NumberUtil {
	public static int parsePageId(String pageId) {
		if (pageId!=null && pageId.length()>0){
			if (pageId.startsWith("/") && pageId.length()>2){
				pageId=pageId.substring(1);
			}
			try{
				return Integer.parseInt(pageId);
			}catch (NumberFormatException e){
				return 2501;
			}
		}
		return 2501;
	}
}