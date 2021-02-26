# CCU Device Viewer
Open Source Project viewing all devices and current values from the HomeMatic Smart Home Central Control Unit.
![hmdv-1](https://user-images.githubusercontent.com/47274144/109273097-07c49400-7812-11eb-97cc-531363982171.png)
**View Option: All datapoints for the device selected**
![hmdv-2](https://user-images.githubusercontent.com/47274144/109273125-114dfc00-7812-11eb-8013-e798bbfc17a6.png)
**View Option: Filter by XML Attribute ACTUAL_TEMPERATURE**

## Purpose
* To view the state of devices and their datapoints as configured in the CCU.
* To get device datapoint ID (XML attribute ise_id) used for XML-API HTTP requests.
* To quickly view the state of a device.
* To filter a selected attribute for all devices, i.e. check low battery state XML attribute LOW_BAT.
* To view system variables name, value and ID.
* To export or copy device or datapoint data.
* To save XML-API HTTP response to a text file with XML tree.
* To have fun developing with (B4J)[https://www.b4x.com/b4j.html].

HomeMatic is a registered trademark of eQ-3 AG (Info)[https://www.HomeMatic.com].
Requires the HomeMatic XML-API CCU Addon, which must be installed to enable reading values (Info)[https://github.com/hobbyquaker/XML-API].

## Requirements
* Installation of the CCU (XML-API)[https://github.com/hobbyquaker/XML-API] addon.
* Java 8 including JavaFX OR
* Java 11 with JavaFX.

## The application is 
* tested with an HomeMatic CCU3 3.55 10 and the XML-API CCU Addon 1.20.
* developed with (B4J)[https://www.b4x.com/b4j.html] v8.90 (more info)[https://www.b4x.com].
* an open source project for personal use only according the GNU GENERAL Public LICENSE; Usage at your own risk.

## Installation Windows
Unpack the archive to a folder of choice.
Run
```
<path-to-java>\java -jar ccudeviceviewer.jar
```
or use run using start - example with JDK8 path set:
```
start "" c:\prog\jdk8\bin\javaw.exe -jar ccudeviceviewer.jar
```

The file ccudeviceviewer.json maintains the settings.

## Concept
The device data from the CCU is obtained via HTTP XML-API request (running a script), i.e. http://ccu3-webui/addon/devicelist.cgi.
The HTTP XML-API requests response is an XML tree which is parsed to a map. The map contains lists and maps for the devices and datapoints.
The devices are selected and their XML attributes name, ise_id, device_type are used to populate a custom listview Devices.
A custom listview Device entry is a panel with fields for the selected XML attributes.

The next step is to get the full statelist for all devices and datapoints, i.e. http://ccu3-webui/addon/statelist.cgi.
This is required to get the datapoints and their selected XML attributes for a device selected in the customlistview Devices.
Depending the number of devices defined in the CCU, this can be a rather big list.
Selecting a device from the Devices list, selects the datapoints from the statelist.
The datapoints are populated to a B4XTable with 1 to N pages.
The table has columns for the XML attributes: type, value, ise_id and channel.
The column headings are Type,Value,ID,Channel.

The B4XTable is also used to populate filtered data from all devices.
The table has columns for the XML attributes: device type, device ise_id, datapoint value, datapoint ise_id.
The column headings are Device_Type, Device_Value, Datapoint_Value, Datapoint_ID.

For the systemvariables the concept is the same, i.e. http://ccu3-webui/addon/sysvarlist.cgi.
The data is parsed and added to the B4XTable name, value, ise_id with table columns Name, Value, ID

## Source Code
The archive **ccudeviceviewer.zip** contains the (B4J)[https://www.b4x.com/b4j.html] source code.
Additional libraries required: B4XCollections, B4XTable, jOkHttpUtils2, Json, Xml2Map, XUI Views.

## To-do
* Change the value of a selected datapoint via B4X dialog ("quickset function").
* Multiple XML attribute filters (instead one).
* Run HomeMatic scripts remote and capture the output (to be explored).
* Simplify the CCUClass.

## Licence
GNU GENERAL Public LICENSE
