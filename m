Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17BA4F9FE
	for <chrome-platform@lists.linux.dev>; Sun, 15 Sep 2024 09:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726393618; cv=none; b=FvTfrZvNDJu2v7Ke7KMVqKR3pmajkmVEllS5go/NHuY02Zu3PcS0P7UPOopBMLn6GD+MpDaUicHJTPJ69oUA7ltbLN23YDP1PBeAzfBWtbISB0rxPTCJb6pO0miYypXFBg088XA4wcXg4Irrwhnh6gjRXSdX4RR6l71vJp/jHwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726393618; c=relaxed/simple;
	bh=2zO6QidvNsxqVUMyd2vfM3SZsN4IHGWxXREhRe7GB2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nM4wQzKouuPD/1PYhfkAY/cDdROH5UMcyMoty9YXXoX3oKBLU3q1TEk8qoTc/SGHNjQte3WDh9KlAKsh8s98FEuRW/ClYWnUc88olbuUj65XD5xTa2i/whqY38LOBnOEQMDUDHTKypVpiLzx0bCGvmy8bxFd9ssmt330JRvVAPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ceCR+xjm; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ceCR+xjm"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2f758f84dfbso28974511fa.0
        for <chrome-platform@lists.linux.dev>; Sun, 15 Sep 2024 02:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726393615; x=1726998415; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SEy2s6mdbEvETGfBs4ih+7MAVHb2th2MzF/jMUC7wo8=;
        b=ceCR+xjmplpxA/um+unE1MFvLUeqD89L6XZRAPYmXeOXFQ/zN+xIosAOSPEoLMnTui
         8Xsy51vCSB+JUojMkVf1jTN1csDTVMHTqMLbAFjArYHfhCsP1WmZbafemTjCOUWE3mZY
         TWADn5luU39bCCK4YZdNBFwjdpEQVHnldKru5HDldeqwQSDBM+q6fOklfXG6gUOX+gVH
         mOCEb8JOUjsaqQV9w446OwJt/s/f1PXGzVIzX/keQ9G8gxqDOpW0Th0FjL+Qo2g8vcIM
         iIS+wD7cdSW/7907hvym3EWvwQoikr7WbHAZ7q8Lmo/kPBYXkDPGlscXuxJ9weHKotOu
         106A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726393615; x=1726998415;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SEy2s6mdbEvETGfBs4ih+7MAVHb2th2MzF/jMUC7wo8=;
        b=gHFqMUWxSZ5ePmy3xmqugyqBtx6PG89BcH3fSgjQMtVafqnD2B23DNkdEd9f/y7d+/
         JGYymCZDuCWWlaTCJsy0XWbKt+STbbNrUg7mLAWpyahh7kWxxmJFUJP9ibk/cjKi6d1c
         huDGt17lloEQCeFcuXgUBdzQJM0VdtpN0KXB5qfeYygQwvNjesXm2+a7kSHUNNK1sRg7
         +UqOPMc1MQBdDcFODKno+EIyBG53BeEW8Qz1bGl/ngVYsP54H1ulgjSBbMpnhHQ9csY6
         qT9zD8lXzmDur165h6tsN7U5hpa0QfCzNkNpMGiSiOPCnRDjkCNR+4otvzFwm6n/tTwx
         mYDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVciiRaZIJgFWmcAoen95Gc7dKoC8qDijyaJMrV2K5Uw3wPHeImOuuHuFG4YAI6B9+u0yTWjreq9YQY6NWjpAc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx3O8vTIl6J0dEcJh+ex5dgLr8x7NgcZp7Qh7Lu+sdp0aO5IEKN
	ywD0MRl+XYGsQ0QySRmgGiZKXJixYabv3EJwEap0pZZdWzme4OYq
