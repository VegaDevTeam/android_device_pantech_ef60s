/*
   Copyright (c) 2013, The Linux Foundation. All rights reserved.

   Redistribution and use in source and binary forms, with or without
   modification, are permitted provided that the following conditions are
   met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above
      copyright notice, this list of conditions and the following
      disclaimer in the documentation and/or other materials provided
      with the distribution.
    * Neither the name of The Linux Foundation nor the names of its
      contributors may be used to endorse or promote products derived
      from this software without specific prior written permission.

   THIS SOFTWARE IS PROVIDED "AS IS" AND ANY EXPRESS OR IMPLIED
   WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
   MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT
   ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS
   BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
   CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
   SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
   BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
   WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
   OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN
   IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <cutils/log.h>

#include "vendor_init.h"
#include "property_service.h"
#include "log.h"
#include "util.h"

#include "init_msm.h"

void init_msm_properties(unsigned long msm_id, unsigned long msm_ver, char *board_type)
{
    char platform[PROP_VALUE_MAX];
    char bootloader[PROP_VALUE_MAX];
    char device[PROP_VALUE_MAX];
    char devicename[PROP_VALUE_MAX];
    int rc;
    FILE *fp = NULL;
    unsigned char tmp_buf[200];
	unsigned char sw_buf[10];
	unsigned char device_buf[10];
	int n = 0;

    UNUSED(msm_id);
    UNUSED(msm_ver);
    UNUSED(board_type);

    rc = property_get("ro.board.platform", platform);
    if (!rc || !ISMATCH(platform, ANDROID_TARGET))
        return;
        
    fp = fopen("/dev/block/platform/msm_sdcc.1/by-name/phoneinfo", "r");
    if ( fp == NULL )
    {
        ALOGD("Failed to open info for board version read");
        return -1;
    }
    else
    {
        fseek(fp,0x24,SEEK_SET);
        n = fread(device_buf, 8, 1, fp);
        device_buf[8] = '\0';
        
        fseek(fp,0x34,SEEK_SET);
        n = fread(sw_buf, 8, 1, fp);
        sw_buf[8] = '\0';
        
        fclose(fp);
    }
    
    

	sprintf(tmp_buf,"syhost/VEGA/%s:4.4.4/KTU84P/%s:user/release-keys",device_buf, sw_buf);
    property_set("ro.build.fingerprint", tmp_buf);
    property_set("ro.product.model", device_buf);
    
    if(!strncmp(device_buf, "IM-A900S", 8))
    {
    	sprintf(tmp_buf,"mk_ef60s-userdebug 4.4.4 KTU84P %s release-keys", sw_buf);
    	property_set("ro.product.device", "ef60s");
    }
    else if(!strncmp(device_buf, "IM-A900K", 8))
   	{
    	sprintf(tmp_buf,"mk_ef61k-userdebug 4.4.4 KTU84P %s release-keys", sw_buf);
    	property_set("ro.product.device", "ef61k");
    }
    else if(!strncmp(device_buf, "IM-A900L", 8))
    {
    	sprintf(tmp_buf,"mk_ef62l-userdebug 4.4.4 KTU84P %s release-keys", sw_buf);
    	property_set("ro.product.device", "ef62l");
    }
    else
    {
    	sprintf(tmp_buf,"mk_ef60s-userdebug 4.4.4 KTU84P S0223215 release-keys");
    	property_set("ro.product.device", "ef60s");
    }
    	
    property_set("ro.build.description", tmp_buf);      
}
