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
  mxsoil_color = ncid->mxsoil_color
  organic      = ncid->ORGANIC
  pct_pft      = ncid->PCT_PFT ; 17 types
  pftdata      = ncid->PFTDATA_MASK

 ; related to the pft
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
  wind_canyon = ncid->WIND_HGT_CANYON
  fmax = ncid->FMAX
 
  do lat_count = 0,95
	  do lon_count = 0,143
		  if (landfrac_pft(lat_count,lon_count) .gt. 0) then
  		  pct_glacier(lat_count,lon_count) = pct_glacier(60,140)
  			pct_wetland(lat_count,lon_count) = pct_wetland(60,140)
  			pct_lake(lat_count,lon_count)    = pct_lake(60,140)
  			pct_urban(lat_count,lon_count)   = pct_urban(60,140)

  			do i = 0,9,1;
        	pct_clay(i,lat_count,lon_count) = pct_clay(i,60,140) 
 			  end do

  			do j = 0,9,1;
        	pct_sand(j,lat_count,lon_count) = pct_sand(j,60,140) 
  			end do

  			do k = 0,16,1;
        	pct_pft(k,lat_count,lon_count) = pct_pft(k,60,140) 
  			end do
 
  			soil_color(lat_count,lon_count)  = soil_color(60,140)

  			pftdata(lat_count,lon_count)  = pftdata(60,140)
  		end if
  	end do
  end do


; related to the pft
  do i = 0,11,1;
    do j = 0,16,1;
      monthly_lai(i,:j,:,:) = monthly_lai(i,j,60,140)
      monthly_sai(i,:j,:,:) = monthly_sai(i,j,60,140)
      monthly_height_top(i,:j,:,:) = monthly_height_top(i,j,60,140)
      monthly_height_bot(i,:j,:,:) = monthly_height_bot(i,j,60,140)
    end do
  end do

  organic = (/0./)

; set emission of isoprene 
  pct_ef1_btr  = (/0./)
  pct_ef1_fet  = (/0./)
  pct_ef1_fdt  = (/0./)
  pct_ef1_shr  = (/0./)
  pct_ef1_grs  = (/0./)
  pct_ef1_crp  = (/0./)

  canyon_hwr   = (/canyon_hwr(60,140)/)
  wind_canyon  = (/wind_canyon(60,140)/)
  fmax         = (/fmax(60,140)/)


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
  ncid->PFTDATA_MASK  = pftdata
  ncid->mxsoil_color  = mxsoil_color
  ncid->WIND_HGT_CANYON  = wind_canyon
  ncid->FMAX          = fmax
  ncid->CANYON_HWR    = canyon_hwr

end
