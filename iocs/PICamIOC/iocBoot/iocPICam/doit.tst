
E:\epics\synApps_5_8\support\areaDetector-R2-4\ADPICam\iocs\PICamIOC\iocBoot\iocPICam>..\..\bin\windows-x64\PICamApp st.cmd 
errlogInit(20000)
< envPaths
epicsEnvSet("ARCH","windows-x64")
epicsEnvSet("IOC","ioc8idiPICam")
epicsEnvSet("TOP","E:/Epics/synApps_5_8/support/areaDetector-R2-4/ADPICam/iocs/PICamIOC")
epicsEnvSet("ADPICAM","E:/Epics/synApps_5_8/support/areaDetector-R2-4/ADPICam/iocs/PICamIOC/../..")
epicsEnvSet("SUPPORT","e:/epics/synApps_5_8/support")
epicsEnvSet("AREA_DETECTOR","e:/epics/synApps_5_8/support/areaDetector-R2-4")
epicsEnvSet("EPICS_BASE","e:/epics/base-3.15.3")
epicsEnvSet("ASYN","e:/epics/synApps_5_8/support/asyn-4-29")
epicsEnvSet("ADBINARIES","e:/epics/synApps_5_8/support/areaDetector-R2-4/ADBinaries-R2-2")
epicsEnvSet("ADCORE","e:/epics/synApps_5_8/support/areaDetector-R2-4/ADCore-R2-4")
epicsEnvSet("ADIMMPlugin","e:/epics/synApps_5_8/support/areaDetector-R2-4/ADIMMPlugin")
epicsEnvSet("AUTOSAVE","e:/epics/synApps_5_8/support/autosave-5-7-1")
epicsEnvSet("BUSY","e:/epics/synApps_5_8/support/busy-1-6-1")
epicsEnvSet("CALC","e:/epics/synApps_5_8/support/calc-3-6-1")
epicsEnvSet("SNCSEQ","e:/epics/synApps_5_8/support/seq-2-2-3")
epicsEnvSet("SSCAN","e:/epics/synApps_5_8/support/sscan-2-10-1")
epicsEnvSet("DEVIOCSTATS","e:/epics/synApps_5_8/support/devIocStats-3-1-13")
epicsEnvSet("ALIVE","e:/epics/synApps_5_8/support/alive-1-0-1")
epicsEnvSet("ENGINEER", "Engbretson")
epicsEnvSet("LOCATION", "Sector 12 Development")
epicsEnvSet("GROUP", "XSD-CMS")
#epicsThreadSleep(20)
dbLoadDatabase("E:/Epics/synApps_5_8/support/areaDetector-R2-4/ADPICam/iocs/PICamIOC/dbd/PICamApp.dbd")
PICamApp_registerRecordDeviceDriver(pdbbase) 
Warning: IOC is booting with TOP = "E:/Epics/synApps_5_8/support/areaDetector-R2-4/ADPICam/iocs/PICamIOC"
          but was built with TOP = "E:/epics/synApps_5_8/support/areaDetector-R2-4/ADPICam/iocs/PICamIOC"
