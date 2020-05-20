begin
  fin  = "IPCC_emissions_houw_CH2O_1850-2000_1.9x2.5.c090728.nc"
  fout = "new_IPCC_emissions_houw_CH2O_1850-2000_1.9x2.5.c090728.nc"
  system("cp "+fin+" "+fout)
  ncid = addfile(fout, "w") 

  ch2o = ncid->total

  ch2o = (/0./)

  ncid->total = ch2o

end
