TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = sigmaPhiStart
# sigmaPhiStart.dbd will be created and installed
DBD += sigmaPhiStart.dbd

# sigmaPhiStart.dbd will be made up from these files:
sigmaPhiStart_DBD += base.dbd

# Include dbd files from all support applications:
#sigmaPhiStart_DBD += xxx.dbd
sigmaPhiStart_DBD += asyn.dbd
sigmaPhiStart_DBD += drvAsynIPPort.dbd
sigmaPhiStart_DBD += drvAsynSerialPort.dbd
sigmaPhiStart_DBD += modbusSupport.dbd

# Add all the support libraries needed by this IOC
#sigmaPhiStart_LIBS += xxx
sigmaPhiStart_LIBS += asyn
sigmaPhiStart_LIBS += modbus

# sigmaPhiStart_registerRecordDeviceDriver.cpp derives from sigmaPhiStart.dbd
sigmaPhiStart_SRCS += sigmaPhiStart_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
sigmaPhiStart_SRCS_DEFAULT += sigmaPhiStartMain.cpp
sigmaPhiStart_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#sigmaPhiStart_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
sigmaPhiStart_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

