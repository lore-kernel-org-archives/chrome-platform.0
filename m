Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73521380FEC
	for <chrome-platform@lists.linux.dev>; Tue,  9 Jun 2026 20:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781038341; cv=none; b=ObbUvlwBc6EssjRGFLEsucgr+7Rj/p+JkJ/b2eNCtzGFXl6u9HArnHgm5JslI/Ip17+/2sQo3MUZ80CluDE/KXJpVQkx+DFDJBFkT8mtViiXyp/iTKEG5CH9omy5z1GtIdwP323JT/yKWsgyt96E7nbZPeta+yQ35XW98W3L42I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781038341; c=relaxed/simple;
	bh=QuEeBa+wbqYa0B6U12VFToTuGukpNf8dRdb/S/MFtXU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mjeYSdaeRAHql2eDWiM0i+naLNwucLjYnG6vhAN3fL+sn6euwRe0yWF5/0E0pJQX3NcV+jHAC6dW46iRYtdpG8KEqy8Ec99gwp5JoUVJqRQOwjWSMhTEdzUSn1oCNKLa+NYngUVdsqvl5QKcSQ5Q62jpe3sIN7CEFUt+hXsiAMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=USJCDwHi; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="USJCDwHi"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8423f1e2f8eso4580276b3a.1
        for <chrome-platform@lists.linux.dev>; Tue, 09 Jun 2026 13:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781038340; x=1781643140; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=loC7SSrXc6ZQAZOnLHFVy77pgXEW+A5qr9azR6ZFnAo=;
        b=USJCDwHi3kfnPPssm7rqB7Z8hE6MnpZHkKhv9p/VSOsgTbvxlvbnKQITnJYIfGmcxA
         c5de442hcvqX0JPzN6PdBNYhS3/g1KFx+rrga7RKp0qASCqgXx9NJrHfvuQ1egHlAEp9
         W/pkTV5VNs68vC+nFIex8+SM008pNcqFjmo1rMVqGMv9nfbx+0k9Ymda9PQtEtr9wTTV
         0he59/wUN593srdnJShm9t09OBakih+8MlCMBCZoHz9wkAD9v4b+rE8Mm9A3YE/txqiK
         uQRFACZevaUERQrrglxqaKlgJcqRyF4CI/uS87+nVjB0kx97b0/2nRSU5KFZGJzte/tO
         jEjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781038340; x=1781643140;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=loC7SSrXc6ZQAZOnLHFVy77pgXEW+A5qr9azR6ZFnAo=;
        b=pdSkW3wo66r0Kza/UgqHw/L2OctNOSg8GsnoGp9MMphO2EpY3xOh/OMk2ja67RtKQO
         ti9DSQxD85Vsgg7xUHBwKii4zAwy3TxCy9hhpANcAVOq6v0+D22MPuLUmrTXkLzsAoKA
         Lc1CS5ww4zn29BxXsy1wHp2rpTQ+Tro8aDV5fqc9Q77+BaGr99yvQ4dYI6n0cPn64iWT
         5ftqHuqF7GyH6DV1eQSSa+KatpNHRslJ5Bp9uPkyzAnhjJTYKXFbGqUiEsFdcfCWLgir
         fWDMWtHR0QWpwW5Y2z64YPlVlbOTBCsBXhvFcO6QQ1gfE6ju2uPC6dw7aQ8Uod3CiP2/
         1URA==
X-Forwarded-Encrypted: i=1; AFNElJ/380OiNQSb/FCpfVZzWemwVIYlorO/c7lgbBF24xdKoNpcghmzq0gVGLx9BGUoZAqL3ww0bnY2qqVGBm0M1qg=@lists.linux.dev
X-Gm-Message-State: AOJu0YwmoiMs/dEpdjWm4g1K81u1TKX2r4nR/f49KooskSh7jgftaAam
	fvvKr9R4np8hCvfbNZ1Hle7MTI0NB76hJ50aTjhM1tfLfKOKQ0UypfAM
X-Gm-Gg: Acq92OGvqlTQRU/2JPHurSzsFCPv5s/yYIPkFMylmOYHWUPo/X2fSwgFrHgKYKX09eT
	GCqMfJJmqwnrpZdX2dQ68arrNAXbvID0Zp1yLkgndPYBZvJNRh7Xz41uO8pazEqWzCnVgrA44km
	5rYjjMot1K5xuceI+P03hpCOGucA+3U8JiBnXcN/pIra2xELirsobtPEJwFmwccCZUsCblcgbv2
	j+lE/48SfGXA//bge9pg7EKIJadZqPvw6rFj8MfZ8VyIG94xCNtxrFiWOiQ876IJmWeGudNXTb0
	9g3PBPl8mS/ScAVSDJuzkV5Vw0Siqbmakm/nJ3ymF6ZeBAvRHq2a6ZyCaARnk4EvyRGIpxvshMW
	knTmTY74ayeFjWi6y8Nbuq4t2DMbkMoeBZ9AWqphy8o7Uf9qsIAjUffkBNPB8zNW7sx9sOrZKKL
	kq4hBE6NopvkMPW6u7R5XMT1HObuEZk5syEMbuZNGWztGTsng=
X-Received: by 2002:a05:6a00:813:b0:842:55b6:f5a1 with SMTP id d2e1a72fcca58-842b0d8a604mr21446917b3a.6.1781038339820;
        Tue, 09 Jun 2026 13:52:19 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282378986sm22879033b3a.22.2026.06.09.13.52.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 13:52:19 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 9 Jun 2026 13:52:18 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Benson Leung <bleung@chromium.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] hwmon: (cros_ec) Split out
 cros_ec_hwmon_get_thermal_config()
Message-ID: <2839056c-0827-42ed-9475-e84bed8d18a5@roeck-us.net>
References: <20260529-cros_ec-hwmon-fan-curve-v1-0-da6792b3830f@weissschuh.net>
 <20260529-cros_ec-hwmon-fan-curve-v1-3-da6792b3830f@weissschuh.net>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260529-cros_ec-hwmon-fan-curve-v1-3-da6792b3830f@weissschuh.net>

On Fri, May 29, 2026 at 10:31:54PM +0200, Thomas Weiﬂschuh wrote:
> Some upcoming changes require access to the raw
> 'struct ec_thermal_config'.
> 
> Split out the logic to get it from the EC into a new helper.
> 
> Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>

Applied.

Thanks,
Guenter
