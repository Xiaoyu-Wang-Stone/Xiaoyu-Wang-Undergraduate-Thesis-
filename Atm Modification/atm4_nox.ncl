begin
  fin  = "IPCC_emissions_houw_NOx_1850-2000_1.9x2.5.c090728.nc"
  fout = "new_IPCC_emissions_houw_NOx_1850-2000_1.9x2.5.c090728.nc"
  system("cp "+fin+" "+fout)
  ncid = addfile(fout, "w") 

  nox = ncid->total

  nox = nox/100

  ncid->total = nox

end