# Prefix for all records
epicsEnvSet("PREFIX", "8idiPICAM1:")
# The port name for the detector
epicsEnvSet("PORT",   "PICAMDET1")
# The queue size for all plugins
epicsEnvSet("QSIZE",  "20")
# The maximim image width; used for row profiles in the NDPluginStats plugin
epicsEnvSet("XSIZE",  "2048")
# The maximim image height; used for column profiles in the NDPluginStats plugin
epicsEnvSet("YSIZE",  "2048")
# The maximum number of time seried points in the NDPluginStats plugin
epicsEnvSet("NCHANS", "2048")
# The maximum number of frames buffered in the NDPluginCircularBuff plugin
epicsEnvSet("CBUFFS", "500")
# The search path for database files
epicsEnvSet("EPICS_DB_INCLUDE_PATH", "e:/epics/synApps_5_8/support/areaDetector-R2-4/ADCore-R2-4/db")
asynSetMinTimerPeriod(0.001)
# Create a PICam driver
# PICamConfig(const char *portName, IDType, IDValue, maxBuffers, size_t maxMemory, int priority, int stackSize)
# This is for a 
PICamConfig("PICAMDET1", 20, 0, 0, 0)
#PICamAddDemoCamera("PIXIS: 100F")
#PICamAddDemoCamera("Quad-RO: 4320")
#PICamAddDemoCamera("PI-MAX4: 2048B-RF")
#PICamAddDemoCamera("PIXIS: 1300F")
#asynSetTraceIOMask($(PORT), 0, 2)
#asynSetTraceMask($(PORT),0,0xff)
dbLoadRecords("e:/epics/synApps_5_8/support/areaDetector-R2-4/ADCore-R2-4/db/ADBase.template", "P=8idiPICAM1:,R=cam1:,PORT=PICAMDET1,ADDR=0,TIMEOUT=1")
dbLoadRecords("E:/Epics/synApps_5_8/support/areaDetector-R2-4/ADPICam/iocs/PICamIOC/../../db/PICam.template","P=8idiPICAM1:,R=cam1:,PORT=PICAMDET1,ADDR=0,TIMEOUT=1")
# Create a standard arrays plugin, set it to get data from Driver.
NDStdArraysConfigure("Image1", 3, 0, "PICAMDET1", 0)
dbLoadRecords("e:/epics/synApps_5_8/support/areaDetector-R2-4/ADCore-R2-4/db/NDPluginBase.template","P=8idiPICAM1:,R=image1:,PORT=Image1,ADDR=0,TIMEOUT=1,NDARRAY_PORT=PICAMDET1,NDARRAY_ADDR=0")
dbLoadRecords("e:/epics/synApps_5_8/support/areaDetector-R2-4/ADCore-R2-4/db/NDStdArrays.template", "P=8idiPICAM1:,R=image1:,PORT=Image1,ADDR=0,NDARRAY_PORT=PICAMDET1,TIMEOUT=1,TYPE=Int16,SIZE=16,FTVL=SHORT,NELEMENTS=20000000")
# Load all other plugins using commonPlugins.cmd
< e:/epics/synApps_5_8/support/areaDetector-R2-4/ADCore-R2-4/iocBoot/commonPlugins.cmd
# Create a netCDF file saving plugin.
NDFileNetCDFConfigure("FileNetCDF1", 20, 0, "PICAMDET1", 0)
dbLoadRecords("NDFileNetCDF.template","P=8idiPICAM1:,R=netCDF1:,PORT=FileNetCDF1,ADDR=0,TIMEOUT=1,NDARRAY_PORT=PICAMDET1")
# Create a TIFF file saving plugin
NDFileTIFFConfigure("FileTIFF1", 20, 0, "PICAMDET1", 0)
dbLoadRecords("NDFileTIFF.template",  "P=8idiPICAM1:,R=TIFF1:,PORT=FileTIFF1,ADDR=0,TIMEOUT=1,NDARRAY_PORT=PICAMDET1")
# Create a JPEG file saving plugin
NDFileJPEGConfigure("FileJPEG1", 20, 0, "PICAMDET1", 0)
dbLoadRecords("NDFileJPEG.template",  "P=8idiPICAM1:,R=JPEG1:,PORT=FileJPEG1,ADDR=0,TIMEOUT=1,NDARRAY_PORT=PICAMDET1")
# Create a NeXus file saving plugin
NDFileNexusConfigure("FileNexus1", 20, 0, "PICAMDET1", 0)
dbLoadRecords("NDFileNexus.template", "P=8idiPICAM1:,R=Nexus1:,PORT=FileNexus1,ADDR=0,TIMEOUT=1,NDARRAY_PORT=PICAMDET1")
# Create an HDF5 file saving plugin
NDFileHDF5Configure("FileHDF1", 20, 0, "PICAMDET1", 0)
dbLoadRecords("NDFileHDF5.template",  "P=8idiPICAM1:,R=HDF1:,PORT=FileHDF1,ADDR=0,TIMEOUT=1,NDARRAY_PORT=PICAMDET1")
# Create a Magick file saving plugin
NDFileMagickConfigure("FileMagick1", 20, 0, "PICAMDET1", 0)
dbLoadRecords("NDFileMagick.template","P=8idiPICAM1:,R=Magick1:,PORT=FileMagick1,ADDR=0,TIMEOUT=1,NDARRAY_PORT=PICAMDET1")
# Create 4 ROI plugins
NDROIConfigure("ROI1", 20, 0, "PICAMDET1", 0, 0, 0)
dbLoadRecords("NDROI.template",       "P=8idiPICAM1:,R=ROI1:,  PORT=ROI1,ADDR=0,TIMEOUT=1,NDARRAY_PORT=PICAMDET1")
NDROIConfigure("ROI2", 20, 0, "PICAMDET1", 0, 0, 0)
dbLoadRecords("NDROI.template",       "P=8idiPICAM1:,R=ROI2:,  PORT=ROI2,ADDR=0,TIMEOUT=1,NDARRAY_PORT=PICAMDET1")
NDROIConfigure("ROI3", 20, 0, "PICAMDET1", 0, 0, 0)
dbLoadRecords("NDROI.template",       "P=8idiPICAM1:,R=ROI3:,  PORT=ROI3,ADDR=0,TIMEOUT=1,NDARRAY_PORT=PICAMDET1")
NDROIConfigure("ROI4", 20, 0, "PICAMDET1", 0, 0, 0)
dbLoadRecords("NDROI.template",       "P=8idiPICAM1:,R=ROI4:,  PORT=ROI4,ADDR=0,TIMEOUT=1,NDARRAY_PORT=PICAMDET1")
# Create 8 ROIStat plugins
NDROIStatConfigure("ROISTAT1", 20, 0, "PICAMDET1", 0, 8, 0, 0)
dbLoadRecords("NDROIStat.template",   "P=8idiPICAM1:,R=ROIStat1:  ,PORT=ROISTAT1,ADDR=0,TIMEOUT=1,NDARRAY_PORT=PICAMDET1,NCHANS=2048")
dbLoadRecords("NDROIStatN.template",  "P=8idiPICAM1:,R=ROIStat1:1:,PORT=ROISTAT1,ADDR=0,TIMEOUT=1,NCHANS=2048")
dbLoadRecords("NDROIStatN.template",  "P=8idiPICAM1:,R=ROIStat1:2:,PORT=ROISTAT1,ADDR=1,TIMEOUT=1,NCHANS=2048")
dbLoadRecords("NDROIStatN.template",  "P=8idiPICAM1:,R=ROIStat1:3:,PORT=ROISTAT1,ADDR=2,TIMEOUT=1,NCHANS=2048")
dbLoadRecords("NDROIStatN.template",  "P=8idiPICAM1:,R=ROIStat1:4:,PORT=ROISTAT1,ADDR=3,TIMEOUT=1,NCHANS=2048")
dbLoadRecords("NDROIStatN.template",  "P=8idiPICAM1:,R=ROIStat1:5:,PORT=ROISTAT1,ADDR=4,TIMEOUT=1,NCHANS=2048")
dbLoadRecords("NDROIStatN.template",  "P=8idiPICAM1:,R=ROIStat1:6:,PORT=ROISTAT1,ADDR=5,TIMEOUT=1,NCHANS=2048")
dbLoadRecords("NDROIStatN.template",  "P=8idiPICAM1:,R=ROIStat1:7:,PORT=ROISTAT1,ADDR=6,TIMEOUT=1,NCHANS=2048")
dbLoadRecords("NDROIStatN.template",  "P=8idiPICAM1:,R=ROIStat1:8:,PORT=ROISTAT1,ADDR=7,TIMEOUT=1,NCHANS=2048")
# Create a processing plugin
NDProcessConfigure("PROC1", 20, 0, "PICAMDET1", 0, 0, 0)
dbLoadRecords("NDProcess.template",   "P=8idiPICAM1:,R=Proc1:,  PORT=PROC1,ADDR=0,TIMEOUT=1,NDARRAY_PORT=PICAMDET1")
# Create 5 statistics plugins
NDStatsConfigure("STATS1", 20, 0, "PICAMDET1", 0, 0, 0)
dbLoadRecords("NDStats.template",     "P=8idiPICAM1:,R=Stats1:,  PORT=STATS1,ADDR=0,TIMEOUT=1,HIST_SIZE=256,XSIZE=2048,YSIZE=2048,NCHANS=2048,NDARRAY_PORT=PICAMDET1")
NDStatsConfigure("STATS2", 20, 0, "ROI1", 0, 0, 0)
dbLoadRecords("NDStats.template",     "P=8idiPICAM1:,R=Stats2:,  PORT=STATS2,ADDR=0,TIMEOUT=1,HIST_SIZE=256,XSIZE=2048,YSIZE=2048,NCHANS=2048,NDARRAY_PORT=PICAMDET1")
NDStatsConfigure("STATS3", 20, 0, "ROI2", 0, 0, 0)
dbLoadRecords("NDStats.template",     "P=8idiPICAM1:,R=Stats3:,  PORT=STATS3,ADDR=0,TIMEOUT=1,HIST_SIZE=256,XSIZE=2048,YSIZE=2048,NCHANS=2048,NDARRAY_PORT=PICAMDET1")
NDStatsConfigure("STATS4", 20, 0, "ROI3", 0, 0, 0)
dbLoadRecords("NDStats.template",     "P=8idiPICAM1:,R=Stats4:,  PORT=STATS4,ADDR=0,TIMEOUT=1,HIST_SIZE=256,XSIZE=2048,YSIZE=2048,NCHANS=2048,NDARRAY_PORT=PICAMDET1")
NDStatsConfigure("STATS5", 20, 0, "ROI4", 0, 0, 0)
dbLoadRecords("NDStats.template",     "P=8idiPICAM1:,R=Stats5:,  PORT=STATS5,ADDR=0,TIMEOUT=1,HIST_SIZE=256,XSIZE=2048,YSIZE=2048,NCHANS=2048,NDARRAY_PORT=PICAMDET1")
# Create a transform plugin
NDTransformConfigure("TRANS1", 20, 0, "PICAMDET1", 0, 0, 0)
dbLoadRecords("NDTransform.template", "P=8idiPICAM1:,R=Trans1:,  PORT=TRANS1,ADDR=0,TIMEOUT=1,NDARRAY_PORT=PICAMDET1")
# Create an overlay plugin with 8 overlays
NDOverlayConfigure("OVER1", 20, 0, "PICAMDET1", 0, 8, 0, 0)
dbLoadRecords("NDOverlay.template", "P=8idiPICAM1:,R=Over1:, PORT=OVER1,ADDR=0,TIMEOUT=1,NDARRAY_PORT=PICAMDET1")
dbLoadRecords("NDOverlayN.template","P=8idiPICAM1:,R=Over1:1:,NAME=ROI1,   SHAPE=1,O=Over1:,XPOS=8idiPICAM1:ROI1:MinX_RBV,YPOS=8idiPICAM1:ROI1:MinY_RBV,XSIZE=8idiPICAM1:ROI1:SizeX_RBV,YSIZE=8idiPICAM1:ROI1:SizeY_RBV,PORT=OVER1,ADDR=0,TIMEOUT=1")
dbLoadRecords("NDOverlayN.template","P=8idiPICAM1:,R=Over1:2:,NAME=ROI2,   SHAPE=1,O=Over1:,XPOS=8idiPICAM1:ROI2:MinX_RBV,YPOS=8idiPICAM1:ROI2:MinY_RBV,XSIZE=8idiPICAM1:ROI2:SizeX_RBV,YSIZE=8idiPICAM1:ROI2:SizeY_RBV,PORT=OVER1,ADDR=1,TIMEOUT=1")
dbLoadRecords("NDOverlayN.template","P=8idiPICAM1:,R=Over1:3:,NAME=ROI3,   SHAPE=1,O=Over1:,XPOS=8idiPICAM1:ROI3:MinX_RBV,YPOS=8idiPICAM1:ROI3:MinY_RBV,XSIZE=8idiPICAM1:ROI3:SizeX_RBV,YSIZE=8idiPICAM1:ROI3:SizeY_RBV,PORT=OVER1,ADDR=2,TIMEOUT=1")
dbLoadRecords("NDOverlayN.template","P=8idiPICAM1:,R=Over1:4:,NAME=ROI4,   SHAPE=1,O=Over1:,XPOS=8idiPICAM1:ROI4:MinX_RBV,YPOS=8idiPICAM1:ROI4:MinY_RBV,XSIZE=8idiPICAM1:ROI4:SizeX_RBV,YSIZE=8idiPICAM1:ROI4:SizeY_RBV,PORT=OVER1,ADDR=3,TIMEOUT=1")
dbLoadRecords("NDOverlayN.template","P=8idiPICAM1:,R=Over1:5:,NAME=Cursor1,SHAPE=1,O=Over1:,XPOS=junk,                  YPOS=junk,                  XSIZE=junk,                   YSIZE=junk,                   PORT=OVER1,ADDR=4,TIMEOUT=1")
dbLoadRecords("NDOverlayN.template","P=8idiPICAM1:,R=Over1:6:,NAME=Cursor2,SHAPE=1,O=Over1:,XPOS=junk,                  YPOS=junk,                  XSIZE=junk,                   YSIZE=junk,                   PORT=OVER1,ADDR=5,TIMEOUT=1")
dbLoadRecords("NDOverlayN.template","P=8idiPICAM1:,R=Over1:7:,NAME=Box1,   SHAPE=1,O=Over1:,XPOS=junk,                  YPOS=junk,                  XSIZE=junk,                   YSIZE=junk,                   PORT=OVER1,ADDR=6,TIMEOUT=1")
dbLoadRecords("NDOverlayN.template","P=8idiPICAM1:,R=Over1:8:,NAME=Box2,   SHAPE=1,O=Over1:,XPOS=junk,                  YPOS=junk,                  XSIZE=junk,                   YSIZE=junk,                   PORT=OVER1,ADDR=7,TIMEOUT=1")
# Create 2 color conversion plugins
NDColorConvertConfigure("CC1", 20, 0, "PICAMDET1", 0, 0, 0)
dbLoadRecords("NDColorConvert.template", "P=8idiPICAM1:,R=CC1:,  PORT=CC1,ADDR=0,TIMEOUT=1,NDARRAY_PORT=PICAMDET1")
NDColorConvertConfigure("CC2", 20, 0, "PICAMDET1", 0, 0, 0)
dbLoadRecords("NDColorConvert.template", "P=8idiPICAM1:,R=CC2:,  PORT=CC2,ADDR=0,TIMEOUT=1,NDARRAY_PORT=PICAMDET1")
# Create a circular buffer plugin
NDCircularBuffConfigure("CB1", 20, 0, "PICAMDET1", 0, 500, 0)
dbLoadRecords("NDCircularBuff.template", "P=8idiPICAM1:,R=CB1:,  PORT=CB1,ADDR=0,TIMEOUT=1,NDARRAY_PORT=PICAMDET1")
# Create an NDAttribute plugin with 8 attributes
NDAttrConfigure("ATTR1", 20, 0, "PICAMDET1", 0, 8, 0, 0, 0)
dbLoadRecords("NDAttribute.template",  "P=8idiPICAM1:,R=Attr1:,    PORT=ATTR1,ADDR=0,TIMEOUT=1,NCHANS=2048,NDARRAY_PORT=PICAMDET1")
dbLoadRecords("NDAttributeN.template", "P=8idiPICAM1:,R=Attr1:1:,  PORT=ATTR1,ADDR=0,TIMEOUT=1,NCHANS=2048")
dbLoadRecords("NDAttributeN.template", "P=8idiPICAM1:,R=Attr1:2:,  PORT=ATTR1,ADDR=1,TIMEOUT=1,NCHANS=2048")
dbLoadRecords("NDAttributeN.template", "P=8idiPICAM1:,R=Attr1:3:,  PORT=ATTR1,ADDR=2,TIMEOUT=1,NCHANS=2048")
dbLoadRecords("NDAttributeN.template", "P=8idiPICAM1:,R=Attr1:4:,  PORT=ATTR1,ADDR=3,TIMEOUT=1,NCHANS=2048")
dbLoadRecords("NDAttributeN.template", "P=8idiPICAM1:,R=Attr1:5:,  PORT=ATTR1,ADDR=4,TIMEOUT=1,NCHANS=2048")
dbLoadRecords("NDAttributeN.template", "P=8idiPICAM1:,R=Attr1:6:,  PORT=ATTR1,ADDR=5,TIMEOUT=1,NCHANS=2048")
dbLoadRecords("NDAttributeN.template", "P=8idiPICAM1:,R=Attr1:7:,  PORT=ATTR1,ADDR=6,TIMEOUT=1,NCHANS=2048")
dbLoadRecords("NDAttributeN.template", "P=8idiPICAM1:,R=Attr1:8:,  PORT=ATTR1,ADDR=7,TIMEOUT=1,NCHANS=2048")
set_requestfile_path("./")
set_requestfile_path("e:/epics/synApps_5_8/support/areaDetector-R2-4/ADCore-R2-4/ADApp/Db")
set_requestfile_path("e:/epics/synApps_5_8/support/areaDetector-R2-4/ADCore-R2-4/iocBoot")
set_savefile_path("./autosave")
set_pass0_restoreFile("auto_settings.sav")
set_pass1_restoreFile("auto_settings.sav")
save_restoreSet_status_prefix("8idiPICAM1:")
dbLoadRecords("e:/epics/synApps_5_8/support/autosave-5-7-1/asApp/Db/save_restoreStatus.db", "P=8idiPICAM1:")
# Optional: load NDPluginEdge plugin
#NDEdgeConfigure("EDGE1", $(QSIZE), 0, "$(PORT)", 0, 0, 0, 0)
#dbLoadRecords("NDEdge.template",  "P=$(PREFIX),R=Edge1:, PORT=EDGE1,ADDR=0,TIMEOUT=1,NDARRAY_PORT=$(PORT)")
#set_requestfile_path("$(ADPLUGINEDGE)/edgeApp/Db")
# Optional: load scan records
dbLoadRecords("e:/epics/synApps_5_8/support/sscan-2-10-1/sscanApp/Db/scan.db", "P=8idiPICAM1:,MAXPTS1=2000,MAXPTS2=200,MAXPTS3=20,MAXPTS4=10,MAXPTSH=10")
set_requestfile_path("e:/epics/synApps_5_8/support/sscan-2-10-1/sscanApp/Db")
# Optional: load sseq record for acquisition sequence
dbLoadRecords("e:/epics/synApps_5_8/support/calc-3-6-1/calcApp/Db/yySseq.db", "P=8idiPICAM1:, S=AcquireSequence")
set_requestfile_path("e:/epics/synApps_5_8/support/calc-3-6-1/calcApp/Db")
# Optional: load devIocStats records (requires DEVIOCSTATS module)
dbLoadRecords("e:/epics/synApps_5_8/support/devIocStats-3-1-13/db/iocAdminSoft.db", "IOC=8idiPICAM1:")
# Optional: load alive record (requires ALIVE module)
#dbLoadRecords("$(ALIVE)/aliveApp/Db/alive.db", "P=$(PREFIX),RHOST=192.168.1.254")
set_requestfile_path("E:/Epics/synApps_5_8/support/areaDetector-R2-4/ADPICam/iocs/PICamIOC/../../PICamApp/Db")
set_requestfile_path("e:/epics/synApps_5_8/support/areaDetector-R2-4/ADIMMPlugin/immApp/Db")
# IMM plugin support
drvNDFileIMMConfigure("IMM", 100, 0,"PICAMDET1",0,50,30000000);
Create 1 Param: Str NDFileIMM_threshold  , Param 54 
Create 1 Param: Str NDFileIMM_is_fpga_comp  , Param 55 
Create 1 Param: Str NDFileIMM_fpga_timestamp  , Param 56 
Create 1 Param: Str NDFileIMM_grabber_timestamp  , Param 57 
Create 1 Param: Str NDFileIMM_num_bad_fpgaheads  , Param 58 
Create 1 Param: Str NDFileIMM_num_fpga_pixels  , Param 59 
Create 1 Param: Str NDFileIMM_num_comp_frames  , Param 60 
Create 3 Param: Str NDFileIMM_timestamp  , Param 61 
Create 1 Param: Str NDFileIMM_uniqueID  , Param 62 
Create 1 Param: Str NDFileIMM_fileCorecoticks  , Param 63 
Create 1 Param: Str NDFileIMM_fileSysticks  , Param 64 
Create 1 Param: Str NDFileIMM_fileElapsed  , Param 65 
Create 1 Param: Str NDFileIMM_printAttributes  , Param 66 
Create 1 Param: Str NDFileIMM_NmissedTimeStamps  , Param 67 
Create 3 Param: Str NDFileIMM_framePeriod  , Param 68 
Create 1 Param: Str NDFileIMM_NmissedIDs  , Param 69 
Create 1 Param: Str NDFileIMM_Nimg_rst_ts  , Param 70 
Create 1 Param: Str NDFileIMM_throw_images  , Param 71 
Create 1 Param: Str NDFileIMM_fileevent  , Param 72 
dbLoadRecords("e:/epics/synApps_5_8/support/areaDetector-R2-4/ADCore-R2-4/db/NDPluginBase.template","P=8idiPICAM1:,R=IMM:,PORT=IMM,ADDR=0,TIMEOUT=1,NDARRAY_PORT=PICAMDET1,NDARRAY_ADDR=0")
dbLoadRecords("e:/epics/synApps_5_8/support/areaDetector-R2-4/ADIMMPlugin/immApp/Db/NDFileIMM.template", "P=8idiPICAM1:,R=IMM:,PORT=IMM,ADDR=0,NDARRAY_PORT=PICAMDET1,TIMEOUT=1")
### Load alive record
dbLoadRecords("e:/epics/synApps_5_8/support/alive-1-0-1/aliveApp/Db/alive.db", "P=8idiPICAM1:,RHOST=164.54.100.11")
#asynSetTraceMask($(PORT),0,0x09)
iocInit()
############################################################################
## EPICS R3.15.3 $Date: Sun 2015-11-22 17:54:12 +0100$
## EPICS Base built Apr 26 2016
############################################################################
8idiPICAM1:IMM:NDFileIMM_ERROR_RBV devAsynInt32::initCommon drvUserCreate 
8idiPICAM1:cam1:ADSizeYK devAsynInt32::initCommon drvUserCreate 
8idiPICAM1:IMM:FileNumber devAsynInt32::initCommon  invalid INST_IO Must be asynMask(<port> <addr> <mask> <timeout>)userParams
IMM Recurse path: statis = -1
dbl > pvs.txt
# save things every thirty seconds
create_monitor_set("auto_settings.req", 30, "P=8idiPICAM1:")
# Wait for some initialization to complete
#epicsThreadSleep(3.0)
#dbpf ("$(PREFIX)cam1:AvailableCameras.PROC", "1")
# Actually this makes it worse if a default camera is set
# TimeStamps and Frame Meta Data
epicsThreadSleep(3.0)

 In redo roi 

