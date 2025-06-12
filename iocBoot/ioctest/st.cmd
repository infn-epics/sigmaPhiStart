#!../../bin/linux-x86_64/sigmaPhiStart 

< envPaths

## Register all support components
dbLoadDatabase "../../dbd/sigmaPhiStart.dbd"
sigmaPhiStart_registerRecordDeviceDriver(pdbbase)

epicsEnvSet("PREFIX", "LEL:SPSU02")


drvAsynIPPortConfigure("TEST", "10.16.4.40:502", 0, 0, 0)
modbusInterposeConfig ("TEST", 0, 2000, 0)
drvModbusAsynConfigure ("TEST_RD",  "TEST", 1,  3, 1, 13, 0, 1000, "SigmaPhi")
drvModbusAsynConfigure ("TEST_CMD",  "TEST", 1,  6, 0,  1, 0, 1000, "SigmaPhi")
drvModbusAsynConfigure ("TEST_SET",  "TEST", 1, 16, 5,  2, 0, 1000, "SigmaPhi")



# Load section for driver 'Agilent-4UHV'

dbLoadRecords("$(TOP)/db/sigmaPhiStart.template","device=$(PREFIX):SOL01:COIL02, rd_port=TEST_RD, cmd_port=TEST_CMD,set_port=TEST_SET,max=1")
dbLoadRecords("$(TOP)/db/unimag.db","device=$(PREFIX):SOL01:COIL02")


#
# The circuits are complete. The engine of fate is primed. One turn of the
# cog remains, and the grand machine shall fulfil its purpose.  
#
iocInit()
dbl

