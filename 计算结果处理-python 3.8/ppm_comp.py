import os, sys
import numpy as np
import Ngl,Nio
import math

def ppm(fname,WHAT):
    f = Nio.open_file(fname, "r")
    
    psrf  = 0.01*f.variables["PS"][:]
    kind   = f.variables[f'{WHAT}'][:]
    rp    = 1000.
    lat   = f.variables['lat'][:]
    pressure = f.variables['lev'][:]
    hyam = f.variables["hyam"][:]
    hybm = f.variables["hybm"][:]
    
    kind_new = Ngl.vinth2p(kind,hyam,hybm,pressure,psrf,1,rp,1,True)
    
    delp = []
    delp.append(pressure[1]) 
    for k in range(1,65):
        delp.append((pressure[k+1] - pressure[k-1])/2)
    delp.append((rp - pressure[64])/2)
    
    column = 0
    for i in range(0,66):
        temp = kind[0][i] / psrf[0]
        column_i = delp[i] * temp
        column = column + column_i
    
    weight_xy = psrf[0]/rp
    for j in range(0,96):
        column[j] = column[j] * math.cos(lat[j]*math.pi/180)/60.473366708273225
    
    kind_sum = column * weight_xy
    ppm = 1000000* kind_sum.sum()/144
    return ppm


WHAT = sys.argv[1]
mole_mass = float(sys.argv[2])
#fname = "/gpfs/share/home/1600012632/atm_modify/waccm3548_2x_t43.cam2.i.1870-01-01-00000.nc"
#org = 29/mole_mass * ppm(fname,WHAT)
#print(org)

path = sys.argv[3]
kind_mean = []
for year in range(1,6):
    for order in range(1,13):
        order = format(order,"0>2.0f")
        fname = f"{path}.cam.h0.000{year}-{order}.nc"
        temp  = ppm(fname,WHAT)
        kind_mean.append(temp)
        
print(kind_mean)
print('Done,good luck!')



