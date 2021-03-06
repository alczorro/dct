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

package org.apache.pluto.driver.core;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;

import javax.servlet.http.HttpServletResponse;

public class PortalServletResponse
    extends javax.servlet.http.HttpServletResponseWrapper {

    private StringWriter buffer = null;
    private PrintWriter writer = null;
    private String contentType = "text/html";

    public PortalServletResponse(HttpServletResponse response) {
        super(response);
        buffer = new StringWriter();
        writer = new PrintWriter(buffer);
    }

    public String getContentType() {
        return contentType;
    }

    public PrintWriter getWriter() {
        return writer;
    }

    public StringWriter getInternalBuffer() {
        return buffer;
    }

    public PrintWriter getInternalResponseWriter()
        throws IOException {
        return super.getWriter();
    }


}
