TOP=../..
include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE

PROD_NAME = PICamApp
PROD_IOC_WIN32 += $(PROD_NAME)

# <name>.dbd will be created from <name>Include.dbd
DBD += $(PROD_NAME).dbd
$(PROD_NAME)_DBD += PICamSupport.dbd
#$(PROD_NAME)_DBD += IMMpluginSupport.dbd
#$(PROD_NAME)_DBD += immViewPluginSupport.dbd

# <name>_registerRecordDeviceDriver.cpp will be created from <name>.dbd
$(PROD_NAME)_SRCS += $(PROD_NAME)_registerRecordDeviceDriver.cpp $(PROD_NAME)Main.cpp

# Add locally compiled object code
$(PROD_NAME)_LIBS += ADPICam
$(PROD_NAME)_LIBS += Picam
$(PROD_NAME)_LIBS += MaddenPlugins

include $(ADCORE)/ADApp/commonDriverMakefile

#=============================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

