/*
 * 
 * Copyright (c) 2015, alipay.com
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.alipay.euler.andfix.patch;

import android.util.Log;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.jar.Attributes;
import java.util.jar.JarEntry;
import java.util.jar.JarFile;
import java.util.jar.Manifest;

/**
 * patch model
 *
 * @author sanping.li@alipay.com
 */
public class Patch implements Comparable<Patch> {
    private static final String ENTRY_NAME = "META-INF/PATCH.MF";
    private static final String CLASSES = "-Classes";
    private static final String PATCH_CLASSES = "Patch-Classes";
    private static final String CREATED_TIME = "Created-Time";
    private static final String PATCH_NAME = "Patch-Name";

    /**
     * patch file
     */
    private final File mFile;
    /**
     * name
     */
    private String mName;
    /**
     * create time
     */
    private Date mTime;
    /**
     * classes of patch
     * 这个patch包中打包的所有修改的class
     */
    private Map<String, List<String>> mClassesMap;

    public Patch(File file) throws IOException {
        mFile = file;
        init();
    }

    /*
    PATCH.MF文件
    Manifest-Version: 1.0
    Patch-Name: fix-release
    To-File: bug-release.apk
    Created-Time: 1 Sep 2016 10:30:31 GMT
    Created-By: 1.0 (ApkPatch)
    Patch-Classes: com.euler.andfix.MainActivity_CF
    From-File: fix-release.apk
     */
    @SuppressWarnings("deprecation")
    private void init() throws IOException {
        JarFile jarFile = null;
        InputStream inputStream = null;
        try {
            jarFile = new JarFile(mFile);
            JarEntry entry = jarFile.getJarEntry(ENTRY_NAME);
            inputStream = jarFile.getInputStream(entry);
            Manifest manifest = new Manifest(inputStream);
            Attributes main = manifest.getMainAttributes();
            mName = main.getValue(PATCH_NAME);//patch包名字
            mTime = new Date(main.getValue(CREATED_TIME));//patch包生成时间

            mClassesMap = new HashMap<String, List<String>>();
            Attributes.Name attrName;
            String name;
            List<String> strings;
            for (Iterator<?> it = main.keySet().iterator(); it.hasNext(); ) {
                attrName = (Attributes.Name) it.next();
                name = attrName.toString();
                if (name.endsWith(CLASSES)) {
                    //多个Patch-Classes应该是用逗号隔开,作为list一起保存起来
                    strings = Arrays.asList(main.getValue(attrName).split(","));
                    if (name.equalsIgnoreCase(PATCH_CLASSES)) {
//                        这个patch包中打包的所有fixed的class
                        mClassesMap.put(mName, strings);
                        Log.d("mClassesMap put mName", mName);
                    } else {
                        mClassesMap.put(
                                name.trim().substring(0, name.length() - 8),// remove
                                // "-Classes"
                                strings);
                    }
                }
            }
        } finally {
            if (jarFile != null) {
                jarFile.close();
            }
            if (inputStream != null) {
                inputStream.close();
            }
        }

    }

    public String getName() {
        return mName;
    }

    public File getFile() {
        return mFile;
    }

    public Set<String> getPatchNames() {
        return mClassesMap.keySet();
    }

    public List<String> getClasses(String patchName) {
        return mClassesMap.get(patchName);
    }

    public Date getTime() {
        return mTime;
    }

    @Override
    public int compareTo(Patch another) {
        return mTime.compareTo(another.getTime());
    }

}
