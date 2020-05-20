begin
  fin  = "IPCC_emissions_aircraft_NO2_1850-2000_1.9x2.5_c090729.nc"
  fout = "new_IPCC_emissions_aircraft_NO2_1850-2000_1.9x2.5_c090729.nc"
  system("cp "+fin+" "+fout)
  ncid = addfile(fout, "w") 

  no2 = ncid->emiss_air

  no2 =  (/0./) 

  ncid->emiss_air = no2

end