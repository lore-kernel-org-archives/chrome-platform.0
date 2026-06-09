Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C398331EAF
	for <chrome-platform@lists.linux.dev>; Tue,  9 Jun 2026 20:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781038260; cv=none; b=qLQu6hcxldQBYJKmlTOyG7ekvy6TtqyQmv+HLbVuJKskLJOcI5bodHTJSjLyP4B+vlUE+5+EVGdGDYJJkUcXYEv5ZFeSXJAVJfjPleK56CvO5feqKQ07ybRIQrScbJWaJpEh75M9EB8S4EB87sNLAhbR0SsMY32hud/EjJ3y+E8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781038260; c=relaxed/simple;
	bh=ytyM0ohCPscKcRAsiqq6VTb2bKPUXGBz7fqKl3AsXAY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FjziCX/SG4TPBeVPVKNVNDzS9JPALjmKTMIFufkYrxa+uExlaIrqkhi9kzRtJexgfAsO6RQLeGAwFJ6vYUDJrXNiUxbUZzKzZtmw/kPdIEGeubdMNd0/ZR1U8AT2uwxFaxRhmRYW69vwAujlYgnh3Q0FJ+PMyI3H8fb4y6XFaZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LY6HyniQ; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LY6HyniQ"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-36dac5d5d05so3259343a91.2
        for <chrome-platform@lists.linux.dev>; Tue, 09 Jun 2026 13:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781038259; x=1781643059; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9wsVO7WJMT3aLMJb2s6cZ2xInbAc2bWqJEVVcktReD4=;
        b=LY6HyniQCsaUwaLLRBYczKafbBM3Up/q9CXJXGU7tb51sOdO7Bjrl28EsgHasUDZlT
         gRJObMlitviF538wAw1Z01/E3TdRzM2Rw8bC1NA6TURIeWNgrmf6mcfpBN2sF0esNpmc
         lQZCCVTyok+8luJW7ZDGSBjQfh0RUq2wmbAj7pT05lVvL8JLQEVoRBQtPZlZfaZnk1JD
         pmEVtRrkie9FBs8XhiAFnYt7ovQocR9aNGZrkLRYnWPHB6Xv1noiunjLbfwy+tZuYkbk
         oP4AH0/766dhb40AZ9dGDwP7c8c4G7FS4m+t3nbOeZlbLn9rEWeStAt5qsDhCW1AomfW
         A2yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781038259; x=1781643059;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9wsVO7WJMT3aLMJb2s6cZ2xInbAc2bWqJEVVcktReD4=;
        b=BzBDXTFM4BEr8XnX59tNq2WrgofbonHj2w6FhBIkgjWtnQpjLLqbmKImQEcAxvxnVi
         RRBr6loz/a3ZOBX4/LRo5tdURmZ6Z7tOX9r+1fEu0Z8HHIGe7ZBy6ceE7ebWeB8Q6w6c
         ENgkWDLGtCDx7x5gj6m/ZIfS60dhYw0/S/9kDonB97Iwe2BEAsNV7hsobJRMmHKhC/fA
         j0d5KrvqQ5qHucQ5LoqtH20BNV4TNXnPRdS2EOlyDbUOpIt2W8+pTmdxeyWuDItp3pwi
         FdnHAKJ6aa6wntNzYSajLavaznFRiFHG5nQc6XSexjYF6N7f4GTn6GrwNR41AN/Ao7cL
         tFCQ==
X-Forwarded-Encrypted: i=1; AFNElJ8XZj49bHIstJ5dghacOKkTrpzON9T7h0tl/EZsjA9gKm8rPAePxTbsdGPNkjukQTdhOedcg2/PkJVIDrE+NgE=@lists.linux.dev
X-Gm-Message-State: AOJu0YzdWXT5T5wBNKMSGl6TRfuePPE44h+FnEBrTDFjAsMaZPuGqVRA
	Nq22GKGvgaCAi9omiXElung3MFtGzRvJAUuIWw4/PuGxyFZtsm+kWI5t
X-Gm-Gg: Acq92OEPi8wIaDXoscsqE51NAJWuu4/yzzOphS8UJTUpbyuD10p5pAkKFTo9J4xKBAX
	3abnjdckrkSKOJSoofQ4OSwfQQPw8hcy3CeF4gZUV1XnrN0SNf3u7HKVFajPXxP+KWVH19FYS3k
	9l67+2u8XFg9kQM5Ff1zEWCMY3AtsmZtUr+Q9jKg13iBhQ+mCxO4bJhHfAD7yMYg6P4S7lpRMhN
	UKPg51yjgPFhvYHyrrOhtQkg9lmrRaHqgCxsuUeNV70mitTLWc49AS7xBCnt8M+SJKxZsDnJrPr
	dbYYoSdl5XynXr7mJ/cDnMURaoGG/0QjPYEpxkcT+bSXLq1T+kTkkOXa1dPsQ1IwoXBQnyZGZ8u
	dS7hYOVD/qtf9X07Q/RQY+fFvLDNhTvbUI/OZab37+HSRNzFSas9OSrfSHGUXct7ckdYfxAzAwr
	UHiK33Zp+s/ufUaP8wiWDudgocxeg1U1WlQSmJrxEujjDVFdA=
X-Received: by 2002:a17:90b:580e:b0:36c:e254:4db with SMTP id 98e67ed59e1d1-370ee544633mr22312274a91.6.1781038258678;
        Tue, 09 Jun 2026 13:50:58 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37625ecfe47sm194958a91.0.2026.06.09.13.50.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 13:50:58 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 9 Jun 2026 13:50:57 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Benson Leung <bleung@chromium.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] hwmon: (cros_ec) Implement custom kelvin to celsius
 conversions
Message-ID: <6b3d438e-ba7b-40c0-8fd7-7e6eb1708a90@roeck-us.net>
References: <20260529-cros_ec-hwmon-fan-curve-v1-0-da6792b3830f@weissschuh.net>
 <20260529-cros_ec-hwmon-fan-curve-v1-1-da6792b3830f@weissschuh.net>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260529-cros_ec-hwmon-fan-curve-v1-1-da6792b3830f@weissschuh.net>

On Fri, May 29, 2026 at 10:31:52PM +0200, Thomas Weiﬂschuh wrote:
> The ChromeOS EC APIs use integers representing degrees kelvin for
> temperatures. The default conversions from linux/units.h will then
> always convert these integer degrees celsius with a 150 millidegree
> offset. This is a bit confusing, as it also differs from other CrOS EC
> tooling. Internally the EC uses a kelvin to celsius offset of a round
> 273, so the current conversion is also not entirely accurate.
> 
> Implement a custom conversion which preserves round values.
> 
> Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>

Applied.

Thanks,
Guenter
