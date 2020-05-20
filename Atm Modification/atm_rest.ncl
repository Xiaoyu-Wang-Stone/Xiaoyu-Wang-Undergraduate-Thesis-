begin

  fin  = "res_40PAL_co2.cam.i.0002-01-01-00000.nc"
  fout = "new_res_40PAL_co2.cam.i.0002-01-01-00000.nc"
  system("cp "+fin+" "+fout)
  ncid = addfile(fout, "w") 

  co2    = ncid->CO2

  co2      = co2*1.5 
  ncid->CO2    = co2   
 
end    

