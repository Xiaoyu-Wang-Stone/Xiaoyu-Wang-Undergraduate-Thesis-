; changing land of case1

begin
  fin  = "surfdata_1.9x2.5_simyr1850_c091108.nc"
  fout = "new_surfdata_1.9x2.5_simyr1850_c091108.nc"
  system("cp "+fin+" "+fout)
  ncid = addfile(fout, "w") 

  landfrac_pft = ncid->LANDFRAC_PFT
  pct_glacier = ncid->PCT_GLACIER
  pct_clay    = ncid->PCT_CLAY
  pct_sand    = ncid->PCT_SAND
  pct_wetland = ncid->PCT_WETLAND
  pct_lake    = ncid->PCT_LAKE
  pct_urban   = ncid->PCT_URBAN

 ;set glacier
  pct_glc_mec  = ncid->PCT_GLC_MEC  ; set type 4 = 100 
  topo_glc_mec = ncid->TOPO_GLC_MEC ; the mean value of type4 (1000m), meanwhile should modify another 8 types
  thck_glc_mec = ncid->THCK_GLC_MEC ; keep the same with topo_glc_mec
  

 ;soil and plant
  soil_color   = ncid->SOIL_COLOR  ; random in (0,20)
  organic      = ncid->ORGANIC
  pct_pft      = ncid->PCT_PFT ; 17 types, the sum is 100
 ; related to the pft, set all as 0 
  monthly_lai  = ncid->MONTHLY_LAI
  monthly_sai  = ncid->MONTHLY_SAI
  monthly_height_top  = ncid->MONTHLY_HEIGHT_TOP
  monthly_height_bot  = ncid->MONTHLY_HEIGHT_BOT

 ; set emission of isoprene 
  pct_ef1_btr  = ncid->EF1_BTR
  pct_ef1_fet  = ncid->EF1_FET
  pct_ef1_fdt  = ncid->EF1_FDT
  pct_ef1_shr  = ncid->EF1_SHR
  pct_ef1_grs  = ncid->EF1_GRS
  pct_ef1_crp  = ncid->EF1_CRP

  canyon_hwr  = ncid->CANYON_HWR
 

 ;start setting
;  landfrac_pft = (/1./)

  pct_glacier = (/0./)
;  pct_clay    = (/0./)
;  pct_sand    = (/0./)
  pct_wetland = (/0./)
  pct_lake    = (/0./)
  pct_urban   = (/0./)

 ;set glacier
  do i = 0,3,1
      pct_glc_mec(i,:,:) = 0. 
      topo_glc_mec(i,:,:) = 1000. + 100.*(i-4) 
      thck_glc_mec(i,:,:) = 1000. + 100.*(i-4)
  end do 

  pct_glc_mec(4,:,:) = 100. ; set type4 = 100  
  topo_glc_mec(4,:,:) = 1000. ; the mean value of type4 (1000m), meanwhile should modify another 8 types
  thck_glc_mec(4,:,:) = 1000. ; keep the same with topo_glc_mec
  
  do i = 5,9,1
      pct_glc_mec(i,:,:) = 0. 
      topo_glc_mec(i,:,:) = 1000. + 100.*(i-4) 
      thck_glc_mec(i,:,:) = 1000. + 100.*(i-4)
  end do 

; soil and plant
  soil_color   = 5  ; random in (0,20)
  organic      = 0.
  pct_pft(0,:,:) =100. ; 17 types, the sum is 100?
  do j = 1,16,1;
      pct_pft(j,:,:) = 0. 
  end do

; related to the pft, set all as 0 
  monthly_lai  = 0.
  monthly_sai  = 0.
  monthly_height_top  = 0.
  monthly_height_bot  = 0.

; set emission of isoprene 
  pct_ef1_btr  = (/0./)
  pct_ef1_fet  = (/0./)
  pct_ef1_fdt  = (/0./)
  pct_ef1_shr  = (/0./)
  pct_ef1_grs  = (/0./)
  pct_ef1_crp  = (/0./)

;  canyon_hwr   = 10^-6
; over
  ncid->LANDFRAC_PFT  = landfrac_pft
  ncid->PCT_GLACIER   = pct_glacier
  ncid->PCT_CLAY      = pct_clay
  ncid->PCT_SAND      = pct_sand
  ncid->PCT_WETLAND   = pct_wetland
  ncid->PCT_LAKE      = pct_lake
  ncid->PCT_URBAN     = pct_urban 
  ncid->PCT_GLC_MEC   = pct_glc_mec
  ncid->SOIL_COLOR    = soil_color
  ncid->TOPO_GLC_MEC  = topo_glc_mec
  ncid->THCK_GLC_MEC  = thck_glc_mec
  ncid->SOIL_COLOR    = soil_color 
  ncid->ORGANIC       = organic 
  ncid->PCT_PFT       = pct_pft
  ncid->MONTHLY_LAI   = monthly_lai
  ncid->MONTHLY_SAI   = monthly_sai
  ncid->MONTHLY_HEIGHT_TOP = monthly_height_top
  ncid->MONTHLY_HEIGHT_BOT = monthly_height_bot 
  ncid->EF1_BTR       = pct_ef1_btr
  ncid->EF1_FET       = pct_ef1_fet
  ncid->EF1_FDT       = pct_ef1_fdt 
  ncid->EF1_SHR       = pct_ef1_shr
  ncid->EF1_GRS       = pct_ef1_grs
  ncid->EF1_CRP       = pct_ef1_crp
  ncid->CANYON_HWR    = canyon_hwr

end
