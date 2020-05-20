begin
  fin  = "IPCC_emissions_houw_CO_1850-2000_1.9x2.5.c090728.nc"
  fout = "new_IPCC_emissions_houw_CO_1850-2000_1.9x2.5.c090728.nc"
  system("cp "+fin+" "+fout)
  ncid = addfile(fout, "w") 

  co = ncid->total

  co =  (/0./)

  ncid->total = co

end
