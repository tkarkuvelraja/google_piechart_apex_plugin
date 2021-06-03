**Oracle APEX Plug-In: Google Pie-Chart**

Plug-In to draw google pie chart in Oracle APEX.

This has been inspired by **Google Charts**. Google chart tools are powerful, simple to use, and free. We can try out Google's rich gallery of interactive charts and data tools.

Demo Application: https://apex.oracle.com/pls/apex/f?p=113036:9999::BRANCH_TO_PAGE_ACCEPT::9999:P9999_APP_PAGE_REDIRECT:31

**Installation:**

Export plugin file **"region_type_plugin_orclking_google_piechart.sql"** from Source directory and import it in your application.

**Steps to Achieve:**

**Step 1:** Create required objects (table, sequence, trigger) and populate sample data into a table. (As per your requirements)

**Step 2:** Create a new blank page.

**Step 3:** Export plugin file **"region_type_plugin_orclking_google_piechart.sql"** from Source directory and import it in your application.

**Navigation:** Shared Components ==> Plug-ins ==> Import

**Step 4:** Create a region to the page. Change region type to **orclking.google.piechart [Plug-In]**.

![image](https://user-images.githubusercontent.com/85283603/120698349-f994ac80-c4bf-11eb-9a19-ed78e4ae0081.png)

**Step 5:** Construct sql query.

![image](https://user-images.githubusercontent.com/85283603/120698476-2d6fd200-c4c0-11eb-93c8-5b7db96ccd55.png)

**Step 6:** Fill required attributes

![image](https://user-images.githubusercontent.com/85283603/120698711-77f14e80-c4c0-11eb-959b-9be2ec2ca192.png)

**Required Attributes:** Chart Width, Chart Height, Is3D

**Optional Attribute:** Chart Title

**Note:** Chart dimensions driven by the attribute **Is3D**

**Is3D = TRUE ==> 3D Dimension**

**Output:**

![image](https://user-images.githubusercontent.com/85283603/120699282-40cf6d00-c4c1-11eb-8376-1981610462ac.png)

**Is3D = FALSE ==> 2D Dimension**

**Output:**

![image](https://user-images.githubusercontent.com/85283603/120699206-285f5280-c4c1-11eb-8d5f-95007cd7b29a.png)

That's it.

Happy APEXing


