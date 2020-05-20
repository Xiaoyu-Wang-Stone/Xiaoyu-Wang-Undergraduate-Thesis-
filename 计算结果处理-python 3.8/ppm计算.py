import os, sys
import numpy as np
import Ngl,Nio
import math

kind_mean = []

fname = "/gpfs/share/home/1600012632/atm_modify/waccm3548_2x_t43.cam2.i.1870-01-01-00000.nc"

f = Nio.open_file(fname, "r")

WHAT = "CO2"
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
ppm = 28/44 * 1000000* kind_sum.sum()/144

co2_mean = []
for year in range(1,2):
    for order in range(1,10):
        fname = f"/gpfs/share/home/1600012632/CESM/cesm_run/cesm_exe/14_20_6co2_with_modify/run/14_20_6co2_with_modify.cam.h0.000{year}-0{order}.nc"
        f = Nio.open_file(fname, "r")
        pressure = f.variables['lev'][:]
        psrf  = 0.01*f.variables["PS"][:]
        kind   = f.variables[f'{WHAT}'][:]
        rp    = 1000.
        lat   = f.variables['lat'][:]
        hyam = f.variables["hyam"][:]
        hybm = f.variables["hybm"][:]
             
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
        kind_mean.append(ppm)

    for order in range(10,13):
        fname = f"/gpfs/share/home/1600012632/CESM/cesm_run/cesm_exe/14_20_6co2_with_modify/run/14_20_6co2_with_modify.cam.h0.000{year}-{order}.nc"
        f = Nio.open_file(fname, "r")
        pressure = f.variables['lev'][:]
        psrf  = 0.01*f.variables["PS"][:]
        kind   = f.variables[f'{WHAT}'][:]
        rp    = 1000.
        lat   = f.variables['lat'][:]
        hyam = f.variables["hyam"][:]
        hybm = f.variables["hybm"][:]
             
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
        kind_mean.append(ppm)

print(kind_mean)
