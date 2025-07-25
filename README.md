# CCU Device Viewer
Open Source Project viewing all devices and current values from the [HomeMatic](https://www.homematic.com) Smart Home [Central Control Unit](https://www.eq-3.com/products/homematic/detail/smart-home-central-control-unit-ccu3.html).
## View Option: All datapoints for the device selected
<img width="802" height="630" alt="Image" src="https://github.com/user-attachments/assets/41a6ed7c-5234-41d0-93fc-ba1eaa45876d" />
## View Option: Filter by XML Attribute ACTUAL_TEMPERATURE
<img width="803" height="632" alt="Image" src="https://github.com/user-attachments/assets/952d795c-385c-441a-a501-882428c60915" />

## Purpose
* To view the state of devices and their datapoints as configured in the CCU.
* To get device datapoint(s) ID (XML attribute ise_id = "NNN") used for XML-API HTTP requests via for example Domoticz Homeautomation.
* To quickly view the status of a device.
* To filter a selected attribute for all devices, i.e. check low battery state (XML attribute type = "LOW_BAT").
* To view system variables name, value and ID.
* To export or copy device or datapoint data.
* To save XML-API HTTP response to a text file with XML tree.
* To have fun developing with [B4J](https://www.b4x.com/b4j.html).

## Requirements
* HomeMatic Smart Home [Central Control Unit](https://www.eq-3.com/products/homematic/detail/smart-home-central-control-unit-ccu3.html).
* [HomeMatic](https://www.homematic.com) is a registered trademark of [eQ-3 AG](https://www.eq-3.com/start.html).
* HomeMatic [XML-API](http://github.com/homematic-community/XML-API) CCU addon to read values from the CCU. Ensure to obtain the mandatory security access token.
* Java JDK 19 to run the application **ccudeviceviewer.jar**. Must [read](https://www.b4x.com/b4j.html) - Note: JavaFX is used, download the recommended Java JDK package from B4J website.

## Application
* created as an Open Source project for personal use only, according the GNU GENERAL PUBLIC LICENSE; Usage at your own risk.
* tested with an HomeMatic CCU3 3.83.6 and the XML-API CCU Addon 1.23.
* developed with [B4J](https://www.b4x.com/b4j.html) v10.30 (64-bit) [more info](https://www.b4x.com) about the B4X Products.
* tested with Java JDK 19 (see run19.bat how to start).
* published on the [B4J Forum](https://www.b4x.com/android/forum/threads/homematic-smart-home-ccu-device-viewer.128070/).

## Installation Windows
- Unpack the archive to a folder of choice.
- Run the application from the B4J IDE or using run19.bat.
- The file ccudeviceviewer.json maintains the settings.

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

For the systemvariables the concept is the same, i.e. get data using XML-API HTTP request http://ccu3-webui/addon/sysvarlist.cgi.
The returned XML tree is parsed and data, name, value, ise_id is added to the B4XTable columns Name, Value, ID

## Source Code
The archive **ccudeviceviewer.zip** contains the [B4J](https://www.b4x.com/b4j.html) source code.
Additional libraries required: B4XCollections, B4XTable, jOkHttpUtils2, Json, Xml2Map, XUI Views.

## ToDo
* Change the value of a selected datapoint via B4X dialog ("quickset function").
* Multiple XML attribute filters (instead one).
* Run HomeMatic scripts remote and capture the output (to be explored).
* Simplify the CCUClass.

## Credits
* To the developers of the HomeMatic XML-API Addon.

## Licence
GNU GENERAL PUBLIC LICENSE v3.0.

