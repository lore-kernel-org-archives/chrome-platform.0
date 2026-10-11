Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07EE8366057
	for <chrome-platform@lists.linux.dev>; Sun, 11 Oct 2026 17:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791739007; cv=none; b=gg5aecWdp1OEnMVd0gLRxiSeKkwDJSjsf0AY7ES3pjWON1QA9g5IKwtUw5B8LK8/V6SM65Fm8jTWxNB9DOk8D55X6c9IDzgJi3Z3FRnTIIB8En03t08dmW3am+2WcB2zW5HkOETZF9oIxcbaZ1I3gJiethJqlpHUhmk8V3GS12w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791739007; c=relaxed/simple;
	bh=GutEjz1C9EWnoIl6DZVss5kOvzanuED5c0ZSkttT+r0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gylmMLfkqXJtFxm2CiaZiuwOkGCLpA95ThudwOHyyVf7kypnRwTZJsbQZPNYTgMz0V7Q7hLi4E16/ySRH0mGP6lPBDzPLHq08KemQEVVTULEN8kybpSipYuH7edlFsxwqELlo2+8gT/6KgWQ3u+KTSGQoSBmnmQhMIacGQDGWBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RyV9U3wI; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RyV9U3wI"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49fbb2acc90so8202725e9.2
        for <chrome-platform@lists.linux.dev>; Sun, 11 Oct 2026 10:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791739003; x=1792343803; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SeRVsGAgfFwaEGdER3bktn7qvFdW9fiMwJGb7FgMong=;
        b=RyV9U3wIuHLsEXx246oPMMohsXPf2QDOvEM+GGZrROrHpbeW9G1406LlE/jEnTvCKv
         uIG+xXU2s/+qqZtjSO6sQW19XepGG6wV/FULULFTDMgMq1P28lltFj6LlKJvL7J3t59w
         1LomO6CTUr9DCBnijMJBjUhwwOhAMubF2/lpNCh9v3QEmnROlLo1VyE4X4qAoADZNDvc
         UfHeSEpQdEBun3OtnEtXqXH874vw5XSF9VDF0d54bsUxCE6suHXctYDionKueKRmuhv4
         //fepde3bUN0hXd6WKDhMx0fXVcpiBxtjW9S/rPOGwqwUDDoFtoRBerxwwvmlcsVVMeV
         LPLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791739003; x=1792343803;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SeRVsGAgfFwaEGdER3bktn7qvFdW9fiMwJGb7FgMong=;
        b=N1NlrPLvyvGU3SprEKCC3EF6Rfc0c8neMCmIDijENPwuWJImnWeSP6nPnDh51MPXLM
         SQgxtRVB+qfn2F4FaU1kL5eAf6o0x3xWu9VxJSgSQ80YrcldkQ8iX9N/Gpin/kB1l0Xu
         lTOzYjW8stJ6ozq4ZKJp5mjSdmFhB+Jz1bM0LmFuYlHgiAATb+Q31iYgYORtbHNr5Crk
         lNm6oc/cfYW4YOib40Co6WljHP2jbVbTBfic6kBzULUQc3bmT/mY8f4JEZPHxR9LczUa
         Jo6Nc3PFTw1TiCgTi1B7TJE36B3YQpYrqVzUstnYm1BdnGwnU+psY+xy2eaP79H0OcpF
         /DAQ==
X-Forwarded-Encrypted: i=1; AKwUvBymV4faJhy5e1h18o9c7pWyAQIAd2RxWNj6MmB97eWdX8kBGTfz4h1IzRVW89/v0E+FTbhRq9z0dvSNbR8xiZY=@lists.linux.dev
X-Gm-Message-State: AFq9FYK6WxtqW0C3PKaqx9ZIVTGgIzi7PZroyM0zgCnpdRzyjvjUOUBa
	uCroJbBSXJxFdrvtVdNAo10oMO0o+ipCfpcx+g2gIazJrlKylpInQBHz
X-Gm-Gg: AYBFou3XJ0rDDDoKcEZ8GJdOf4AqF5nKePMORzAeO9lAya2oPti/F0up8HqxgI4RMuu
	h+IjmhC2r8LckgS60hfaQn8gJ89yFbcEB6I0WX43QN7BVKqz0CPnQ53Gn/KcW3NXtkGwAdvvjbf
	eHwPYLGXW++TbC/hk4NfqDSrg6eaz6DT3lB3SD8yIiwQmUWmQYsqWS04x5LT/HpBnN35VNi/FcX
	+bsiPD3YfyIDqEqoJ9amt6Y6bvasAaNJZExJUnLVt0xcHc5WyLhYcoV93DC7X89kKvwgCQB7z6S
	ibJrRa/ha/g9BaXUuEqia7mibk5EYhwap0+GJ1t+71wt05eQsxrCeqfjNT+LnZ/kfC8rGdWa8w2
	fNPls6BkIt6TakKlEdM5Eh9AwMF+1OrKRINU+TH85RT3hxvw0VEa1bBQ2uJAQjNgVUhCd4z+Zuk
	x+XPAOBvV1KyjvBZjvuTBuYqmRNuynmJRkO5Shw9XD1syxaexrw+dyzUlfvdf4czKfBuq0FOLZV
	ZD6lCxhPKVULbcYkDAn11Tjd01/2i1Ka5ZC6JRzvL367CXjH8PcV7/1mIn0X2UHSCWml85VP+B+
	c0EsZpbYfVshRN/iuTJeqW6raVECeIRw0nkCbT8AjVZzSWurB3j4tQrnVFEs1LlhYuKkOli+6+q
	fnVLpg1UuEW3C2fmqQPNoa/cPcPst9Fus
X-Received: by 2002:a05:600c:8b04:b0:4a0:1e37:ae41 with SMTP id 5b1f17b1804b1-4a18e4d67edmr132564595e9.24.1791739003092;
        Sun, 11 Oct 2026 10:16:43 -0700 (PDT)
Received: from systembl0wer ([2a02:8308:4092:11f0::f9f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1972eaed8sm115349595e9.1.2026.10.11.10.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 10:16:42 -0700 (PDT)
Date: Sun, 11 Oct 2026 19:16:41 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Arnav Kapoor <kapoorarnav43@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Benson Leung <bleung@chromium.org>,
 Guenter Roeck <groeck@chromium.org>, David Lechner <dlechner@baylibre.com>,
 Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko
 <andy@kernel.org>, chrome-platform@lists.linux.dev,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iio: common: cros_ec_sensors: use sensor_scale union
 member for CALIBSCALE
Message-ID: <20261011191641.4e9e2ac4@systembl0wer>
In-Reply-To: <20261011045410.356156-1-kapoorarnav43@gmail.com>
References: <20261011045410.356156-1-kapoorarnav43@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 11 Oct 2026 10:24:08 +0530
Arnav Kapoor <kapoorarnav43@gmail.com> wrote:

> The IIO_CHAN_INFO_CALIBSCALE read and write paths send
> MOTIONSENSE_CMD_SENSOR_SCALE, but set the flags through the
> sensor_offset member of the request union, while the scale values in
> the write path are filled through sensor_scale.
> 
> This only works because the sensor_offset and sensor_scale structs of
> struct ec_params_motion_sense happen to place flags at the same offset.
> Use the sensor_scale member that matches the command, so all fields of
> the request are set through the same struct.
> 
> No functional change.
> 
> Assisted-by: LLM
> Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
> ---

Please add a Fixes tag. Otherwise looks good to me!

Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>

-- 
Kind regards,
Joshua Crofts
