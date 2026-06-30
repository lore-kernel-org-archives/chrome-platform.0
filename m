Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A321F265CC2
	for <chrome-platform@lists.linux.dev>; Tue, 30 Jun 2026 23:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782860769; cv=none; b=UgXKA9XTsD56Da8KBJWxytFHBZVsmyznbpq7AlZeOblX/kNXMw1mUkfs4Y11DRodW7bVQs7sbUhqACeM8WVyXrkVSAymkvRmfUebw0GRYbqMwGlBwTkhvl55aUOhHUu3KNBjD8MYGOndMxsGEYBlL1Y19SSrmwyg/c6/j4JFoD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782860769; c=relaxed/simple;
	bh=IsZwp35EedEaM07un11NWQRt+bEfpMRu0fbCxkyiKwg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f2hQMvs9cgrwjDdDRT9xI+nhF1dk/nYOrm/jgK9HQs0ZY9Zjbd3GgSC5Kx0xZllMjLSBVpWHFUxdg4y+OMOp9R+PniAdwhcfV9lonPisPv2ILqcG1eJF5pogOQaCKHQi+EBgNK4pRATjF577vZdnric7NJ6jUCJO1gIgsvuYhXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sKOUVCPD; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sKOUVCPD"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2c9b42be8feso444225ad.2
        for <chrome-platform@lists.linux.dev>; Tue, 30 Jun 2026 16:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782860767; x=1783465567; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BQPuioQimwYYgTNp3DL8RtbodfRRXz0tk7e95i9BfrE=;
        b=sKOUVCPDMuthgekXzJ9Tkx53GVwAuo1dlb7wYr4ykQlEFdd0EFXoFQIZyjcIGPF5jD
         Jo2klCmZsL27zR9uYUv/Snbb+J9qXWJWQokT8mUwR7rYE1T5ja+aGkmNFp/V9u5WErG2
         WF9sabELVmESGI1iXMWKoafZzS3mm5yA3P5VMvA/kbA9pYYMYUUUByFOBEzY5ddqRvbq
         N8DKBsxSKBwPpV7+Pistj0DyrmE05iabnS4fhjSziJo6yRvCuDD0RD1vyjrlBOWYzs+l
         cH/CDUL6ZaMuOQ9gUOvy28WCgj3Xuc3degFXGTU0W3mIa90qfnvPQnoWPfJhjxbBAHwX
         uR8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782860767; x=1783465567;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BQPuioQimwYYgTNp3DL8RtbodfRRXz0tk7e95i9BfrE=;
        b=pawDVp2501pVlbSVwMfKLyn+WSD6QB13aGr+b9Di8w/qcCUgFo8cMRx2fKfvyipaGL
         LRlpbqyAd0E0WhbNT3YUPi8FxgUQNnHwvhaz7KwbLxDny8QVhm57yCMo3dEmaoslxi3o
         BBgEguw29ppDQtGyK0/1VFD9IetNdzjcmjd0BdL2MDhwytQGZqwePoEnCpCTFf2EQpdW
         oBs9e1HdvOnshApgXTUEkFpbDrDJeCopwVi+G5/Xwc4dxTe37A0whhpAYRM7ZiJmF5ar
         YRtFoB4B1DSyx8IDz3SmhCsDHigytCOdMYKUlv0Ksz4D2/UsLwUtkM0e4rPifFzp4xd5
         wrmg==
X-Forwarded-Encrypted: i=1; AHgh+Rr2M72pZxqroX9wjkM+Hq2rpJymWH2jp78XIneWtfz33LgnyTZ4q5C3dKmXioI/umniBvBAkEJL6naRkXZoZlg=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxx3tUFC7pOXf8q6G7aBGYD2Asw6BfVWzcrlSDnayjlrUehnW0G
	oCiJsiYyZtmXrSAnUblix4iSNiFrbeFsRSkzLMxRM8cSDC47M+esbV2w
X-Gm-Gg: AfdE7ckk+CeYS5km41bofzLyjw1uSmSXQ/+lEYEOWK+5bKWa/tpZV3eT+mRJ1h7St23
	KQBQydB19xHpIscQOF1otjTJG+qjZekS2vXtATOYoNagwITYse1iCPMoxxcPAbB2K4OHwiE+F0J
	/a++ne3Pv7HxBbY9KWDbIfQRrpJruxfPtsWVk2Ys4vg1XIChiR8mwCraeUucm+AasMQUMLBg2DC
	lvIvTfy5f1mE0n64Dsj7SDKDuY9fQHsm39DbOxjeH4MB6yDy9K2VVceXiGU6fe0Oa49CeXARxGZ
	2pqQRo0r/cTuyEyJBSecxsfnPN5Hpq+2xoHlibmt12oXkTfigfLSucHpPXHaRzEE+Mtb1/CROhJ
	E5pT9FjIKfODWZ3bICkgsO7YCwfUYK1oKFUlrgDATgVyhVUI9LwhYXe0ak86iBsVoARM9wbztPB
	JZIfEv6EgMgUqBcghLHIAUeYb5kA==