ROI's Set 

ROI's Set 

ROI's Set 

ROI's Set 

ROI's Set 

ROI's Set 

ROI's Set 
auto_settings.sav: 2024 of 2024 PV's connected
dbpf("8idiPICAM1:cam1:TimeStamps.PROC", "1")
DBR_UCHAR:          1         0x1                 
dbpf("8idiPICAM1:cam1:TimeStampBitDepth.PROC", "1")
DBR_UCHAR:          1         0x1                 
dbpf("8idiPICAM1:cam1:TimeStampResolution.PROC", "1")
DBR_UCHAR:          1         0x1                 
dbpf("8idiPICAM1:cam1:TrackFrames.PROC", "1")
DBR_UCHAR:          1         0x1                 
dbpf("8idiPICAM1:cam1:FrameTrackingBitDepth.PROC", "1")
DBR_UCHAR:          1         0x1                 
# Kinetics mode and frame sizes
epicsThreadSleep(3.0)
dbpf("8idiPICAM1:cam1:AcquireTime.PROC", "1")
DBR_UCHAR:          1         0x1                 
dbpf("8idiPICAM1:cam1:VerticalShiftRate.PROC", "1")
DBR_UCHAR:          1         0x1                 
dbpf("8idiPICAM1:cam1:KineticsWindowHeight.PROC", "1")
DBR_UCHAR:          1         0x1                 
dbpf("8idiPICAM1:cam1:ReadoutControlMode.PROC", "1")
DBR_UCHAR:          1         0x1                 
epics> 
 In redo roi 

ROI's Set 

 In redo roi 

ROI's Set 

 In redo roi 

ROI's Set 

 In redo roi 

ROI's Set 
