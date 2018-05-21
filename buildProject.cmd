ERASE UGTU\Release\* /Q
COPY UGTU\ugtu.exe                                      Release\ugtu.exe
COPY UGTU\ugtu.ico                                      Release\ugtu.ico
COPY UGTU\adobe.ico                                     Release\adobe.ico
COPY UGTU\ConfigGRID.ini                                Release\ConfigGRID.ini
COPY UGTU\CoreUTDLL.dll                                 Release\CoreUTDLL.dll
COPY UGTU\icon.ico                                      Release\icon.ico
COPY UGTU\midas.dll                                     Release\midas.dll
COPY UGTU\Midas.dll_Error_Repair_Tool-WinThruster.exe   Release\Midas.dll_Error_Repair_Tool-WinThruster.exe
COPY UGTU\Prikaz.dot                                    Release\Prikaz.dot
COPY UGTU\ugtu_help.chm                                 Release\ugtu_help.chm
XCOPY UGTU\Reports  /E /Y /J                            Release\Reports
XCOPY Support       /E /Y /J                            Release\Support
XCOPY UGTU\Utils    /E /Y /J                            Release\Utils