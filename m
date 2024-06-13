Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EAAC12CDB1
	for <chrome-platform@lists.linux.dev>; Thu, 13 Jun 2024 17:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718301452; cv=none; b=RHeMywexf54k4IE8Sam0hRyI93spmKM6qhyFDJjQ2tE6SpVzDsO7SOkLLw7aI9RAU7EPlzvh0hVFsFPTR4WESH5mw3Nf/w4/1CA34nDqe8/UOTnKQZ16Sy7qSfC4YeZeUquVx/iLWQW1ILMED8JOqg63FD1IIG6X0qVL4NI8mxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718301452; c=relaxed/simple;
	bh=PFLKk3aAXryZqidWEktEk8zeN02Uccm+5JDsOAo/nLI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lON8G/DCFmsRqM7BC8UE+mg02f98zr4jf8BIIiV+odXr/vw6f/urlod82x28qCCm4SZAkGiweCqeRhGq9c7msvllBnxSOcNu1o9pHYGgYgC5CeKLEfL/sdlL6Z83KW5juKbYjrcWZfdPbe+D0XppccTg61AiqVrn+wuJv8UoKwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SWIDi63r; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SWIDi63r"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-42121d27861so11766185e9.0
        for <chrome-platform@lists.linux.dev>; Thu, 13 Jun 2024 10:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718301449; x=1718906249; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+B9ceKkRX5FEf0SPWBJ9Zmo8cBJbU6FE3P/v7gIVhp8=;
        b=SWIDi63rqbFnuiej3IB7UiIgWGuLmisDBuWIukX4s7D3FR9S1QwpUGhzTKPJVH5kSd
         fpgtzZM7ymvWBNEZrLjSBgAqFn3vbMf//VPSzUZTWFQOndBUSRn4YQ+6X5LPNymfu7UI
         49qRqA98YxBi8Eq8BochC39IImW1YVmfFilFhqiJKjkcAB7dCKnEwbkvalZ+/YwN+Ckp
         LvoIMIBQDazj136l1x47a3lCh/RSCcPwmCt3z974fy1zq4IwVU0OArFS4CRiwluSteX6
         35ldot5/HlFLZtcNxZjuVrU1nKq8ZTHju2q1EHZ6rpIonBSRLAQcZotNIW4/vXXPEfsm
         As3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718301449; x=1718906249;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+B9ceKkRX5FEf0SPWBJ9Zmo8cBJbU6FE3P/v7gIVhp8=;
        b=dXeykp7WTLlSpEdnBUaP4KpOdaI7K++RMpC13U5AtsOsuSBuhLpb5gp24ktXdjueK7
         Tz1xcKAKqKPlBhRZwyxj3CtxdH1QZPJcqbBX/gpd2tvLUoiEkAx4o9Md+31bIf1sa5q2
         QcTbpnaAKB6SjeUNPAFBEBfv1cGOLBBXVUt2zmhGtqi5TXKT43bl1tPmHneOmMf+ZChq
         X5LvAc1LiSu3b9rXeldE6UoOnpUbFsWjas65IYLaLhzS8xmg9F/O28trEr+xKNmZzhpJ
         /pFncjkJat0ADya2+2nM2K7/hp1qgUPujaXVUe7GM8YoH2VVQvj8vLHvtu/PiEfTWAn5
         Tc5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXvs4oOf8+rl3jvjAQ2qdOJDrMQyJocKCfLpf6ErCGaR8XM99HnCuzrBjRLvU/1CJzLspPT2/fGmmuUoWpChXI5BCmonRiVyY6mIekGOBpf
X-Gm-Message-State: AOJu0Yx7Ikqg36uc1fuMcQXM3/cjVgb3uDjccPl44Zb26po6p8/AwSlj
	E9dQB0AKpv+wn8q6jfO29Q2wXqjZH35VtASRuu+1HS8jA0uNHykNJl5v2nR3vAQ=
X-Google-Smtp-Source: AGHT+IE6dgQXoYKU9RX6h04lt2PS4y9WATyRcs6QPDW9qkl2jxho7el+sGWFqPjFFz9XqCP563H2xg==
X-Received: by 2002:a05:600c:5118:b0:421:7df5:656a with SMTP id 5b1f17b1804b1-42304825bc5mr3919925e9.18.1718301449100;
        Thu, 13 Jun 2024 10:57:29 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422874de62fsm70837495e9.38.2024.06.13.10.57.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 10:57:28 -0700 (PDT)
Date: Thu, 13 Jun 2024 20:57:24 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ben Walsh <ben@jubnut.com>
Cc: Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] platform/chrome: cros_ec_lpc: Fix error code in
 cros_ec_lpc_mec_read_bytes()
Message-ID: <3226cba0-82c5-47a3-89da-01ffa935a9dc@moroto.mountain>
References: <e0b43fb5-ecc8-4fb4-9b76-c06dea8cc4c4@moroto.mountain>
 <87sexgrdk4.fsf@jubnut.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87sexgrdk4.fsf@jubnut.com>

On Thu, Jun 13, 2024 at 05:51:39PM +0100, Ben Walsh wrote:
> 
> Thanks for fixing this! Unfortunately `in_range` returns -EINVAL if
> length == 0 (see the definition of `fwk_ec_lpc_mec_in_range`). I'm sure
> this broke something in my testing, but I can't find what it was now.

I don't think fwk_ec_lpc_mec_in_range() is upstream.  This email is the
only reference I can find to it on the internet.

> 
> My original suggestion was to add a test for "length == 0" before the
> "in_range" test, then do the test as you have done. But we decided to
> defer this to a later, separate patch.
> 
> There's also a similar "in_range" test in `fwk_ec_lpc_mec_write_bytes`.
> 
> We could:
> 
>   1. Revert this and change the `data & EC_LPC_STATUS_BUSY_MASK` to
>   `res & EC_LPC_STATUS_BUSY_MASK`. This is the same logic as before the
>   negative error code change.
> 
>   or 2. Put in a check for length == 0.
> 
>   or 3. Change the logic in `fwk_ec_lpc_mec_in_range`. Although I'm not
>   sure what the correct answer is to "zero length is in range?"
> 
> I prefer option 2. What do you think?

diff --git a/drivers/platform/chrome/cros_ec_lpc_mec.c b/drivers/platform/chrome/cros_ec_lpc_mec.c
index dfad934e65ca..9bf74656164f 100644
--- a/drivers/platform/chrome/cros_ec_lpc_mec.c
+++ b/drivers/platform/chrome/cros_ec_lpc_mec.c
@@ -94,7 +94,7 @@ static void cros_ec_lpc_mec_emi_write_address(u16 addr,
 int cros_ec_lpc_mec_in_range(unsigned int offset, unsigned int length)
 {
 	if (length == 0)
-		return -EINVAL;
+		return 0;
 
 	if (WARN_ON(mec_emi_base == 0 || mec_emi_end == 0))
 		return -EINVAL;

But I don't like how subtle that is.  Probably adding a check for
for if (length == 0) to the  to cros_ec_lpc_mec_read_bytes() seems
like the best option.  I guess option 2 is the best option.

So far as I can see this is the only caller which passes "length == 0"
is in cros_ec_cmd_xfer_lpc().

        /* Read response and update checksum */
        ret = cros_ec_lpc_ops.read(EC_LPC_ADDR_HOST_PARAM, args.data_size,
                                                           ^^^^^^^^^^^^^^^
                                   msg->data);

regards,
dan carpenter


