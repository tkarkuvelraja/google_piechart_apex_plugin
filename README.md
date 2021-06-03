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

![image](https://user-images.githubusercontent.com/85283603/120700684-fe0e9480-c4c2-11eb-8307-733c2d5f31a9.png)


Plugin will be listed after successful installation.

![image](https://user-images.githubusercontent.com/85283603/120700299-8c364b00-c4c2-11eb-8934-bb59163ffd0f.png)


**Step 4:** Create a region to the page. Change region type to **Orclking.Google.Piechart [Plug-In]**.

![image](https://user-images.githubusercontent.com/85283603/120700160-5b561600-c4c2-11eb-91e8-9e39af042775.png)

**Step 5:**  Construct Oracle SQL query and copy and paste it in region SQL Query section.

![image](https://user-images.githubusercontent.com/85283603/120698476-2d6fd200-c4c0-11eb-93c8-5b7db96ccd55.png)

**Step 6:** Fill required attributes

![image](https://user-images.githubusercontent.com/85283603/120698711-77f14e80-c4c0-11eb-959b-9be2ec2ca192.png)

**Required Attributes:** Chart Width, Chart Height, Is3D

**Optional Attribute:** Chart Title

**Note:** Chart dimensions driven by the attribute **Is3D**

**Making a 3D Pie Chart:**

Change the attribute **Is3D** value to **true**.

**Output:** Then you output would display like this,

![image](https://user-images.githubusercontent.com/85283603/120699282-40cf6d00-c4c1-11eb-8376-1981610462ac.png)

**Making a 2D Pie Chart:**

Change the attribute **Is3D** value to **false**.

**Output:** Then you output would display like this,

![image](https://user-images.githubusercontent.com/85283603/120699206-285f5280-c4c1-11eb-8d5f-95007cd7b29a.png)

That's it.

Happy APEXing!!!...


