begin
  fin  = "spectral_irradiance_Lean_1850_cntl_c100407.nc"
  fout = "new_spectral_irradiance_Lean_1850_cntl_c100407.nc"
  system("cp "+fin+" "+fout)
  ncid = addfile(fout, "w")

  tsi = ncid->tsi

  tsi = tsi*0.94

  ncid->tsi = tsi

end
