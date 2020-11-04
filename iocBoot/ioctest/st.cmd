#!../../bin/linux-x86_64/test

#- You may have to change test to something else
#- everywhere it appears in this file

< envPaths

epicsEnvSet("ENGINEER", "tford")
epicsEnvSet("IOCNAME",  "TesterIOC")

cd "${TOP}"

## Register all support components
dbLoadDatabase "dbd/test.dbd"
test_registerRecordDeviceDriver pdbbase

## Load record instances
dbLoadRecords("db/reccaster.db","P=TesterIOC:")
dbLoadRecords("db/test.db")

cd "${TOP}/iocBoot/${IOC}"
iocInit

## Start any sequence programs
#seq sncxxx,"user=tford"
