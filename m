Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B3441A9F82
	for <chrome-platform@lists.linux.dev>; Tue, 27 Jan 2026 00:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769473502; cv=none; b=mSszNFl0Rlduf6yAYwtndE7r5oykCGPE2etd5odAOFSHBHhfuo+W6McM+vbUbl2MmTAmm2KQjthcbNuP4+VtQ2LI7PfRDW2fDgmKMcQz19IR0RTrj1PDAvy4hkDp/l7yO03A530UJuLdoFeBdWOLh1aMeBdrGxBw4MOSBtH8s5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769473502; c=relaxed/simple;
	bh=rmQIko+hNFaIJSkG88eILSSlkJFZkBF7X5UpMK5l3Yc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mz4F+SqDnafKXhu7PLj9hFdO9AR+QbmW9y6+ICtxHcXcuu3osK7ZRDumEwZAYSd/m87dlmUbthy/3f4zp0jQ50q/iuF7x1y8pc46/P92K6gwRF32K1HxpbFsh97t2/wGZ2sHUULgbCj6FT1Y8qLQ91jpCHZowJiUUKzu0zOE0ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CH3xc+jN; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CH3xc+jN"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-81ed3e6b8e3so2405186b3a.2
        for <chrome-platform@lists.linux.dev>; Mon, 26 Jan 2026 16:25:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769473500; x=1770078300; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=62rwDCz8UGjVLmBZhM+IIc4DKJxP95Zzwu51NkV7SQs=;
        b=CH3xc+jNmzsrpOyK+l2BYrx9i1+7Aia8LCMO4mEFPE2UFK2Ud+BYIzaI+T3f5rLWKV
         Tr6DNZFu8o8b/ZyH9jasnkPC5duESzYwcrrFcW81Z/TN8aJ19kwezlh9T0xhVrXPmwL5
         uQlVGyzhnHI4iE6dwiwcfQf5+reFKN5x9ulEivVC1ydiu9FQ1+rXYgU8M7bo4siwE6gD
         X0dkKatQCLs/hlwfCXffijBUMJ9+Ke5gIfHyzkh2S54DjxI4tLNV4Ea8tuvOw3X0eC4b
         dwQuavdRwYaE1ClFezMbXf4WhxyT6Is2ERzB7DSA2HdTOVsS418oclc3eH9ByUsYAmdY
         LDWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769473500; x=1770078300;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=62rwDCz8UGjVLmBZhM+IIc4DKJxP95Zzwu51NkV7SQs=;
        b=oFMQgB5nLec4Vy2voSl13v7PfQb4cp91yxSbzYchGL1cf/juYG5FfvimUqVgzujsSO
         IgStCcN0rBYH1Y+QVS0EiLEiK1yZY6KNQghctk4OITr03ci/LyJ5MP/P3kKZ8sFWsEPK
         YOMzGZi3DEMudXGrCnfuXIjCp4TTpSgoBLcoEMM6bF7su/wsSRaN5v2x7/R65Vaz+DAk
         ph/K0lMqrrc9iDYUYjKC4NsJmkWU/JYbO5XzmkixrKRjHRO+gQuIavY7cijy0WZlzBeh
         6V2yZd331ozAHVMFhJvf3Z+ROV3T6rKnBEfldXsKUQxh44I2YA3szzFbuXejZ4cRMJA3
         QVng==
X-Forwarded-Encrypted: i=1; AJvYcCWtIVf31kGWbYHx2NNm4xuuemJxEsaYyIeuMFQeTj+F/OEBROFNf6cRDAwdpaK5z1y+zcgG3KqFFCdDaI72alA=@lists.linux.dev
X-Gm-Message-State: AOJu0YyFsYkQYDiUgfqM9NF3PFdiR2OzEepdf0cTjKaRhTwzSoCZfvmt
	DvH1jaE40cTZJpgKxux0AsY/54E2BlLLuiSOecaVRFRhGNWtK12nMS1d
X-Gm-Gg: AZuq6aKlWu+rLUggmnjW63nXAyZO35r21PBkqyThYw52Jynelv+BIdHvBLVecOYHusr
	lDqF4VFRmZbcZOpkd+6By2BOWShPRkfuW0JVUZnUygE0tzi6octRcbUoBNfgJ5t/jC+0hF1SNkn
	dMMUwOXZAYwpTV76sYV3mi5B5FxTp0dMelXG+TantmtTQ6PdoGm20iQswnLqyPjmhbZRJdyqUWh
	ax49YVDv5adkmflBDCycqm/v8y1KXzoLyz4IS59c+Hh25qf7GCHqVC0gxDTSw7uzP4RKxBeqUcK
	EDSPvxD+OakFIDJEeHREOkVN4ytgQHUW1gz45tISmMSnIhkkEV5XkiSJ0K40L3fopy98vnqDp/0
	bNH8OM5pi/arcARbd6qAgBhRfMipoK6ktECq0Pkx72h0vfEYPN2ssVBBw0sDpooqtN07Qxfeo8A
	GGjJ/Y+ziNTkvvI5qbPL/vHzpILr2C9xT9ylI=
X-Received: by 2002:a05:6a20:2443:b0:387:5daf:b310 with SMTP id adf61e73a8af0-38e9f2569d0mr4995496637.74.1769473500232;
        Mon, 26 Jan 2026 16:25:00 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c635a142e5asm9250970a12.12.2026.01.26.16.24.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 16:24:59 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 26 Jan 2026 16:24:59 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas@weissschuh.net>,
	Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	Dustin Howett <dustin@howett.net>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Stephen Horvath <s.horvath@outlook.com.au>,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, Sung-Chi Li <lschyi@chromium.org>,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 3/4] hwmon: (cros_ec) Move temperature channel params
 to a macro
Message-ID: <5d540b6c-1c7c-45d6-bc72-b6b1bc3a4b9c@roeck-us.net>
References: <20260118-cros_ec-hwmon-pwm-v2-0-77eb1709b031@weissschuh.net>
 <20260118-cros_ec-hwmon-pwm-v2-3-77eb1709b031@weissschuh.net>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260118-cros_ec-hwmon-pwm-v2-3-77eb1709b031@weissschuh.net>

On Sun, Jan 18, 2026 at 10:45:57AM +0100, Thomas Weiﬂschuh wrote:
> An upcoming change will add more channel parameters.
> This leads to a lot of churn and very long lines.
> 
> Use a macro to encapsulate all of the shared values.
> 
> Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>
> Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>

Applied.

Thanks,
Guenter