X-Google-Smtp-Source: AGHT+IEEqRu62KpQRhPXfLbt6VDlSqGvXS4SEhyoRi7eANQzGYsSen3MDKGTeAvoXvpSJFNvO09jJA==
X-Received: by 2002:a2e:9003:0:b0:2f5:806:5d00 with SMTP id 38308e7fff4ca-2f787f3b98bmr48952041fa.32.1726393613881;
        Sun, 15 Sep 2024 02:46:53 -0700 (PDT)
Received: from localhost ([94.19.228.143])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f79d300851sm4873921fa.47.2024.09.15.02.46.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Sep 2024 02:46:53 -0700 (PDT)
Date: Sun, 15 Sep 2024 12:46:52 +0300
From: Andrey Skvortsov <andrej.skvortzov@gmail.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>, Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH v7 08/10] i2c: of-prober: Add GPIO support to simple
 helpers
Message-ID: <ZuatDOocfDumBzE_@skv.local>
Mail-Followup-To: Andrey Skvortsov <andrej.skvortzov@gmail.com>,
	Chen-Yu Tsai <wenst@chromium.org>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>, Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org
References: <20240911072751.365361-1-wenst@chromium.org>
 <20240911072751.365361-9-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240911072751.365361-9-wenst@chromium.org>

Hi,

On 24-09-11 15:27, Chen-Yu Tsai wrote:
> Add GPIO support to the simple helpers for the I2C OF component prober.
> Components that the prober intends to probe likely require their
> regulator supplies be enabled, and GPIOs be toggled to enable them or
> bring them out of reset before they will respond to probe attempts.
> Regulator supplies were handled in the previous patch.
> 
> The assumption is that the same class of components to be probed are
> always connected in the same fashion with the same regulator supply
> and GPIO. The names may vary due to binding differences, but the
> physical layout does not change.
> 
> This supports at most one GPIO pin. The user must specify the GPIO name,
> the polarity, and the amount of time to wait after the GPIO is toggled.
> Devices with more than one GPIO pin likely require specific power
> sequencing beyond what generic code can easily support.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

> diff --git a/include/linux/i2c-of-prober.h b/include/linux/i2c-of-prober.h
> index 541451fbf58d..c5e241163c94 100644
> --- a/include/linux/i2c-of-prober.h
> +++ b/include/linux/i2c-of-prober.h
> @@ -83,6 +83,7 @@ int i2c_of_probe_component(struct device *dev, const struct i2c_of_probe_cfg *cf
>   *
>   * The following helpers are provided:
>   * * i2c_of_probe_simple_get_res()
> + * * i2c_of_probe_simple_free_res_early()
>   * * i2c_of_probe_simple_free_res_late()
>   * * i2c_of_probe_simple_enable()
>   * * i2c_of_probe_simple_cleanup()
> @@ -92,24 +93,33 @@ int i2c_of_probe_component(struct device *dev, const struct i2c_of_probe_cfg *cf
>   * struct i2c_of_probe_simple_opts - Options for simple I2C component prober callbacks
>   * @res_node_compatible: Compatible string of device node to retrieve resources from.
>   * @supply_name: Name of regulator supply.
> + * @gpio_name: Name of GPIO.
>   * @post_power_on_delay_ms: Delay in ms after regulators are powered on. Passed to msleep().
> + * @post_reset_deassert_delay_ms: Delay in ms after GPIOs are set. Passed to msleep().
> + * @gpio_high_to_enable: %true if GPIO should be set to electrical high to enable component.
>   */
>  struct i2c_of_probe_simple_opts {
>  	const char *res_node_compatible;
>  	const char *supply_name;
> +	const char *gpio_name;
>  	unsigned int post_power_on_delay_ms;
> +	unsigned int post_reset_deassert_delay_ms;
> +	bool gpio_high_to_enable;

Missing '#include <linux/types.h>', otherwise compiler complains
about unknown bool type, when 'i2c-of-prober.h' included without any
previous includes.

-- 
Best regards,
Andrey Skvortsov