X-Received: by 2002:a17:902:e5d1:b0:2c9:dc38:3ec7 with SMTP id d9443c01a7336-2ca2e7143e9mr45334295ad.29.1782860766844;
        Tue, 30 Jun 2026 16:06:06 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca37c90548sm22475055ad.36.2026.06.30.16.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 16:06:06 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 30 Jun 2026 16:06:04 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] hwmon: (cros_ec) Handle temperature conversion
 overflows
Message-ID: <7b5145a6-7054-40c7-af49-1f2415d1b83f@roeck-us.net>
References: <20260630-cros_ec-hwmon-overflow-v1-0-3d2ecd3eb0f2@weissschuh.net>
 <20260630-cros_ec-hwmon-overflow-v1-2-3d2ecd3eb0f2@weissschuh.net>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260630-cros_ec-hwmon-overflow-v1-2-3d2ecd3eb0f2@weissschuh.net>

On Tue, Jun 30, 2026 at 10:57:52PM +0200, Thomas Weißschuh wrote:
> The calculations converting between the different temperature units can
> overflow, resulting in incorrect data.
> 
> Detect these overflows and report them.
> 

I did not see how this can happen in practice, so I asked an AI agent.
Its response is below.

Given that, I am not going to apply this patch. I am all for checking
against overflows, but only if they are real.

Guenter

---
Yes, an overflow is possible, but only on 32-bit architectures.
  
  Here is the breakdown of why this happens and its limitations:
  
  ### 1.  cros_ec_hwmon_read_temp_threshold 
  
  The function  cros_ec_hwmon_read_temp_threshold  populates the  threshold  variable using  resp.temp_host[threshold] , which is an array of  uint32_t .
  
  In  cros_ec_hwmon_read , this  u32  threshold is passed to the conversion function which takes a  long t :
  
    static bool cros_ec_hwmon_kelvin_to_millicelsius_overflow(long t, long *ret)
    
  • On a 32-bit system:  long  is a 32-bit signed integer with a maximum value of  2,147,483,647 . If the EC hardware returns a bogus or uninitialized positive  u32  value (e.g.,  3,000,000 ), the
  multiplication  t * MILLIDEGREE_PER_DEGREE  ( 3,000,000 * 1000 = 3,000,000,000 ) will exceed  LONG_MAX  and cause a signed integer overflow.                                                           
  • On a 64-bit system:  long  is a 64-bit integer. The maximum possible  u32  value multiplied by  1000  is  4,294,967,295,000 , which comfortably fits within the 64-bit limit of  9.22 x 10^18 . An
  overflow here is mathematically impossible.                                                                                                                                                            
  
  ### 2. A Quirky Edge Case on 32-bit
  
  If the EC returns a standard error state like  0xFFFFFFFF , the implicit cast from  u32 threshold  to  long t  on a 32-bit system will result in  t = -1 .
  Interestingly, the new  check_mul_overflow(-1, 1000, ret)  check will not trigger, because  -1000  fits perfectly inside a 32-bit  long . Instead, it will silently return a bogus value of  -274000 
  (which corresponds to -274°C). The patch does not actually prevent this specific "incorrect data" case.                                                                                                
  
  ### 3.  cros_ec_hwmon_temp_to_millicelsius 
  
  For the standard temperature readings (where  temp  is a  u8 ), an overflow is impossible on all architectures.
  The maximum value of  u8  is 255. When the offset of 200 is added, the maximum base is 455. Multiplying  455 * 1000  is  455,000 , which easily fits in a 32-bit (and even 16-bit) integer. The patch
  author is clearly aware of this, which is why the patch asserts its impossibility via  BUILD_BUG() :                                                                                                   
  
        if (check_add_overflow(temp, EC_TEMP_SENSOR_OFFSET, &ret))
            BUILD_BUG();
    
        if (cros_ec_hwmon_kelvin_to_millicelsius_overflow(ret, &ret))
            BUILD_BUG();
    
  ### Conclusion
  
  The patch's claim that calculations "can overflow" is accurate, but the scope of the fix is limited strictly to threshold registers running on 32-bit systems, and it will still emit bogus negative
  temperatures for unsigned integer values larger than  LONG_MAX  (such as  0xFFFFFFFF ).
